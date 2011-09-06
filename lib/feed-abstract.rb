# encoding: UTF-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'rss'
require 'iconv'

require "feed-abstract/version"
require 'feed-abstract/mixins'

require 'feed-abstract/channel/atom'
require 'feed-abstract/channel/rss'
require 'feed-abstract/channel/rdf'

require 'feed-abstract/items/rss'
require 'feed-abstract/items/atom'
require 'feed-abstract/items/rdf'

require 'feed-abstract/item/rss'
require 'feed-abstract/item/atom'
require 'feed-abstract/item/rdf'

require 'feed-abstract/feed'


#RSS::Rss::Channel::Item.class_eval{
#  def foobar
#    'asdfasdf'
#  end
#}

#RSS::Rss::Channel::Item.instance_eval{
#  install_get_attribute('category', '', false )
#}
