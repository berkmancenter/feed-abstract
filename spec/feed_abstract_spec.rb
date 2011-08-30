require 'spec_helper'
class Feed::Abstract

  describe Feed do

    it "should be able to instantiate" do
      Feed.respond_to?(:new).should == true
    end

    it "should recognize atom feeds properly" do
      feed = Feed.new(File.read('spec/test_data/doc.atom'))
      feed.channel.class.should == Channel::Atom
    end

    it "should recognize rss feeds properly" do
      feed = Feed.new(File.read('spec/test_data/djcp.rss'))
      feed.channel.class.should == Channel::RSSFeed
    end

  end

end
