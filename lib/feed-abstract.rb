$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'rss'

require 'feed-abstract/channel/atom'
require 'feed-abstract/channel/rdf'
require 'feed-abstract/channel/rss'
require 'feed-abstract/feed'

