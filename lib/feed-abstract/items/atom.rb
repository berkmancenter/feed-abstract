# encoding: UTF-8

module FeedAbstract

  #Nothing interesting. The classes in this namespace map the RSS::Parser object entries/items to the proper FeedAbstract::Item classes. Perhap item-level transformations could be supported through this class in the future.
  class Items
    class Atom < Array
      attr_reader :feed, :items

      def initialize(feed,channel)
        @feed = feed
        @channel = channel
        return [] if @feed.items.empty?
        @feed.items.each do|item|
          self << ::FeedAbstract::Item::Atom.new(item,channel)
        end
      end

    end
  end
end
