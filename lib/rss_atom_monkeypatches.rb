module RSS
  module Atom
    class Feed
      class Modified < RSS::Element
        include CommonModel
        include DateConstruct
      end
      class Created < RSS::Element
        include CommonModel
        include DateConstruct
      end
      class Tagline < RSS::Element
        include CommonModel
        include TextConstruct
      end
      install_get_attribute('created', '?', :child, :content)
      install_get_attribute('modified', '?', :child, :content)
      install_get_attribute('tagline', nil, nil, :content)

      class Entry
        install_get_attribute('created', '?', :child, :content)
        install_get_attribute('modified', '?', :child, :content)
        Modified = RSS::Atom::Feed::Modified
        Created = RSS::Atom::Feed::Created
      end
    end
  end
end
