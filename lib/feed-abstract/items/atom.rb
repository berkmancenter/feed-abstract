class Feed
  class Abstract
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
