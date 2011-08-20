$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'rss'

require 'feed-abstract/atom_channel'
require 'feed-abstract/feed'

