class Feed
  class Abstract
    class RSSFeed
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
      alias :subtitle :description

      def generator
        return '' if @feed.generator.nil?
        @feed.generator.content
      end

      def link
        return '' if @feed.link.nil?
        @feed.link.href
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
        return [] if @feed.authors.empty?
        @feed.authors.collect{|au| au.name.content}
      end

      def author
        return '' if @feed.authors.empty?
        @feed.authors.collect{|au| au.name.content}.join(', ')
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
