# encoding: UTF-8
require 'simplecov'
SimpleCov.start

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'feed-abstract'

def instantiate_feeds
  @docatom = instantiate_feed('spec/test_data/doc.atom')
  @kpgatom = instantiate_feed('spec/test_data/katanapg.atom')
  @djcprss2 = instantiate_feed('spec/test_data/djcp.rss')
  @djcprss92 = instantiate_feed('spec/test_data/djcp.rss92')
  @oa = instantiate_feed('spec/test_data/oa.africa.rss')
  @delicious = instantiate_feed('spec/test_data/djcp_delicious.rss')
  @zotero = instantiate_feed('spec/test_data/zotero.rss')
  @feedburner = instantiate_feed('spec/test_data/feedburner.rss')
  @pyblosxom = instantiate_feed('spec/test_data/pyblosxom.atom')
  @chill = instantiate_feed('spec/test_data/chillingeffects.xml')
  @twitter = instantiate_feed('spec/test_data/djcp_twitter.rss')
  @twitter_atom = instantiate_feed('spec/test_data/twitter_hashtag.atom')
  @feedburner_atom = instantiate_feed('spec/test_data/LawLibrarianBlog.atom')

  @all_feeds = [@docatom, @kpgatom, @djcprss2, @djcprss92, @oa, @delicious, @zotero, @feedburner, @pyblosxom, @chill, @twitter, @twitter_atom, @feedburner_atom]
end

def instantiate_feed(file)
  FeedAbstract::Feed.new(
    File.read(file).encode(
      Encoding.find('UTF-8'), {invalid: :replace, undef: :replace, replace: ''}
    )
  )
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
