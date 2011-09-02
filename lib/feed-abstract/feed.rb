# encoding: UTF-8

module Feed
  class ParserError < Exception
  end

  class Abstract

    # Feed::Abstract::Feed is the main class. It invokes RSS::Parser and negotiates which of the Feed::Abstract::Channel and Feed::Abstract::Item classes get dispatched to normalize the object graph of the feed you're parsing. 
    class Feed
      attr_reader :channel, :raw_feed, :items

      # If a feed can't be parsed, we'll throw a Feed::ParserError
      def initialize(xml = nil, options = {:do_validate => false})
        input = (xml.respond_to?(:read)) ? xml.read : xml
        @raw_feed = RSS::Parser.parse(input,options[:do_validate])
        if @raw_feed == nil
          raise Feed::ParserError
        end
        negotiate_channel_class
      end

      private 

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
