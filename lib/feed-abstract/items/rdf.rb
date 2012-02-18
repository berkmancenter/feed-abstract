# encoding: UTF-8

module FeedAbstract
  class Items
    class RDF < Array
      attr_reader :feed, :items

      def initialize(feed,channel)
        @feed = feed
        @channel = channel
        return [] if @feed.items.empty?
        @feed.items.each do|item|
          self << ::FeedAbstract::Item::RDF.new(item,channel)
        end
      end

    end
  end
end
