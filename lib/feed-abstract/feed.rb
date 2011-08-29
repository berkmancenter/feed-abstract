module Feed
  class ParserError < Exception
  end

  module Abstract
    class Feed
      attr_reader :channel, :raw_feed
      attr_writer :channel, :raw_feed

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
          self.channel = Atom.new(@raw_feed)
        elsif @raw_feed.class == RSS::RDF
          self.channel = RDF.new(@raw_feed)
          #rdf
        else
          #RSS::Rss
        end
      end

    end
  end
end
