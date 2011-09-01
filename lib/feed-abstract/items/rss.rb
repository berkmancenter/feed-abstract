# encoding: UTF-8

module Feed
  class Abstract
    class Items
      class RSS < Array
        attr_reader :feed, :items

        def initialize(feed)
          @feed = feed
          return [] if @feed.items.empty?
          @feed.items.each do|item|
            self << ::Feed::Abstract::Item::RSS.new(item)
          end
        end

      end
    end
  end
end
