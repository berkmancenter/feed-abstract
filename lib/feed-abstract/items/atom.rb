# encoding: UTF-8

module Feed
  class Abstract

    #Nothing interesting. The classes in this namespace map the RSS::Parser object entries/items to the proper Feed::Abstract::Item classes. Perhap item-level transformations could be supported through this class in the future.
    class Items
      class Atom < Array
        attr_reader :feed, :items

        def initialize(feed)
          @feed = feed
          return [] if @feed.items.empty?
          @feed.items.each do|item|
            self << ::Feed::Abstract::Item::Atom.new(item)
          end
        end

      end
    end
  end
end
