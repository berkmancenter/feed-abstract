# encoding: UTF-8
module FeedAbstractMixins

  module RSS
  end

  module Atom

    def title
      @source.title.content
    end

    def link
      return '' if @source.link.nil?
      @source.link.href
    end

    def guid
      return '' if @source.id.nil?
      @source.id.content
    end

    def updated
      return '' if @source.updated.nil?
      @source.updated.content
    end

    def rights
      return '' if @source.rights.nil?
      @source.rights.content
    end

    def authors
      return [] if @source.authors.empty?
      @source.authors.collect{|au| au.name.content}
    end

    def author
      return '' if @source.authors.empty?
      @source.authors.collect{|au| au.name.content}.join(', ')
    end

    def categories
      return [] if @source.categories.empty?
      @source.categories.collect{|c| c.term}
    end

    def category
      return '' if @source.categories.empty?
      @source.categories.collect{|c| c.term}.join(', ')
    end

  end
end
