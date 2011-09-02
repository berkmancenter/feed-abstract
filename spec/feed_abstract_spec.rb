# encoding: UTF-8

require 'spec_helper'
module FeedAbstract

  describe Feed do

    it "should be able to instantiate" do
      Feed.respond_to?(:new).should == true
    end

    it "should recognize atom feeds properly" do
      feed = Feed.new(File.open('spec/test_data/doc.atom'))
      feed.channel.class.should == Channel::Atom
    end

    it "should recognize rss feeds properly" do
      feed = Feed.new(File.open('spec/test_data/djcp.rss'))
      feed.channel.class.should == Channel::RSS
      feed = Feed.new(File.open('spec/test_data/djcp_delicious.rss'))
    end

    it "should recognize rdf feeds properly" do
      feed = Feed.new(File.open('spec/test_data/oa.africa.rss'))
      feed.channel.class.should == Channel::RDF
    end

  end

end
