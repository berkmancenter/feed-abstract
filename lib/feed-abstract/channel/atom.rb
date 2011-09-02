# encoding: UTF-8

module Feed
  class Abstract

    # You don't want this class. You want Feed::Abstract::Channel::Atom, Feed::Abstract::Channel::RSS or Feed::Abstract::Channel::RDF.
    class Channel

      # See Feed::AbstractMixins::Atom for more instance methods.
      class Atom
        include Feed::AbstractMixins::Atom

        attr_reader :feed, :source

        def initialize(feed)
          @feed = @source = feed
        end

        def description
          @feed.subtitle.content
        end
        alias :subtitle :description

        # A string representing the application that created this feed.
        def generator
          return '' if @feed.generator.nil?
          @feed.generator.content
        end

        # A URL (perhaps with domain, depending on input) representing an icon for the feed.
        def icon
          return '' if @feed.icon.nil?
          @feed.icon.content
        end

        # A URL (perhaps with domain, depending on input) representing a logo for the feed.
        def logo
          return '' if @feed.logo.nil?
          @feed.logo.content
        end

      end
    end


  end
end
