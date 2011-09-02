# encoding: UTF-8

module FeedAbstract
  class Items
    class RDF < Array
      attr_reader :feed, :items

      def initialize(feed)
        @feed = feed
        return [] if @feed.items.empty?
        @feed.items.each do|item|
          self << ::FeedAbstract::Item::RDF.new(item)
        end
      end

    end
  end
end
