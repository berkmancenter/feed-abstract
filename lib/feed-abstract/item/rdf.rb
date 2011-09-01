# encoding: UTF-8

module Feed
  class Abstract
    class Item
      class RDF < RSS

        def authors
          (@item.dc_creators.empty?) ? [] : @item.dc_creators.collect{|c| c.content}
        end

        def author
          return '' if self.authors.empty?
          self.authors.join(', ')
        end

        def categories
          return [] if @item.dc_subjects.empty?
          @item.dc_subjects.collect{|c| c.content}
        end

        def category
          return '' if self.categories.empty?
          self.categories.join(', ')
        end

        def updated
          return '' if @item.dc_date.nil?
          @item.dc_date
        end
        alias :published :updated

        def guid
          return '' if @item.about.nil?
          @item.about
        end


      end
    end
  end
end
