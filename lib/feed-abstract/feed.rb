# encoding: UTF-8

module Feed
  class ParserError < Exception
  end

  class Abstract

    # Feed::Abstract::Feed is the main class. It invokes RSS::Parser and negotiates which of the Feed::Abstract::Channel and Feed::Abstract::Item classes get dispatched to normalize the object graph of the feed you're parsing. 
    class Feed
      attr_reader :channel, :raw_feed, :items

      # === Parameters
      # * xml - a string or object instance that responds to <b>read</b>
      # * :do_validate - whether or not the feed should be validated. Passed through to RSS::Parser
      # * :ignore_unknown_element - passed through to RSS::Parser
      #
      # === Returns
      # An object with three attributes:
      # * channel - an instance of Feed::Abstract::Channel matching the type of feed we recognized
      # * items - an array of items matching the type of feed we recognized.
      # * raw_feed - the raw feed object returned by RSS::Parser, which might include RSS::Atom::Feed, RSS::RDF, or RSS::Rss
      # You will most likely be using the <b>channel</b> and <b>items</b> attributes.
      #
      # === Notes
      # If a feed can't be parsed, we'll throw a Feed::ParserError.
      #
      # == Examples
      #
      #  f = Feed::Abstract::Feed.new(File.open('/home/foo/xml/feed.rss2'))
      #  puts f.channel.title
      #  puts f.channel.description
      #
      #  f.items.each do|item|
      #   puts item.title
      #   puts item.link
      #  end
      #
      #  f = Feed::Abstract::Feed.new(File.open('/home/foo/xml/feed.atom'))
      #  puts f.channel.generator
      #
      #  puts "All tags / categories / subjects in this feed: " + f.items.collect{|i| i.categories}.flatten.uniq.sort.join(', ')
      #  
      #  f = Feed::Abstract::Feed.new(Net::HTTP.get(URI.parse('http://rss.slashdot.org/Slashdot/slashdot')))
      #  puts f.items.collect{|i| i.link}
      #   
      def initialize(xml = nil, options = {:do_validate => false, :ignore_unknown_element => true})
        input = (xml.respond_to?(:read)) ? xml.read : xml
        @raw_feed = RSS::Parser.parse(input,options[:do_validate], options[:ignore_unknown_element])
        if @raw_feed == nil
          raise Feed::ParserError
        end
        negotiate_channel_class
      end

      private 

      #Here's an easy extension point for custom parsers.
      def negotiate_channel_class
        if @raw_feed.class == RSS::Atom::Feed
          @channel = Channel::Atom.new(@raw_feed)
          @items = Items::Atom.new(@raw_feed)
        elsif @raw_feed.class == RSS::RDF
          @channel = Channel::RDF.new(@raw_feed)
          @items = Items::RDF.new(@raw_feed)
        else
          @channel = Channel::RSS.new(@raw_feed)
          @items = Items::RSS.new(@raw_feed)
        end
      end

    end
  end
end
