# encoding: UTF-8

module FeedAbstract
  class Channel
    class RSS
      include FeedAbstractMixins::RSS
      attr_reader :feed, :source

      def initialize(feed)
        @feed = @source = feed
      end

      def title
        @feed.channel.title
      end

      def language
        return '' if @feed.channel.language.nil?
        @feed.channel.language
      end

      def description
        @feed.channel.description
      end
      alias :subtitle :description

      # The generator of this feed as a string. Sometimes a URL, sometimes a string (e.g. the application name).
      def generator
        if ! @feed.channel.generator.nil? && @feed.channel.generator.match(/wordpress\.org/i)
          return 'WordPress'
        elsif @feed.channel.link.match(/www\.delicious\.com/i)
          return 'Delicious'
        end
        return '' if @feed.channel.generator.nil?
        @feed.channel.generator
      end

      def link
        return '' if @feed.channel.link.nil?
        @feed.channel.link
      end

      # Copyright info.
      def rights
        return '' if @feed.channel.copyright.nil? && @feed.channel.dc_rights.nil?
        [@feed.channel.copyright,@feed.channel.dc_rights].compact.join(' ')
      end

      # A Time object.
      def updated
        return '' if @feed.channel.lastBuildDate.nil? && @feed.channel.pubDate.nil?
        (@feed.channel.lastBuildDate.nil?) ? @feed.channel.pubDate : @feed.channel.lastBuildDate
      end

      # A globally unique ID for this feed. A URL in this case.
      def guid
        return '' if @feed.channel.link.nil?
        @feed.channel.link
      end

      # The authors (a merge of the RSS managingEditor and dc:publisher elements) as an array.
      def authors
        return [] if @feed.channel.managingEditor.nil? && @feed.channel.dc_publishers.empty?
        [@feed.channel.managingEditor, @feed.channel.dc_publishers].flatten.uniq
      end

      # The author list joined with a comma.
      def author
        return '' if self.authors.empty?
        self.authors.join(', ')
      end

      # The category list (a merge of the RSS category and dc:subject elements) as an array. 
      def categories
        return [] if @feed.channel.categories.empty? && @feed.channel.dc_subjects.empty?
        [@feed.channel.categories, @feed.channel.dc_subjects].flatten.uniq.collect{|c| c.content}
      end

      # The category list as a string, joined with a comma.
      def category
        return '' if @feed.channel.categories.empty?
        @feed.channel.categories.collect{|c| c.content}.join(', ')
      end

      # A URL to an icon representing this feed.
      def icon
        return '' if @feed.channel.image.nil?
        @feed.channel.image.url
      end
      alias :logo :icon 

    end
  end
end
