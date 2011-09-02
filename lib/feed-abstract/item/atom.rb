# encoding: UTF-8

module Feed
  class Abstract

    # You don't want this class. You want Feed::Abstract::Item::Atom, Feed::Abstract::Item::RSS or  Feed::Abstract::Item::RDF.
    class Item

      # See Feed::AbstractMixins::Atom for more instance methods.
      class Atom
        include Feed::AbstractMixins::Atom
        attr_reader :item, :source

        def initialize(item)
          @item = @source = item
        end

        # The full content of the item, most likely html.
        def content
          return '' if @item.content.nil?
          @item.content.content
        end

        # The contributor list as an array.
        def contributors
          return [] if @item.contributors.empty?
          @item.contributors.collect{|c| c.name.content}
        end

        #The contributor list as a strong joined with a comma.
        def contributor
          return '' if @item.contributors.empty?
          @item.contributors.collect{|c| c.name.content}.join(', ')
        end

        def summary
          return '' if @item.summary.nil?
          @item.summary.content
        end

        # A Time object
        def published
          return '' if @item.published.nil?
          @item.published.content
        end

      end
    end
  end
end
