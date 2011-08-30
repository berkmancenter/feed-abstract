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

    it "should recognize rss feeds properly" do
      feed = Feed.new(File.read('spec/test_data/djcp.rss'))
      feed.channel.class.should == RSSFeed
    end

  end

  describe 'Feeds' do
    before(:all) do
      @docatom = Feed.new(File.read('spec/test_data/doc.atom'))
      @kpgatom = Feed.new(File.read('spec/test_data/katanapg.atom'))
      @djcprss2 = Feed.new(File.read('spec/test_data/djcp.rss'))
    end

    [:title, :subtitle, :description, :link, :generator, :authors, :author, :categories,  :category, :icon, :logo, :rights, :updated, :guid].each do|att|
      it { @docatom.channel.should respond_to att}
      it { @djcprss2.channel.should respond_to att}
    end

    it "should have the correct title" do
      @docatom.channel.title.should == 'Doc Searls Weblog'
      @kpgatom.channel.title.should == 'Katana Photo Groups: (Latest Updates)'
      @djcprss2.channel.title.should == 'Dan Collis-Puro'
    end

    it "should have the correct subtitle and description" do
      @docatom.channel.subtitle.should == 'Same old blog, brand new place'
      @docatom.channel.description.should == 'Same old blog, brand new place'

      @kpgatom.channel.subtitle.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'
      @kpgatom.channel.description.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'

      @djcprss2.channel.subtitle.should == 'Tech. Open Source. Stuff that doesn\'t suck.'
      @djcprss2.channel.description.should == 'Tech. Open Source. Stuff that doesn\'t suck.'
    end

    it "should have the correct link" do
      @docatom.channel.link.should == 'http://blogs.law.harvard.edu/doc'
      @kpgatom.channel.link.should == 'http://www.katanapg.com/latest'
      @djcprss2.channel.link.should == 'http://blogs.law.harvard.edu/djcp'
    end

    it "should have the correct generator" do
      @docatom.channel.generator.should == 'WordPress'
      @kpgatom.channel.generator.should == ''
      @djcprss2.channel.generator.should == 'WordPress'
    end

    it "should have the correct authors" do
      @docatom.channel.authors.should == ['Doc Searls']
      @kpgatom.channel.authors.should == ['Nick Pappas']
      @djcprss2.channel.authors.should == ['DJCP']

      @docatom.channel.author.should == 'Doc Searls'
      @kpgatom.channel.author.should == 'Nick Pappas'
      @djcprss2.channel.author.should == 'DJCP'

    end

    it "should have the correct categories" do
      @docatom.channel.categories.should == []
      @kpgatom.channel.categories.should == ['photos']

      @docatom.channel.category.should == ''
      @kpgatom.channel.category.should == 'photos'
    end

    it "should have the correct icon" do
      @docatom.channel.icon.should == ''
      @kpgatom.channel.icon.should == '/favicon.ico'
    end

    it "should have the correct logo" do
      @docatom.channel.logo.should == ''
      @kpgatom.channel.logo.should == '/images/rss.gif'
    end

    it "should have the correct rights" do
      @docatom.channel.rights.should == ''
      @kpgatom.channel.rights.should == ''
    end

    it "should have the correct updated value" do
      @docatom.channel.updated.should == Time.parse('2011-07-29 12:33:29 UTC')
      @kpgatom.channel.updated.should == Time.parse('2011-08-24 23:59:40 -0400')
    end

    it "should have the correct guid" do
      @docatom.channel.guid.should == 'http://blogs.law.harvard.edu/doc/feed/atom/'
      @kpgatom.channel.guid.should == 'urn:uuid:www.katanapg.com-latest-xml'
    end
  end
end
