module Feed
  module Abstract
    class AtomChannel
      attr_reader :feed
      attr_writer :feed

      def initialize(feed)
        @feed = feed
      end

      def title
        @feed.title.content
      end

      def description
        @feed.subtitle.content
      end

      def generator
        @feed.generator.content
      end

      def link
        @feed.link.href
      end

      def rights
        @feed.rights.content
      end

    end
  end
end
