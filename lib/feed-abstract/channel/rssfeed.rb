# encoding: UTF-8

class Feed
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
          return '' if @feed.channel.generator.nil?
          if @feed.channel.generator.match(/wordpress\.org/i)
            return 'WordPress'
          end
          @feed.channel.generator
        end

        def link
          return '' if @feed.channel.link.nil?
          @feed.channel.link
        end

        def rights
          return '' if @feed.channel.copyright.nil?
          @feed.channel.copyright
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
          return [] if @feed.channel.managingEditor.empty?
          [@feed.channel.managingEditor]
        end

        def author
          return '' if @feed.channel.managingEditor.empty?
          @feed.channel.managingEditor
        end

        def categories
          return [] if @feed.channel.categories.empty?
          @feed.channel.categories.collect{|c| c.content}
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
