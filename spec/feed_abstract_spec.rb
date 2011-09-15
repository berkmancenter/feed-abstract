# encoding: UTF-8

require 'spec_helper'
module FeedAbstract

  describe Feed do
    before(:all) do
      instantiate_feeds
    end

    it "should be able to instantiate" do
      Feed.respond_to?(:new).should == true
    end

    it "should recognize atom feeds properly" do
      @docatom.channel.class.should == Channel::Atom
      @kpgatom.channel.class.should == Channel::Atom
      @pyblosxom.channel.class.should == Channel::Atom
    end

    it "should recognize rss feeds properly" do
      @djcprss2.channel.class.should == Channel::RSS
      @djcprss92.channel.class.should == Channel::RSS
      @delicious.channel.class.should == Channel::RSS
    end

    it "should recognize rdf feeds properly" do
      @oa.channel.class.should == Channel::RDF
      @chill.channel.class.should == Channel::RDF
    end

    it "should have items" do
      @all_feeds.each do|feed|
        feed.should respond_to :items
      end
    end

  end

end
