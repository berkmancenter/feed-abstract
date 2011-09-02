# encoding: UTF-8

module Feed
  module AbstractMixins

    module RSS
    end

    # Instance methods shared between Feed::Abstract::Channel::Atom and Feed::Abstract::Item::Atom
    module Atom

      def title
        @source.title.content
      end

      def link
        return '' if @source.link.nil?
        @source.link.href
      end

      # A globally unique ID to this resource, usually (but not always) a URL.
      def guid
        return '' if @source.id.nil?
        @source.id.content
      end

      # A Time object representing when resource was updated.
      def updated
        return '' if @source.updated.nil?
        @source.updated.content
      end

      # Copyright info.
      def rights
        return '' if @source.rights.nil?
        @source.rights.content
      end

      # An array of author names
      def authors
        return [] if @source.authors.empty?
        @source.authors.collect{|au| au.name.content}
      end

      # The authors list as a string, joined with a comma.
      def author
        return '' if self.authors.empty?
        self.authors.join(', ')
      end

      # The categories list as an array.
      def categories
        return [] if @source.categories.empty?
        @source.categories.collect{|c| c.term}
      end

      # The categories list as a string joined with a comma.
      def category
        return '' if self.categories.empty?
        self.categories.join(', ')
      end

    end

  end
end
