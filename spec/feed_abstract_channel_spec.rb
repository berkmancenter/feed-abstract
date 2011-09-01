require 'spec_helper'
class Feed::Abstract

  describe 'Channels' do
    before(:all) do
      @docatom = Feed.new(File.read('spec/test_data/doc.atom'))
      @kpgatom = Feed.new(File.read('spec/test_data/katanapg.atom'))
      @djcprss2 = Feed.new(File.read('spec/test_data/djcp.rss'))
      @oa = Feed.new(File.read('spec/test_data/oa.africa.rss'))
    end

    [:title, :subtitle, :description, :link, :generator, :authors, :author, :categories,  :category, :icon, :logo, :rights, :updated, :guid].each do|att|
      it { @docatom.channel.should respond_to att}
      it { @djcprss2.channel.should respond_to att}
    end

    it "should have the correct title" do
      @docatom.channel.title.should == 'Doc Searls Weblog'
      @kpgatom.channel.title.should == 'Katana Photo Groups: (Latest Updates)'
      @djcprss2.channel.title.should == 'Dan Collis-Puro'
      @oa.channel.title.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'
    end

    it "should have the correct subtitle and description" do
      @docatom.channel.subtitle.should == 'Same old blog, brand new place'
      @docatom.channel.description.should == 'Same old blog, brand new place'

      @kpgatom.channel.subtitle.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'
      @kpgatom.channel.description.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'

      @djcprss2.channel.subtitle.should == 'Tech. Open Source. Stuff that doesn\'t suck.'
      @djcprss2.channel.description.should == 'Tech. Open Source. Stuff that doesn\'t suck.'

      @oa.channel.description.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'
      @oa.channel.subtitle.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'

    end

    it "should have the correct link" do
      @docatom.channel.link.should == 'http://blogs.law.harvard.edu/doc'
      @kpgatom.channel.link.should == 'http://www.katanapg.com/latest'
      @djcprss2.channel.link.should == 'http://blogs.law.harvard.edu/djcp'

      @oa.channel.link.should == 'http://www.connotea.org/user/petersuber/tag/oa.africa'
    end

    it "should have the correct generator" do
      @docatom.channel.generator.should == 'WordPress'
      @kpgatom.channel.generator.should == ''
      @djcprss2.channel.generator.should == 'WordPress'
      @oa.channel.generator.should == 'Connotea'
    end

    it "should have the correct authors" do
      @docatom.channel.authors.should == ['Doc Searls']
      @kpgatom.channel.authors.should == ['Nick Pappas']
      @djcprss2.channel.authors.should == ['DJCP']
      @oa.channel.authors.should == []

      @docatom.channel.author.should == 'Doc Searls'
      @kpgatom.channel.author.should == 'Nick Pappas'
      @djcprss2.channel.author.should == 'DJCP'
      @oa.channel.author.should == ''

    end

    it "should have the correct categories" do
      @docatom.channel.categories.should == []
      @kpgatom.channel.categories.should == ['photos']
      @djcprss2.channel.categories.should == ['Tech','Open Source','oa.africa','oa.test']
      @oa.channel.categories.should == ['oa.africa','oa.test']
      
      @docatom.channel.category.should == ''
      @kpgatom.channel.category.should == 'photos'
      @djcprss2.channel.category.should == 'Tech, Open Source'
      @oa.channel.category.should == ''
    end

    it "should have the correct icon" do
      @docatom.channel.icon.should == ''
      @kpgatom.channel.icon.should == '/favicon.ico'

      @djcprss2.channel.icon.should == '/foobar.gif'
      @oa.channel.icon.should == ''
    end

    it "should have the correct logo" do
      @docatom.channel.logo.should == ''
      @kpgatom.channel.logo.should == '/images/rss.gif'

      @djcprss2.channel.logo.should == '/foobar.gif'
    end

    it "should have the correct rights" do
      @docatom.channel.rights.should == ''
      @kpgatom.channel.rights.should == ''
      @djcprss2.channel.rights.should == '2011 DJCP'
    end

    it "should have the correct updated value" do
      @docatom.channel.updated.should == Time.parse('2011-07-29 12:33:29 UTC')
      @kpgatom.channel.updated.should == Time.parse('2011-08-24 23:59:40 -0400')
      @djcprss2.channel.updated.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
    end

    it "should have the correct guid" do
      @docatom.channel.guid.should == 'http://blogs.law.harvard.edu/doc/feed/atom/'
      @kpgatom.channel.guid.should == 'urn:uuid:www.katanapg.com-latest-xml'

      @djcprss2.channel.guid.should == 'http://blogs.law.harvard.edu/djcp'
    end
  end
end
