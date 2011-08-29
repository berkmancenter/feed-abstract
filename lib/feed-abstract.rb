$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'rss'

require 'feed-abstract/atom'
require 'feed-abstract/rdf'
require 'feed-abstract/rss'
require 'feed-abstract/feed'

