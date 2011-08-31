# encoding: UTF-8

require 'spec_helper'
class Feed::Abstract

  describe Item do
    before(:all) do
      @docatom = Feed.new(File.read('spec/test_data/doc.atom'))
      @docatomitem = @docatom.items.first

      @kpgatom = Feed.new(File.read('spec/test_data/katanapg.atom'))
      @kpgatomitem = @kpgatom.items.first

      @djcprss2 = Feed.new(File.read('spec/test_data/djcp.rss'))
      @djcprss2item = @djcprss2.items.first
    end

    [:title, :summary, :content, :link, :authors, :author, :contributor, :contributors, :categories, :category, :rights, :updated, :guid, :published].each do|att|
      it { @docatomitem.should respond_to att}
    end

    [:title, :summary, :content, :link, :authors, :author, :contributor, :contributors, :categories, :category, :rights, :updated, :guid, :published].each do|att|
      it { @djcprss2item.should respond_to att}
    end

    it "should have the correct title" do 
      @docatomitem.title.should == 'Many years of now'
      @kpgatomitem.title.should == '08/25 3AM - Second year college move in 8-22-11 [By: Peggy Pappas]'
      @djcprss2item.title.should == 'S1:E7 – Justice'
    end

    it "should have the correct summary" do 
      @docatomitem.summary.should == "&#8220;When I&#8217;m Sixty-Four&#8221; is 44 years old. I was 20 when it came out, in the summer of 1967,  one among thirteen perfect tracks on The Beatles&#8216; Sgt. Pepper&#8217;s Lonely Hearts Club Band album. For all the years since, I&#8217;ve thought the song began, &#8220;When I get older, losing my head&#8230;&#8221; But yesterday, on the eve of actually [...]"
      @kpgatomitem.summary.should == ''

      @djcprss2item.summary.should == %q|&#8220;Everybody&#8217;s blonde &#8211; they&#8217;re all way too happy. I bet it will all be an animation. I bet that ship is making the whole planet. It&#8217;s sucking all the data out &#8211; of Data. They wear weird clothes. Eww. So &#8230; <a href="http://blogs.law.harvard.edu/djcp/2011/08/s1e7-justice/">Continue reading <span class="meta-nav">&#8594;</span></a>|
    end

    it "should have the correct content" do 
      @docatomitem.content.should == %q|<p><img class="alignleft size-full wp-image-4196" src="http://blogs.law.harvard.edu/doc/files/2011/07/lost-head.jpg" alt="" width="145" height="135" /><a href="http://en.wikipedia.org/wiki/When_I'm_Sixty-Four">&#8220;When I&#8217;m Sixty-Four&#8221;</a> is 44 years old.<img class="alignright size-full wp-image-4197" src="http://blogs.law.harvard.edu/doc/files/2011/07/lost-hair.jpg" alt="" width="148" height="134" /> I was 20 when it came out, in the summer of 1967,  one among thirteen perfect tracks on <a href="http://en.wikipedia.org/wiki/The_Beatles">The Beatles</a>&#8216; <em><a href="http://en.wikipedia.org/wiki/Sgt._Pepper%27s_Lonely_Hearts_Club_Band">Sgt. Pepper&#8217;s Lonely Hearts Club Band</a></em> album. For all the years since, I&#8217;ve thought the song began, &#8220;When I get older, losing my head&#8230;&#8221; But yesterday, on the eve of actually turning sixty-four, I watched <a href="http://www.youtube.com/watch?v=tGtSpsYURAQ">this video animation of the song</a> (by theClemmer) and found that Paul McCartney actually sang, &#8220;&#8230; losing my <em>hair</em>.&#8221;</p>
<p>Well, that&#8217;s true. I&#8217;m not bald yet, but the bare spot in the back and the thin zone in the front are advancing toward each other, while my face continues falling down below.</p>
<p><img class="alignleft size-full wp-image-4199" src="http://blogs.law.harvard.edu/doc/files/2011/07/doc-then.jpg" alt="" width="128" height="137" />In July 2006, my old friend <a href="http://www.soundtraxnc.com/Tom/tom01.htm">Tom Guild</a><img class="alignright size-full wp-image-4200" src="http://blogs.law.harvard.edu/doc/files/2011/07/62.jpg" alt="" width="99" height="152" /> put <a href="http://www.youtube.com/watch?v=ec-YrUaeXAE">Doc Searls explains driftwood of the land</a> up on YouTube. It&#8217;s an improvisational comedy riff that Tom shot with his huge new shoulder-fire video camera at our friend Steve Tulsky&#8217;s house on a Marin County hillside in June, 1988. It was a reunion of sorts. Tom, Steve and I had all worked in radio together in North Carolina. I was forty at the time, and looked about half that age. When my ten-year-old kid saw it, he said &#8220;Papa, you don&#8217;t look like that.&#8221; I replied, &#8220;No, I <em>do</em> look like that. I don&#8217;t look like <em>this,</em>&#8221; pointing to my face.</p>
<p>Today it would be nice if I still looked like I did five years ago. The shot in the banner at the top of this blog was taken in the summer of 1999 (<a href="http://doc-weblogs.com/clues">here&#8217;s the original</a>), when I was fifty-two and looked half that age. The one on the right was taken last summer (the shades on my forehead masking a scalp that now reflects light), when I was a few days short of sixty-three. By then I was finally looking my age.</p>
<p>A couple months back I <a href="http://www.youtube.com/watch?v=4dn1jkWgFvM&amp;feature=youtu.be">gave a talk</a> at the <a href="http://personaldemocracy.com/">Personal Democracy Forum</a> where I was warmly introduced as one of those elders we should all listen to. That was nice, but here&#8217;s the strange part: when it comes to what I do in the world, I&#8217;m still young. Most of the people I hang and work with are half my age or less, yet I rarely notice or think about that, because it&#8217;s irrelevant. My job is changing the world, and that&#8217;s an calling that tends to involve smart, young, energetic people. The difference with a few of us is that we&#8217;ve been young a lot longer.</p>
<p>But I don&#8217;t have illusions about the facts of life. It&#8217;s in one&#8217;s sixties that the croak rate starts to angle north on the Y axis as age ticks east on the X. Still, I&#8217;m in no less hurry to make things happen than I ever was. I&#8217;m just more patient. That&#8217;s because one of the things I&#8217;ve learned is that now is always earlier than it seems. None of the future has happened yet, and it&#8217;s always bigger than the past.</p>
|

      @kpgatomitem.content.should == %q|<div xmlns="http://www.w3.org/1999/xhtml">
       <img src="http://misuzu.katanapg.com/62/1134022551906b98/thumb.jpg"/>
     </div>|

      @djcprss2item.content.should == %q|<p style="padding-left: 30px;">&#8220;Everybody&#8217;s blonde &#8211; they&#8217;re all way too happy. I bet it will all be an animation. I bet that ship is making the whole planet. It&#8217;s sucking all the data out &#8211; of Data. They wear weird clothes. Eww. So the &#8220;god&#8221; just let them get away? What warp are they going to? Captain Picard didn&#8217;t say!&#8221;</p>
<p><em>TNG watches TNG – an ongoing series where my almost 11 year old daughter discovers Star Trek.</em></p>
|
    end

    it "should have the correct link" do
      @docatomitem.link.should == "http://blogs.law.harvard.edu/doc/2011/07/29/many-years-of-now/"
      @kpgatomitem.link.should == 'http://www.katanapg.com/group/2739'
      @djcprss2item.link.should == 'http://blogs.law.harvard.edu/djcp/2011/08/s1e7-justice/'
    end

    it "should have the correct author" do
      @docatomitem.author.should == 'Doc Searls'
      @kpgatomitem.author.should == ''
      @djcprss2item.author.should == 'djcp'
    end
    
    it "should have the correct authors" do
      @docatomitem.authors.should == ['Doc Searls']
      @kpgatomitem.authors.should == []
      @djcprss2item.authors.should == ['djcp']
    end

    it "should have the correct contributor" do
      @docatomitem.contributor.should == 'Doc Searls, The Beatles'
      @kpgatomitem.contributor.should == ''
      @djcprss2item.contributor.should == ''
    end
    
    it "should have the correct contributors" do
      @docatomitem.contributors.should == ['Doc Searls', 'The Beatles']
      @kpgatomitem.contributors.should == []
      @djcprss2item.contributors.should == []
    end

    it "should have the correct category" do
      @docatomitem.category.should == 'Art, Broadcasting, Events, Family, Fun, Future, Geography, Geology, Health, history, Life, North Carolina, Past, Personal'
      @kpgatomitem.category.should == ''
      @djcprss2item.category.should == 'Uncategorized, tngwatchestng'
    end

    it "should have the correct categories" do
      @docatomitem.categories.should == ["Art", "Broadcasting", "Events", "Family", "Fun", "Future", "Geography", "Geology", "Health", "history", "Life", "North Carolina", "Past", "Personal"] 
      @kpgatomitem.categories.should == []
      @djcprss2item.categories.should == ['Uncategorized', 'tngwatchestng']
    end

    it "should have the correct rights" do
      @docatomitem.rights.should == ''
      @kpgatomitem.rights.should == ''
      @djcprss2item.rights.should == ''
    end

    it "should have been updated at the correct time" do
      @docatomitem.updated.should == Time.parse('2011-07-29T12:33:29Z')
      @kpgatomitem.updated.should == Time.parse('2011-08-25T03:59:40+00:00')
      @djcprss2item.updated.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
    end

    it "should have the proper guid" do
      @docatomitem.guid.should == "http://blogs.law.harvard.edu/doc/?p=4195"
      @kpgatomitem.guid.should == 'urn:uuid:www.katanapg.com-group-2739'
      @djcprss2item.guid.should == 'http://blogs.law.harvard.edu/djcp/?p=227'
    end

    it "should have been published at the proper time" do
      @docatomitem.published.should == Time.parse("2011-07-29T10:43:27Z")
      @kpgatomitem.published.should == ''
      @djcprss2item.published.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
    end

  end

end
