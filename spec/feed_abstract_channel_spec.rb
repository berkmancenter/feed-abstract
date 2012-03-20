# encoding: UTF-8
#
require 'spec_helper'
module FeedAbstract

  describe 'Channels' do
    before(:all) do
      instantiate_feeds
    end

    [:title, :language, :subtitle, :description, :link, :generator, :authors, :author, :categories,  :category, :icon, :logo, :rights, :updated, :guid].each do|att|
      it { @docatom.channel.should respond_to att}
      it { @kpgatom.channel.should respond_to att}
      it { @djcprss2.channel.should respond_to att}
      it { @djcprss92.channel.should respond_to att}
      it { @oa.channel.should respond_to att}
      it { @delicious.channel.should respond_to att}
      it { @zotero.channel.should respond_to att}
      it { @feedburner.channel.should respond_to att}
      it { @pyblosxom.channel.should respond_to att}
      it { @chill.channel.should respond_to att}
      it { @twitter.channel.should respond_to att}
      it { @twitter_atom.channel.should respond_to att}

      it { @docatom.channel.send(att).should_not == false}
      it { @kpgatom.channel.send(att).should_not == false}
      it { @djcprss2.channel.send(att).should_not == false}
      it { @djcprss92.channel.send(att).should_not == false}
      it { @oa.channel.send(att).should_not == false}
      it { @delicious.channel.send(att).should_not == false}
      it { @zotero.channel.send(att).should_not == false}
      it { @feedburner.channel.send(att).should_not == false}
      it { @pyblosxom.channel.send(att).should_not == false}
      it { @chill.channel.send(att).should_not == false}
      it { @twitter.channel.send(att).should_not == false}
      it { @twitter_atom.channel.send(att).should_not == false}
    end

    it "should have the correct title" do
      @docatom.channel.title.should == 'Doc Searls Weblog'
      @kpgatom.channel.title.should == 'Katana Photo Groups: (Latest Updates)'
      @djcprss2.channel.title.should == 'Dan Collis-Puro'
      @djcprss92.channel.title.should == 'Dan Collis-Puro'
      @oa.channel.title.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'
      @delicious.channel.title.should == 'Delicious/djcp'
      @zotero.channel.title.should == 'Zotero / PROS Paper Group / Items'
      @feedburner.channel.title.should == 'CNN.com'
      @pyblosxom.channel.title.should == 'Copyrighteous'
      @chill.channel.title.should == 'Chilling Effects Clearinghouse Weather Reports'
      @twitter.channel.title.should == 'Twitter / djcp'
      @twitter_atom.channel.title.should == '#rails - Twitter Search'
    end

    it "should have the correct subtitle and description" do
      @docatom.channel.subtitle.should == 'Same old blog, brand new place'
      @docatom.channel.description.should == 'Same old blog, brand new place'

      @kpgatom.channel.subtitle.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'
      @kpgatom.channel.description.should == 'This is the place to go for the latest photo updates on Katana Photo Groups'

      @djcprss2.channel.subtitle.should == 'Tech. Open Source. Stuff that doesn\'t suck.'
      @djcprss2.channel.description.should == 'Tech. Open Source. Stuff that doesn\'t suck.'

      @djcprss92.channel.subtitle.should == 'Tech. Open Source. Stuff that doesn\'t suck.'
      @djcprss92.channel.description.should == 'Tech. Open Source. Stuff that doesn\'t suck.'

      @oa.channel.description.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'
      @oa.channel.subtitle.should == 'Connotea: petersuber\'s bookmarks matching tag oa.africa'

      @delicious.channel.description.should == 'bookmarks posted by djcp'
      @delicious.channel.subtitle.should == 'bookmarks posted by djcp'

      @zotero.channel.subtitle.should == ''
      @zotero.channel.description.should == ''

      @feedburner.channel.description.should == 'CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.'
      @feedburner.channel.subtitle.should == 'CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.'

      @pyblosxom.channel.description.should == "\n\n"
      @pyblosxom.channel.subtitle.should == "\n\n"

      @chill.channel.description.should == 'Monitoring the legal climate for Internet activity (database of annotated cease and desist letters)'
      @chill.channel.subtitle.should == 'Monitoring the legal climate for Internet activity (database of annotated cease and desist letters)'

      @twitter.channel.description.should == 'Twitter updates from Daniel Collis Puro / djcp.'
      @twitter.channel.subtitle.should == 'Twitter updates from Daniel Collis Puro / djcp.'

      @twitter_atom.channel.description.should == ''
      @twitter_atom.channel.subtitle.should == ''
    end

    it "should have the correct link" do
      @docatom.channel.link.should == 'http://blogs.law.harvard.edu/doc'
      @kpgatom.channel.link.should == 'http://www.katanapg.com/latest'
      @djcprss2.channel.link.should == 'http://blogs.law.harvard.edu/djcp'
      @djcprss92.channel.link.should == 'http://blogs.law.harvard.edu/djcp'
      @oa.channel.link.should == 'http://www.connotea.org/user/petersuber/tag/oa.africa'
      @delicious.channel.link.should == 'http://www.delicious.com/djcp'
      @zotero.channel.link.should == 'https://api.zotero.org/groups/52650/items'
      @feedburner.channel.link.should == 'http://www.cnn.com/?eref=rss_topstories'
      @pyblosxom.channel.link.should == 'http://mako.cc/copyrighteous'
      @chill.channel.link.should == 'http://www.chillingeffects.org'
      @twitter.channel.link.should == 'http://twitter.com/djcp'
      @twitter_atom.channel.link.should == 'http://search.twitter.com/search?q=%23rails'
    end

    it "should have the correct generator" do
      @docatom.channel.generator.should == 'WordPress'
      @kpgatom.channel.generator.should == ''
      @djcprss2.channel.generator.should == 'WordPress'
      @djcprss92.channel.generator.should == ''
      @oa.channel.generator.should == 'Connotea'
      @delicious.channel.generator.should == 'Delicious'
      @zotero.channel.generator.should == 'Zotero'
      @feedburner.channel.generator.should == ''
      @pyblosxom.channel.generator.should == "\nPyBlosxom http://pyblosxom.sourceforge.net/ 1.5rc2 20100803\n"
      @chill.channel.generator.should == ''
      @twitter.channel.generator.should == 'Twitter'
      @twitter_atom.channel.generator.should == 'Twitter'
    end

    it "should have the correct language" do
      @docatom.channel.language.should == 'en'
      @kpgatom.channel.language.should == ''
      @djcprss2.channel.language.should == 'en'
      @djcprss92.channel.language.should == 'en'
      @oa.channel.language.should == ''
      @delicious.channel.language.should == ''
      @zotero.channel.language.should == ''
      @feedburner.channel.language.should == 'en-us'
      @pyblosxom.channel.language.should == 'en'
      @chill.channel.language.should == 'en-us'
      @twitter.channel.language.should == 'en-us'
      @twitter_atom.channel.language.should == 'en-US'
    end

    it "should have the correct authors" do
      @docatom.channel.authors.should == ['Doc Searls']
      @kpgatom.channel.authors.should == ['Nick Pappas']
      @djcprss2.channel.authors.should == ['DJCP']
      @djcprss92.channel.authors.should == []
      @oa.channel.authors.should == []
      @delicious.channel.authors.should == []
      @zotero.channel.authors.should == []
      @feedburner.channel.authors.should == []
      @pyblosxom.channel.authors.should == ['Benjamin Mako Hill']
      @chill.channel.authors.should == ['Wendy Seltzer, wseltzer@chillingeffects.org']
      @twitter.channel.authors.should == []
      @twitter_atom.channel.authors.should == []

      @docatom.channel.author.should == 'Doc Searls'
      @kpgatom.channel.author.should == 'Nick Pappas'
      @djcprss2.channel.author.should == 'DJCP'
      @djcprss92.channel.author.should == ''
      @oa.channel.author.should == ''
      @delicious.channel.author.should == ''
      @zotero.channel.author.should == ''
      @feedburner.channel.author.should == ''
      @pyblosxom.channel.author.should == 'Benjamin Mako Hill'
      @chill.channel.author.should == 'Wendy Seltzer, wseltzer@chillingeffects.org'
      @twitter.channel.author.should == ''
      @twitter_atom.channel.author.should == ''

    end

    it "should have the correct categories" do
      @docatom.channel.categories.should == []
      @kpgatom.channel.categories.should == ['photos']
      @djcprss2.channel.categories.should == ['Tech','Open Source','oa.africa','oa.test']
      @djcprss92.channel.categories.should == []
      @oa.channel.categories.should == ['oa.africa','oa.test']
      @delicious.channel.categories.should == []
      @zotero.channel.categories.should == []
      @feedburner.channel.categories.should == []
      @pyblosxom.channel.categories.should == []
      @chill.channel.categories.should == ['Your rights online']
      @twitter.channel.categories.should == []
      @twitter_atom.channel.categories.should == []
      
      @docatom.channel.category.should == ''
      @kpgatom.channel.category.should == 'photos'
      @djcprss2.channel.category.should == 'Tech, Open Source, oa.africa, oa.test'
      @djcprss92.channel.category.should == ''
      @oa.channel.category.should == 'oa.africa, oa.test'
      @delicious.channel.category.should == ''
      @zotero.channel.category.should == ''
      @feedburner.channel.category.should == ''
      @pyblosxom.channel.category.should == ''
      @chill.channel.category.should == 'Your rights online'
      @twitter.channel.category.should == ''
      @twitter_atom.channel.category.should == ''
    end

    it "should have the correct icon" do
      @docatom.channel.icon.should == ''
      @kpgatom.channel.icon.should == '/favicon.ico'
      @djcprss2.channel.icon.should == '/foobar.gif'
      @djcprss92.channel.icon.should == ''
      @oa.channel.icon.should == 'http://example.com/image.gif'
      @delicious.channel.icon.should == ''
      @zotero.channel.icon.should == ''
      @feedburner.channel.icon.should == 'http://i2.cdn.turner.com/cnn/.element/img/1.0/logo/cnn.logo.rss.gif'
      @pyblosxom.channel.icon.should == ''
      @chill.channel.icon.should == 'http://images.chillingeffects.org/chilling_effects.gif'
      @twitter.channel.icon.should == ''
      @twitter_atom.channel.icon.should == ''
    end

    it "should have the correct logo" do
      @docatom.channel.logo.should == ''
      @kpgatom.channel.logo.should == '/images/rss.gif'
      @djcprss2.channel.logo.should == '/foobar.gif'
      @djcprss92.channel.logo.should == ''
      @oa.channel.logo.should == 'http://example.com/image.gif'
      @delicious.channel.logo.should == ''
      @zotero.channel.logo.should == ''
      @feedburner.channel.logo.should == 'http://i2.cdn.turner.com/cnn/.element/img/1.0/logo/cnn.logo.rss.gif'
      @pyblosxom.channel.logo.should == ''
      @chill.channel.logo.should == 'http://images.chillingeffects.org/chilling_effects.gif'
      @twitter.channel.logo.should == ''
      @twitter_atom.channel.logo.should == ''
    end

    it "should have the correct rights" do
      @docatom.channel.rights.should == ''
      @kpgatom.channel.rights.should == ''
      @djcprss2.channel.rights.should == '2011 DJCP'
      @djcprss92.channel.rights.should == ''
      @oa.channel.rights.should == 'Connotea 2011'
      @delicious.channel.rights.should == ''
      @zotero.channel.rights.should == ''
      @feedburner.channel.rights.should == ' 2011 Cable News Network LP, LLLP.'
      @pyblosxom.channel.rights.should == 'Creative Commons Attribution-ShareAlike'
      @chill.channel.rights.should == ''
      @twitter.channel.rights.should == ''
      @twitter_atom.channel.rights.should == ''
    end

    it "should have the correct updated value" do
      @docatom.channel.updated.should == Time.parse('2011-07-29 12:33:29 UTC')
      @kpgatom.channel.updated.should == Time.parse('2011-08-24 23:59:40 -0400')
      @djcprss2.channel.updated.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
      @djcprss92.channel.updated.should == Time.parse('Sat, 03 Sep 2011 01:16:50 +0000')
      @oa.channel.updated.should == Time.parse('2011-09-01T08:07:21Z')
      @delicious.channel.updated.should == ''
      @zotero.channel.updated.should == Time.parse('2011-09-02T17:16:11Z')
      @feedburner.channel.updated.should == Time.parse('Sat, 03 Sep 2011 16:14:16 EDT')
      @pyblosxom.channel.updated.should == Time.parse('2011-09-15T05:21:00Z')
      @chill.channel.updated.should == Time.parse('2002-02-25T12:00+00:00')
      @twitter.channel.updated.should == ''
      @twitter_atom.channel.updated.should == Time.parse('2012-03-19 21:56:03 UTC')
    end

    it "should have the correct guid" do
      @docatom.channel.guid.should == 'http://blogs.law.harvard.edu/doc/feed/atom/'
      @kpgatom.channel.guid.should == 'urn:uuid:www.katanapg.com-latest-xml'
      @djcprss2.channel.guid.should == 'http://blogs.law.harvard.edu/djcp'
      @djcprss92.channel.guid.should == 'http://blogs.law.harvard.edu/djcp'
      @oa.channel.guid.should == 'http://www.connotea.org/user/petersuber/tag/oa.africa'
      @delicious.channel.guid.should == 'http://www.delicious.com/djcp'
      @zotero.channel.guid.should == 'http://zotero.org/groups/52650/items'
      @feedburner.channel.guid.should == 'http://www.cnn.com/?eref=rss_topstories'
      @pyblosxom.channel.guid.should == 'http://mako.cc/copyrighteous/'
      @chill.channel.guid.should == 'http://www.chillingeffects.org'
      @twitter.channel.guid.should == 'http://twitter.com/djcp'
      @twitter_atom.channel.guid.should == 'tag:search.twitter.com,2005:search/#rails'
    end
  end
end
