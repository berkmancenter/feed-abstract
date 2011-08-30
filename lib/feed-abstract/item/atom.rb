# encoding: UTF-8
class Feed
  class Abstract
    class Item
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
