# encoding: UTF-8

module FeedAbstract

  # You don't want this class. You want FeedAbstract::Item::Atom, FeedAbstract::Item::RSS or FeedAbstract::Item::RDF.
  class Item

    # See FeedAbstractMixins::Atom for more instance methods.
    class Atom
      include FeedAbstractMixins::Atom
      attr_reader :item, :source, :channel

      def initialize(item,channel)
        @item = @source = item
        @channel = channel
      end

      # The full content of the item, most likely html.
      def content
        return '' if @item.content.nil?
        @item.content.content
      end

      # The contributor list as an array.
      def contributors
        return [] if @item.contributors.empty?
        @item.contributors.reject{|con| con.name.content == '' || con.name.content.match(/^\s+$/)}.collect{|c| c.name.content}
      end

      #The contributor list as a string joined with a comma.
      def contributor
        return '' if self.contributors.empty?
        self.contributors.join(', ')
      end

      def summary
        if self.channel.generator == 'Twitter'
          return self.title
        end
        return '' if @item.summary.nil?
        @item.summary.content
      end

      # A Time object
      def published
        return '' if @item.published.nil? && @item.created.nil?
        (@item.published.nil?) ? @item.created.content : @item.published.content
      end

    end
  end
end
