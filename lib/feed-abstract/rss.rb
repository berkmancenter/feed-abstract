class Feed
  class Abstract
    class RSSFeed
      attr_reader :feed
      attr_writer :feed

      def initialize(feed)
        @feed = feed
      end

      def title
        @feed.channel.title
      end

      def description
        @feed.channel.description
      end
      alias :subtitle :description

      def generator
        return '' if @feed.channel.generator.nil?
        if @feed.channel.generator.match(/wordpress\.org/)
          return 'WordPress'
        end
        @feed.channel.generator
      end

      def link
        return '' if @feed.channel.link.nil?
        @feed.channel.link
      end

      def rights
        return '' if @feed.rights.nil?
        @feed.rights.content
      end

      def updated
        return '' if @feed.updated.nil?
        @feed.updated.content
      end

      def guid
        return '' if @feed.id.nil?
        @feed.id.content
      end

      def authors
        return [] if @feed.channel.managingEditor.empty?
        [@feed.channel.managingEditor]
      end

      def author
        return '' if @feed.channel.managingEditor.empty?
        @feed.channel.managingEditor
      end

      def categories
        return [] if @feed.categories.empty?
        @feed.categories.collect{|c| c.term}
      end
      
      def category
        return '' if @feed.categories.empty?
        @feed.categories.first.term
      end

      def icon
        return '' if @feed.icon.nil?
        @feed.icon.content
      end

      def logo
        return '' if @feed.logo.nil?
        @feed.logo.content
      end

    end
  end
end
