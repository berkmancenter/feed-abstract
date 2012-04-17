# encoding: UTF-8
require 'simplecov'
SimpleCov.start

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'feed-abstract'

def instantiate_feeds
  @docatom = FeedAbstract::Feed.new(File.open('spec/test_data/doc.atom'))
  @kpgatom = FeedAbstract::Feed.new(File.open('spec/test_data/katanapg.atom'))
  @djcprss2 = FeedAbstract::Feed.new(File.open('spec/test_data/djcp.rss'))
  @djcprss92 = FeedAbstract::Feed.new(File.open('spec/test_data/djcp.rss92'))
  @oa = FeedAbstract::Feed.new(File.open('spec/test_data/oa.africa.rss'))
  @delicious = FeedAbstract::Feed.new(File.open('spec/test_data/djcp_delicious.rss'))
  @zotero = FeedAbstract::Feed.new(File.open('spec/test_data/zotero.rss'))
  @feedburner = FeedAbstract::Feed.new(File.open('spec/test_data/feedburner.rss'))
  @pyblosxom = FeedAbstract::Feed.new(File.open('spec/test_data/pyblosxom.atom'))
  @chill = FeedAbstract::Feed.new(File.open('spec/test_data/chillingeffects.xml'))
  @twitter = FeedAbstract::Feed.new(File.open('spec/test_data/djcp_twitter.rss'))
  @twitter_atom = FeedAbstract::Feed.new(File.open('spec/test_data/twitter_hashtag.atom'))
  @feedburner_atom = FeedAbstract::Feed.new(File.open('spec/test_data/LawLibrarianBlog.atom'))
  
  @all_feeds = [@docatom, @kpgatom, @djcprss2, @djcprss92, @oa, @delicious, @zotero, @feedburner, @pyblosxom, @chill, @twitter, @twitter_atom, @feedburner_atom]
end

def instantiate_example_items
  @docatomitem = @docatom.items.first
  @kpgatomitem = @kpgatom.items.first
  @djcprss2item = @djcprss2.items.first
  @oaitem = @oa.items.first
  @deliciousitem = @delicious.items.first
  @zoteroitem = @zotero.items.first
  @feedburneritem = @feedburner.items.first
  @pyblosxomitem = @pyblosxom.items.first
  @chillitem = @chill.items.first
  @twitteritem = @twitter.items.first
  @twitteratomitem = @twitter_atom.items.first
  @feedburner_atom_item = @feedburner_atom.items.first
end
