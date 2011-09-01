# encoding: UTF-8

module Feed
  class ParserError < Exception
  end

  class Abstract
    class Feed
      attr_reader :channel, :raw_feed, :items
      attr_writer :channel, :raw_feed, :items

      def initialize(xml = nil, options = {:do_validate => false})
        input = (xml.respond_to?(:read)) ? xml.read : xml
        @raw_feed = RSS::Parser.parse(input,options[:do_validate])
        if @raw_feed == nil
          raise Feed::ParserError
        end
        negotiate_channel_class
      end

      def negotiate_channel_class
        if @raw_feed.class == RSS::Atom::Feed
          self.channel = Channel::Atom.new(@raw_feed)
          self.items = Items::Atom.new(@raw_feed)
        elsif @raw_feed.class == RSS::RDF
          self.channel = Channel::RDF.new(@raw_feed)
          self.items = Items::RDF.new(@raw_feed)
        else
          self.channel = Channel::RSSFeed.new(@raw_feed)
          self.items = Items::RSS.new(@raw_feed)
        end
      end

    end
  end
end
