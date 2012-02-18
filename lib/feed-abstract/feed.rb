# encoding: UTF-8

module FeedAbstract
  class ParserError < Exception
  end

  # FeedAbstract:::Feed is the main class. It invokes RSS::Parser and negotiates which of the FeedAbstract::Channel and FeedAbstract::Item classes get dispatched to normalize the object graph of the feed you're parsing. 
  class Feed
    attr_reader :channel, :raw_feed, :items

    # === Parameters
    # * xml - a string or object instance that responds to <b>read</b>
    # * :do_validate - whether or not the feed should be validated. Passed through to RSS::Parser. Defaults to false.
    # * :ignore_unknown_element - passed through to RSS::Parser. Defaults to true.
    # * :input_encoding - Defaults to "UTF-8". This is the encoding of the feed as passed to FeedAbstract::Feed.new
    # * :output_encoding - Defaults to "UTF-8". This is the encoding of the feed as it's passed to the underlying parser - generally you should keep this as "UTF-8".
    # * :force_encoding - Force input text to be UTF-8 (or whatever you set :output_encoding to), removing invalid byte sequences before passing to RSS::Parser. Defaults to true because RSS::Parser will thrown an error if it sees invalid byte sequences.
    # * :transliterate_characters - Ask Iconv to transliterate unknown characters when forcing encoding conversion. This only works reliably when you set the :input_encoding properly. Defaults to false and should probably be left there because it's quirky and doesn't appear to work reliably.
    #
    # === Returns
    # An object with three attributes:
    # * channel - an instance of FeedAbstract::Channel matching the type of feed we recognized
    # * items - an array of items matching the type of feed we recognized.
    # * raw_feed - the raw feed object returned by RSS::Parser, which might include RSS::Atom::Feed, RSS::RDF, or RSS::Rss
    # You will most likely be using the <b>channel</b> and <b>items</b> attributes.
    #
    # === Notes
    # * If a feed can't be parsed, we'll throw a FeedAbstract::ParserError.
    # * All dates are returned as Time objects. You will need to convert if you're using ActiveRecord as it expects DateTime objects - fortunately this is very easy via the 'to_datetime' extension that ActiveRecord provides.
    #
    #  feed = FeedAbstract::Feed.new(feed_xml_string)
    #  feed.items.each do |item|
    #    fi = FeedItem.new #Your feed item model.
    #    if item.updated.respond_to?(:to_datetime) #There's a date instead of an empty string
    #      fi.last_updated = item.updated.to_datetime # <<--- here! 
    #    end
    #    #More happens. . . 
    #    fi.save
    #  end
    #
    # == Examples
    #
    #  f = FeedAbstract::Feed.new(File.open('/home/foo/xml/feed.rss2'))
    #  puts f.channel.title
    #  puts f.channel.description
    #
    #  f.items.each do|item|
    #   puts item.title
    #   puts item.link
    #  end
    #
    #  f = FeedAbstract::Feed.new(File.open('/home/foo/xml/feed.atom'))
    #  puts f.channel.generator
    #
    #  puts "All tags / categories / subjects in this feed: " + f.items.collect{|i| i.categories}.flatten.uniq.sort.join(', ')
    #  
    #  f = FeedAbstract::Feed.new(Net::HTTP.get(URI.parse('http://rss.slashdot.org/Slashdot/slashdot')))
    #  puts f.items.collect{|i| i.link}
    #   
    def initialize(xml = nil, opts = {})
      options = {
        :do_validate => false, 
        :ignore_unknown_element => true, 
        :input_encoding => 'UTF-8', 
        :output_encoding => 'UTF-8', 
        :force_encoding => true, 
        :transliterate_characters => false
      }.merge(opts)

      input = (xml.respond_to?(:read)) ? xml.read : xml

      if options[:force_encoding]
        ic = Iconv.new(options[:output_encoding].upcase + ((options[:transliterate_characters]) ? '//TRANSLIT' : '') + '//IGNORE',options[:input_encoding].upcase)
        if input.respond_to?(:encoding)
          # ruby 1.9
          # Only transcode if the encoding isn't valid.
          # See: http://po-ru.com/diary/fixing-invalid-utf-8-in-ruby-revisited/ for why we're appending the extra space.
          unless (input.encoding.to_s.upcase == options[:output_encoding].upcase && input.valid_encoding?)
            input = ic.iconv(input << ' ')[0..-2]
          end
        else
          # ruby 1.8
          input = ic.iconv(input << ' ')[0..-2]
        end
      end

      @raw_feed = RSS::Parser.parse(input,options[:do_validate], options[:ignore_unknown_element])
      if @raw_feed == nil
        raise FeedAbstract::ParserError
      end
      negotiate_channel_class
    end

    private 

    #Here's an easy extension point for custom parsers.
    def negotiate_channel_class
      if @raw_feed.class == RSS::Atom::Feed
        @channel = Channel::Atom.new(@raw_feed)
        @items = Items::Atom.new(@raw_feed,@channel)
      elsif @raw_feed.class == RSS::RDF
        @channel = Channel::RDF.new(@raw_feed)
        @items = Items::RDF.new(@raw_feed,@channel)
      else
        @channel = Channel::RSS.new(@raw_feed)
        @items = Items::RSS.new(@raw_feed,@channel)
      end
    end

  end
end
