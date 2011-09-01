# encoding: UTF-8

module Feed
  class Abstract
    class Channel
      class RSSFeed
        include FeedAbstractMixins::RSS
        attr_reader :feed, :source

        def initialize(feed)
          @feed = @source = feed
        end

        def title
          @feed.channel.title
        end

        def description
          @feed.channel.description
        end
        alias :subtitle :description

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

        def rights
          return '' if @feed.channel.copyright.nil? && @feed.channel.dc_rights.nil?
          [@feed.channel.copyright,@feed.channel.dc_rights].compact.join(' ')
        end

        def updated
          return '' if @feed.channel.lastBuildDate.nil?
          @feed.channel.lastBuildDate
        end

        def guid
          return '' if @feed.channel.link.nil?
          @feed.channel.link
        end

        def authors
          return [] if @feed.channel.managingEditor.nil? && @feed.channel.dc_publishers.empty?
          [@feed.channel.managingEditor, @feed.channel.dc_publishers].flatten.uniq
        end

        def author
          return '' if self.authors.empty?
          self.authors.join(', ')
        end

        def categories
          return [] if @feed.channel.categories.empty? && @feed.channel.dc_subjects.empty?
          [@feed.channel.categories, @feed.channel.dc_subjects].flatten.uniq.collect{|c| c.content}
        end

        def category
          return '' if @feed.channel.categories.empty?
          @feed.channel.categories.collect{|c| c.content}.join(', ')
        end

        def icon
          return '' if @feed.channel.image.nil?
          @feed.channel.image.url
        end
        alias :logo :icon 

      end
    end
  end
end
