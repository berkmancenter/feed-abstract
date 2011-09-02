# encoding: UTF-8

module Feed
  class Abstract

    # You don't want this class. You want Feed::Abstract::Item::Atom, Feed::Abstract::Item::RSS or  Feed::Abstract::Item::RDF.
    class Item

      # See FeedAbstractMixins::Atom for more instance methods.
      class Atom
        include FeedAbstractMixins::Atom
        attr_reader :item, :source

        def initialize(item)
          @item = @source = item
        end

        def content
          return '' if @item.content.nil?
          @item.content.content
        end

        def contributors
          return [] if @item.contributors.empty?
          @item.contributors.collect{|c| c.name.content}
        end

        def contributor
          return '' if @item.contributors.empty?
          @item.contributors.collect{|c| c.name.content}.join(', ')
        end

        def summary
          return '' if @item.summary.nil?
          @item.summary.content
        end

        def published
          return '' if @item.published.nil?
          @item.published.content
        end

      end
    end
  end
end
