# encoding: UTF-8

module Feed
  class Abstract
    class Item
      class RSS

        include FeedAbstractMixins::RSS
        attr_reader :item, :source

        def initialize(item)
          @item = @source = item
        end

        def title
          return '' if @item.title.nil?
          @item.title
        end
        
        def content
          return '' if @item.content_encoded.nil?
          @item.content_encoded
        end

        def summary
          return '' if @item.description.nil?
          @item.description
        end

        def link
          @item.link
        end

        def author
          (self.authors.empty?) ? '' : self.authors.join(', ')
        end

        def authors
          [@item.author, @item.dc_creators.collect{|c| c.content}].flatten.uniq.compact
        end

        def contributors
          (@item.dc_contributors.empty?) ? [] : @item.dc_contributors
        end

        def contributor
          (@item.dc_contributors.empty?) ? '' : @item.dc_contributors.join(', ')
        end

        def categories
          return [] if @item.categories.empty?
          @item.categories.collect{|c| c.content}
        end

        def category
          return '' if @item.categories.empty?
          @item.categories.collect{|c| c.content}.join(', ')
        end

        def rights
          (@item.dc_rights.nil?) ? '' : @item.dc_rights
        end

        def updated
          (@item.pubDate.nil?) ? '' : @item.pubDate
        end
        alias :published :updated

        def guid
          return '' if @item.guid.nil?
          @item.guid.content
        end

      end
    end
  end
end
