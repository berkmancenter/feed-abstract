# encoding: UTF-8

module FeedAbstract
  class Item
    class RSS

      include FeedAbstractMixins::RSS
      attr_reader :item, :source, :channel

      def initialize(item,channel)
        @item = @source = item
        @channel = channel
      end

      def title
        return '' if @item.title.nil?
        @item.title
      end

      # The full content of this item, theoretically.
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

      # The author list (a merge of the RSS author and dc:creator elements) as an array.
      def authors
        if self.channel.generator == 'Twitter'
          return [@item.title.split(':')[0]]
        end
        [@item.author, ((@item.dc_creators.empty?) ? nil : @item.dc_creators.collect{|c| c.content})].flatten.uniq.compact.reject{|au| au == '' || au.match(/^\s+$/)}
      end

      # The author list as a string, joined with a comma.
      def author
        (self.authors.empty?) ? '' : self.authors.join(', ')
      end

      # The contributors (parsed from the dc:contributor element) as an array.
      def contributors
        (@item.dc_contributors.empty?) ? [] : @item.dc_contributors.reject{|au| au == '' || au.match(/^\s+$/)}
      end

      # The contributor list as a string joined with a comma.
      def contributor
        (self.contributors.empty?) ? '' : self.contributors.join(', ')
      end

      # The category list as an array.
      def categories
        if self.channel.generator == 'Twitter'
          return @item.title.scan(/#([^#\s]+)/).flatten
        end
        return [] if @item.categories.empty?
        @item.categories.collect{|c| c.content}.reject{|c| c == '' || c.match(/^\s+$/)}
      end

      # The category list as a string, joined with a comma.
      def category
        if self.channel.generator == 'Twitter'
          return self.categories.join(', ')
        end
        return '' if @item.categories.empty? 
        @item.categories.collect{|c| c.content}.join(', ')
      end

      # Copyright info.
      def rights
        (@item.dc_rights.nil?) ? '' : @item.dc_rights
      end

      def updated
        (@item.pubDate.nil?) ? '' : @item.pubDate
      end
      alias :published :updated

      # A globally unique id.
      def guid
        return '' if @item.guid.nil?
        @item.guid.content
      end

    end
  end
end
