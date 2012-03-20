# encoding: UTF-8

module FeedAbstractMixins

  module RSS
  end

  # Instance methods shared between FeedAbstract::Channel::Atom and FeedAbstract::Item::Atom
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
      if self.respond_to?(:channel) && self.channel.generator == 'Twitter'
        return [@source.author.name.content.split(' ')[0]]
      end
      return [] if @source.authors.empty?
      @source.authors.collect{|au| au.name.content}.reject{|au| au == '' || au.match(/^\s+$/)}
    end

    # The authors list as a string, joined with a comma.
    def author
      return '' if self.authors.empty?
      self.authors.join(', ')
    end

    # The categories list as an array.
    def categories
      if self.respond_to?(:channel) && self.channel.generator == 'Twitter'
        return @source.title.content.scan(/#([^#\s]+)/).flatten
      end
      return [] if @source.categories.empty?
      @source.categories.collect{|c| c.term}.reject{|c| c == '' || c.match(/^\s+$/)}
    end

    # The categories list as a string joined with a comma.
    def category
      return '' if self.categories.empty?
      self.categories.join(', ')
    end

  end

end
