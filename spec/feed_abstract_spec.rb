require 'spec_helper'
class Feed::Abstract

  describe Feed do

    it "should be able to instantiate" do
      Feed.respond_to?(:new).should == true
    end

    it "should recognize atom feeds properly" do
      feed = Feed.new(File.read('spec/test_data/doc.atom'))
      feed.channel.class.should == Atom
    end

    it "should recognize rdf feeds properly" do
      feed = Feed.new(File.read('spec/test_data/djcp.rss'))
      feed.channel.class.should == RSSFeed
    end

  end

  describe RSS do
    before(:all) do
      @djcp = Feed.new(File.read('spec/test_data/djcp.rss'))
    end
  end

  describe Atom do
    before(:all) do
      @doc = Feed.new(File.read('spec/test_data/doc.atom'))
      @kpg = Feed.new(File.read('spec/test_data/katanapg.atom'))
    end

    [:title, :subtitle, :description, :link, :generator, :authors, :author, :categories,  :category, :icon, :logo, :rights, :updated, :guid].each do|att|
      it { @doc.channel.should respond_to att}
    end

    it "should have the correct title" do
      @doc.channel.title.should == 'Doc Searls Weblog'
      @kpg.channel.title.should == 'Katana Photo Groups: (Latest Updates)'
    end

    it "should have the correct subtitle and description" do
      @doc.channel.subtitle.should == 'Same old blog, brand new place'
      @doc.channel.description.should == 'Same old blog, brand new place'

      @kpg.channel.subtitle.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'
      @kpg.channel.description.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'
    end

    it "should have the correct link" do
      @doc.channel.link.should == 'http://blogs.law.harvard.edu/doc'
      @kpg.channel.link.should == 'http://www.katanapg.com/latest'
    end

    it "should have the correct generator" do
      @doc.channel.generator.should == 'WordPress'
      @kpg.channel.generator.should == ''
    end

    it "should have the correct authors" do
      @doc.channel.authors.should == ['Doc Searls']
      @kpg.channel.authors.should == ['Nick Pappas']

      @doc.channel.author.should == 'Doc Searls'
      @kpg.channel.author.should == 'Nick Pappas'
    end

    it "should have the correct categories" do
      @doc.channel.categories.should == []
      @kpg.channel.categories.should == ['photos']

      @doc.channel.category.should == ''
      @kpg.channel.category.should == 'photos'
    end

    it "should have the correct icon" do
      @doc.channel.icon.should == ''
      @kpg.channel.icon.should == '/favicon.ico'
    end

    it "should have the correct logo" do
      @doc.channel.logo.should == ''
      @kpg.channel.logo.should == '/images/rss.gif'
    end

    it "should have the correct rights" do
      @doc.channel.rights.should == ''
      @kpg.channel.rights.should == ''
    end

    it "should have the correct updated value" do
      @doc.channel.updated.should == Time.parse('2011-07-29 12:33:29 UTC')
      @kpg.channel.updated.should == Time.parse('2011-08-24 23:59:40 -0400')
    end

    it "should have the correct guid" do
      @doc.channel.guid.should == 'http://blogs.law.harvard.edu/doc/feed/atom/'
      @kpg.channel.guid.should == 'urn:uuid:www.katanapg.com-latest-xml'
    end
  end
end
