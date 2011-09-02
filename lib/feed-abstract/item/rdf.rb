# encoding: UTF-8

module FeedAbstract
  class Item
    class RDF < RSS

      # The author list (from the dc:creator element) as an array.
      def authors
        (@item.dc_creators.empty?) ? [] : @item.dc_creators.collect{|c| c.content}
      end

      # The author list as a string, joined with a comma.
      def author
        return '' if self.authors.empty?
        self.authors.join(', ')
      end

      # The category list (parsed from the dc:subject element) as an array.
      def categories
        return [] if @item.dc_subjects.empty?
        @item.dc_subjects.collect{|c| c.content}
      end

      # The category list as a string, joined with a comma.
      def category
        return '' if self.categories.empty?
        self.categories.join(', ')
      end

      # A Time object.
      def updated
        return '' if @item.dc_date.nil?
        @item.dc_date
      end
      alias :published :updated

      # A globally unique id, in this case probably a URL.
      def guid
        return '' if @item.about.nil?
        @item.about
      end


    end
  end
end
