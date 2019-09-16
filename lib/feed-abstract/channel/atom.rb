# encoding: UTF-8

module FeedAbstract

  # You don't want this class. You want FeedAbstract::Channel::Atom, FeedAbstract::Channel::RSS or FeedAbstract::Channel::RDF.
  class Channel

    # See FeedAbstractMixins::Atom for more instance methods.
    class Atom
      include FeedAbstractMixins::Atom

      attr_reader :feed, :source

      def initialize(feed)
        @feed = @source = feed
      end

      def language
        return '' if @feed.lang.nil?
        @feed.lang
      end

      def description
        return '' if @feed.subtitle.nil? && @feed.tagline.nil?
        (@feed.subtitle.nil?) ? @feed.tagline.content : @feed.subtitle.content
      end
      alias :subtitle :description

      # A string representing the application that created this feed.
      def generator
        unless self.link.nil?
          if self.link.match(/zotero\.org/)
            return 'Zotero'
          elsif self.link.match(/wordpress\.com/)
            return 'WordPress'
          elsif self.link.match(/https?:\/\/.*\.?twitter\.com/i)
            return 'Twitter'
          end
        end
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
