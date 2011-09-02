# encoding: UTF-8

module Feed
  class Abstract
    class Channel

      # See FeedAbstractMixins::Atom for more instance methods.
      class Atom
        include FeedAbstractMixins::Atom

        attr_reader :feed, :source

        def initialize(feed)
          @feed = @source = feed
        end

        def description
          @feed.subtitle.content
        end
        alias :subtitle :description

        def generator
          return '' if @feed.generator.nil?
          @feed.generator.content
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
end
