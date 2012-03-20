# encoding: UTF-8

require 'spec_helper'
module FeedAbstract

  describe Item do
    before(:all) do
      instantiate_feeds
      instantiate_example_items
    end

    it{@docatom.should respond_to :items}

    it "responds to all attributes without causing an error" do
      @all_feeds.each do |feed|
        [:title, :summary, :content, :link, :authors, :author, :contributor, :contributors, :categories, :category, :rights, :updated, :guid, :published, :channel].each do|att|
          feed.items.each do|item|
            item.should respond_to att 
            item.send(att).should_not == false 
          end
        end
      end
    end

    it "should have the correct title" do 
      @docatomitem.title.should == 'Many years of now'
      @kpgatomitem.title.should == '08/25 3AM - Second year college move in 8-22-11 [By: Peggy Pappas]'
      @djcprss2item.title.should == 'S1:E7 – Justice'
      @oaitem.title.should == 'Mali doctoral students learn about access to e-resources | EIFL'
      @deliciousitem.title.should == 'aspic and other delights'
      @zoteroitem.title.should == 'An experimental application of the Delphi method to the use of experts'
      @feedburneritem.title.should == 'Did Libya help CIA with renditions of terror suspects?'
      @pyblosxomitem.title.should == "Anxiety\n"
      @chillitem.title.should == "Takedown Complaints in the Android Marketplace"
      @twitteritem.title.should == "djcp: @csoghoian @BrookingsInst and the clipboard as well, presumably. #security #keylogging"
      @twitteratomitem.title.should == "Senior #Ruby on #Rails developer(s) http://t.co/rvqsIK0h #jobs"

    end

    it "should have the correct summary" do 
      @docatomitem.summary.should == "&#8220;When I&#8217;m Sixty-Four&#8221; is 44 years old. I was 20 when it came out, in the summer of 1967,  one among thirteen perfect tracks on The Beatles&#8216; Sgt. Pepper&#8217;s Lonely Hearts Club Band album. For all the years since, I&#8217;ve thought the song began, &#8220;When I get older, losing my head&#8230;&#8221; But yesterday, on the eve of actually [...]"
      @kpgatomitem.summary.should == ''

      @djcprss2item.summary.should == %q|&#8220;Everybody&#8217;s blonde &#8211; they&#8217;re all way too happy. I bet it will all be an animation. I bet that ship is making the whole planet. It&#8217;s sucking all the data out &#8211; of Data. They wear weird clothes. Eww. So &#8230; <a href="http://blogs.law.harvard.edu/djcp/2011/08/s1e7-justice/">Continue reading <span class="meta-nav">&#8594;</span></a>|

     @oaitem.summary.should == %q|""On August 13, 2011, Consortium Malien des Bibliothèques (COMBI)  organized a workshop on access and use of e-resources (both commercial and open access)....There was a special focus on resources made freely available through EIFL for Malian institutions and also on the various international initiatives working to improve access to scientific information in Mali. Digital libraries and portals for open access journals were also demonstrated...."" Posted by petersuber to oa.notes ru.no oa.event oa.africa oa.new on Thu Aug 18 2011|
      @deliciousitem.summary.should == ''
      @zoteroitem.summary.should == ''
      @feedburneritem.summary.should == %q|Documents seized at Libyan intelligence headquarters have unearthed insights into the CIA's surprisingly close relationship with counterparts in the Gadhafi regime.<div class="feedflare">
<a href="http://rss.cnn.com/~ff/rss/cnn_topstories?a=sV5N-C76mOM:9JZ1FBt9fS4:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/rss/cnn_topstories?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://rss.cnn.com/~ff/rss/cnn_topstories?a=sV5N-C76mOM:9JZ1FBt9fS4:7Q72WNTAKBA"><img src="http://feeds.feedburner.com/~ff/rss/cnn_topstories?d=7Q72WNTAKBA" border="0"></img></a> <a href="http://rss.cnn.com/~ff/rss/cnn_topstories?a=sV5N-C76mOM:9JZ1FBt9fS4:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/rss/cnn_topstories?i=sV5N-C76mOM:9JZ1FBt9fS4:V_sGLiPBpWU" border="0"></img></a> <a href="http://rss.cnn.com/~ff/rss/cnn_topstories?a=sV5N-C76mOM:9JZ1FBt9fS4:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/rss/cnn_topstories?d=qj6IDK7rITs" border="0"></img></a> <a href="http://rss.cnn.com/~ff/rss/cnn_topstories?a=sV5N-C76mOM:9JZ1FBt9fS4:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/rss/cnn_topstories?i=sV5N-C76mOM:9JZ1FBt9fS4:gIN9vFwOqvQ" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/rss/cnn_topstories/~4/sV5N-C76mOM" height="1" width="1"/>|

      @pyblosxomitem.summary.should == ""
      @chillitem.summary.should == %Q$<br>\n<img src=\"//images.chillingeffects.org/thermometer.gif\" alt=\"thermometer\" width=\"35\" height=\"120\"align=left> <h2>Takedown Complaints in the Android Marketplace</h2><p>Wendy Seltzer, <i>Chilling Effects Clearinghouse</i>,  March  3, 2011\n<p><i>Abstract:</i> Earlier this year, Google began sending to Chilling Effects the requests it received for takedown from the Android Marketplace. Since this represents a new source of data, we take a look at the first month's input, February 2011.<hr size=1>\n<p><hr size=1 width=\"75%\"><p>Since Apple launched its iPhone App Store, applications marketplaces have popped up with increasing prominence.  Google, unlike Apple<a href=\"#note1\" name=\"back\">*</a>, does not lock Android users into purchasing from its <a href=\"https://market.android.com/\">Android Market</a>, but it does make that marketplace a convenient place to find Android applications (<a href=\"http://mashable.com/2010/10/25/android-100000-apps/\">passing 100,000 apps</a> late last year).  <br><p><br>In February, Chilling Effects <a href=\"https://www.chillingeffects.org/search.cgi?search=Android\">saw</a> 206 complaints to Google regarding Android Market apps, almost evenly split between trademark and copyright.<a href=\"#note2\" name=\"back2\">*</a> Because the Android Market offers commercial transactions, its context differs somewhat from the search and blog hosting in which DMCA -- copyright -- complaints predominate. At the same time, many apps are offered free of charge.<p><br><img src=\"https://chart.googleapis.com/chart?cht=pc&chtt=Complaint+Subjects+to+Android+Market+(Feb+2011)&chs=750x400&chd=t:111,97,3|0.59,0.31,0.05,0.03,0.02,0.02,0.02,0.38,0.11,0.1,0.07,0.03,0.03,0.02,0.02,0.02,0.01,0.01,0.22&chl=[TM]|[C]||Trademark%20%20(59)|Facebook%20Trademark%20%20(31)|Bank%20Trademark%20%20(5)|SXSW%20Trademark%20%20(3)|Trademarks%20and%20Videos%20Copyright%20%20(2)|Game%20Trademark%20%20(2)|Disney%20Trademark%20and%20Copyright%20%20(2)|Game%20Copyright%20%20(38)|Software%20Copyright%20%20(11)|Logo%20Copyright%20%20(10)|Copyright%20%20(7)|Books%20Copyright%20%20(3)|Images%20Copyright%20%20(3)|Articles%20Copyright%20%20(2)|Television%20Copyright%20%20(2)|UFC%20Copyright%20%20(2)|Photo%20Copyright%20%20(1)|Website%20Copyright%20%20(1)|Other/Unidentified%20(22)&chco=0000FF,003333&chp=3.14\" title=\"Complaint Subjects to Google's Android Market, Feb. 2011\"><p>Slightly more than half of the complaints here claim trademark infringement: misleading use of a mark (word or logo) to cause consumer confusion about the application's source or sponsorship.  Facebook led the way, challenging 30+ apps that borrowed its name or \"f\" logo (e.g. <a href=\"/trademark/notice.cgi?NoticeID=56735\">Facebook Trademark Complaint to Google: Android Market</a>).  Banks and financial institutions challenged applications that used their logos, even to offer a mobile version of the bank's own site. Here is trademark as the law of consumer protection: you want to be sure an unauthorized Wells Fargo application won't channel your deposit into its coffers rather than your savings account.  Google even filed several complaints against apps in its marketplace that were a bit too free with the Google name. Starbucks used copyright in its logo to similar end, requesting takedown or alteration of apps that used the coffee company's logo as their icon (e.g. <a href=\"/dmca512c/notice.cgi?NoticeID=60149\">Logo DMCA (Copyright) Complaint to Google: Android Market</a>). Some, including <a href=\"https://market.android.com/details?id=com.birbeck.starbuckscard\">My Coffee Card</a> (formerly Starbucks Card Widget) changed their name and icon in response.<p>Sometimes, these complaints didn't do much to allege \"likelihood of consumer confusion,\" the traditional hallmark of trademark infringement.  South By SouthWest's complaint against the \"Unauthorized SXSW\" party scheduler app -- <a href=\"/trademark/notice.cgi?NoticeID=60951\">SXSW Trademark Complaint to Google: Android Market</a> -- sounds like an overstep, into nominative fair use. There's no good alternative way to refer to the big conference/music festival in Austin later in March, and \"unauthorized\" plainly indicates it's not an officially endorsed product. (Neither Unofficial SXSW nor the official \"SXSW&reg; GO\" gets particularly high marks from reviewers yet, but that may be because the event hasn't yet kicked off to fill them with data.)<p>Another 82 complaints (less 11 \"logo\" complaints) alleged copyright infringement -- copying of code, of graphical elements or \"look and feel\" (Nintendo complained about many \"Super Mario\" derivatives), of characters (Columbia's \"Qbert\"), or of audiovisual elements including video clips, wallpapers, and eBooks. Most of these were phrased in DMCA terms, since like a blog platform, the marketplace hosts \"information residing on systems or networks at direction of users\" <a href=\"http://static.chillingeffects.org/512.html#c\">512(c)</a>. <p>Unique among the copyright complaints in its indirection, the RIAA filed three complaints naming dozens of apps that allegedly \"facilitate the unauthorized streaming and downloading of popular sound recordings, the vast majority of which are owned or controlled by RIAA members.\"  Its <a href=\"/dmca512c/notice.cgi?NoticeID=61677\">complaints</a>, complete with screenshots, asked for the removal of apps for ringtone creation and MP3 listening.  This is an attenuated claim.  RIAA isn't alleging that Google, or even the apps, are direct infringers of member copyrights. Rather, it claims that because Google hosts apps (or in some cases, serves ads inside them) that enable end-users to make infringing copies of music, Google should be held responsible for the users' infringing conduct -- a sort of once-removed contributory or vicarious liability claim. Is there a law of contributory inducement, after <a href=\"http://w2.eff.org/IP/P2P/MGM_v_Grokster/\">Grokster</a>?  <p><br>I haven't followed all of the URLs to see how Google has responded to each of these complaints, but to its credit, it does not appear to have pulled the \"Unauthorized SXSW,\" for example.  Others accused of trademark infringement appear to have changed their names or logos. Because the <a href=\"https://www.chillingeffects.org/dmca512/faq\">DMCA</a> applies only to copyright, not trademark, there is less settled procedure around the trademark claims.  There's no safe-harbor, but neither is there an assumption that the service provider will be liable for its users' activity (see <a href=\"http://www.eff.org/deeplinks/2010/04/tiffany-v-ebay-what-about-put-back\">Tiffany v. eBay</a>, where the Second Circuit Court of Appeals held that \"for contributory trademark infringement liability to lie, a service provider must have more than a general knowledge or reason to know that its service is being used to sell counterfeit goods.\"). <p><br><img src=\"https://chart.googleapis.com/chart?cht=p&chtt=Complaint+Senders+to+Android+Market+(Feb+2011)&chs=750x400&chd=t:0.3,0.2,0.08,0.06,0.04,0.03,0.03,0.03,0.03,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,1.09&chl=Facebook,%20Inc.%20(30)|Nintendo%20of%20America%20Inc.%20(20)|Google%20Inc.%20(8)|Starbucks%20Corporation%20(6)|Hatched%20Games%20(4)|RIAA%20(3)|Photo%20Hunt%20(3)|Atari,%20Inc.%20(3)|ESPN%20Inc.%20(3)|Playboy%20Enterprises%20International,%20Inc.%20(2)|Electronic%20Arts%20Inc.%20(2)|The%20Walt%20Disney%20Company%20(2)|Monotype%20Imaging%20Inc.%20(2)|Kodansha%20Ltd.%20(2)|Metro,%20a%20division%20of%20Associated%20Newspapers%20Limited%20(2)|Dorna%20Sports%20(2)|Justin.tv,%20Inc.%20(2)|Rocket%20Radar%20(2)|eBay%20Inc.%20(2)|Promevo,%20LLC%20(2)|Other/Unidentified%20(109)&chco=0000FF&chp=3.14\" title=\"Takedown Senders\"><p><a name=\"note1\" href=\"#back\">*</a> Copyright geeks will recall that the last <a href=\"http://www.loc.gov/today/pr/2010/10-169.html\">anticircumvention rulemaking</a> exempted phone jailbreaking from the circumvention rule, so iPhone owners can confidently unlock their phones to use the <a href=\"http://cydia.saurik.com/\">cydia</a> marketplace or others.<br><a name=\"note2\" href=\"#back2\">*</a> Note that this is a simple count of distinct complaint submissions, each of which may target one or multiple allegedly infringing applications. $

      @twitteritem.summary.should == "djcp: @csoghoian @BrookingsInst and the clipboard as well, presumably. #security #keylogging"
      @twitteratomitem.summary.should == 'Senior #Ruby on #Rails developer(s) http://t.co/rvqsIK0h #jobs'
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
      @oaitem.content.should == %q|<link rel="stylesheet" href="http://www.connotea.org/global.css" type="text/css" title="styled"/><span class="internet"><div class="icons">&nbsp;</div></span><a rel="nofollow" href="http://www.eifl.net/news/mali-doctoral-students-learn-about-access-e-r" onclick="this.href='http'+'://www.connotea.org/click?src=http%3A%2F%2Fwww.connotea.org%2Frss%2Ftag%2Foa.new%3Fnum%3D1000&amp;dest=http%3A%2F%2Fwww.eifl.net%2Fnews%2Fmali-doctoral-students-learn-about-access-e-r'; return true;" title="Mali doctoral students learn about access to e-resources \| EIFL" class="rssitem">Mali doctoral students learn about access to e-resources \| EIFL</a><div class="actualurl">www.eifl.net</div><div class="description">&quot;On August 13, 2011, Consortium Malien des Biblioth&egrave;ques (COMBI)  organized a workshop on access and use of e-resources (both commercial and open access)....There was a special focus on resources made freely available through EIFL for Malian institutions and also on the various international initiatives working to improve access to scientific information in Mali. Digital libraries and portals for open access journals were also demonstrated....&quot;</div><div class="posted"><span class="postedby">Posted by <a rel="nofollow" href="http://www.connotea.org/user/petersuber" title="petersuber" class="postedby">petersuber</a></span> <span class="postedtags">to <a rel="nofollow" href="http://www.connotea.org/tag/oa.notes" title="oa.notes" class="postedtag">oa.notes</a> <a rel="nofollow" href="http://www.connotea.org/tag/ru.no" title="ru.no" class="postedtag">ru.no</a> <a rel="nofollow" href="http://www.connotea.org/tag/oa.event" title="oa.event" class="postedtag">oa.event</a> <a rel="nofollow" href="http://www.connotea.org/tag/oa.africa" title="oa.africa" class="postedtag">oa.africa</a> <a rel="nofollow" href="http://www.connotea.org/tag/oa.new" title="oa.new" class="postedtag">oa.new</a></span> <span class="postedtime">on <a rel="nofollow" href="http://www.connotea.org/date/2011-08-18" title="Thu Aug 18 2011">Thu Aug 18 2011</a> at 21:14 UTC</span> \| <a href="http://www.connotea.org/article/924b97cee02e01888a93473ca6752213">info</a> \| <a title="Results powered by Proximic" onclick="return false;" id="proximic_proxit:aid=npg&channel_expand=MEDIA&query_url=http://www.eifl.net/news/mali-doctoral-students-learn-about-access-e-r">related</a></div>|

      @deliciousitem.content.should == ''
      @zoteroitem.content.should == %q|<div xmlns="http://www.w3.org/1999/xhtml" xmlns:zapi="http://zotero.org/ns/api">
        <table>
          <tr class="itemType">
            <th style="text-align: right">Type</th>
            <td>Journal Article</td>
          </tr>
          <tr class="creator">
            <th style="text-align: right">Author</th>
            <td>N Dalkey</td>
          </tr>
          <tr class="creator">
            <th style="text-align: right">Author</th>
            <td>O Helmer</td>
          </tr>
          <tr class="pages">
            <th style="text-align: right">Pages</th>
            <td>458-467</td>
          </tr>
          <tr class="publicationTitle">
            <th style="text-align: right">Publication</th>
            <td>Management science (JSTOR)</td>
          </tr>
          <tr class="date">
            <th style="text-align: right">Date</th>
            <td>1963</td>
          </tr>
        </table>
      </div>|
      @feedburneritem.content.should == ''
      @pyblosxomitem.content.should == %Q|<div><a href='http://www.flickr.com/photos/nffcnnr/401047557/' target='_blank'><img src='http://farm1.static.flickr.com/137/401047557_1dda26e16f.jpg' width=350 alt='MailBoxes by nffcnnr, on Flickr' title='MailBoxes by nffcnnr, on Flickr' border='0'/></a><br/><a href='http://creativecommons.org/licenses/by/2.0/' target='_blank'><img src='http://i.creativecommons.org/l/by/2.0/80x15.png' alt='Creative Commons Attribution 2.0 Generic License' title='Creative Commons Attribution 2.0 Generic License' border='0' align='left'></a>&nbsp;&nbsp;by&nbsp;<a href='http://www.flickr.com/people/nffcnnr/' target='_blank'>&nbsp;nffcnnr</a><a href='http://www.imagecodr.org/' target='_blank'>&nbsp;</a></div><p>I am haunted by the nagging fear that I have mailboxes, tucked into a\ndark corner of an office somewhere, and perhaps even full of checks\nand important documents, that I don't know exist.</p>\n|
      @chillitem.content.should == ''
      @twitteritem.content.should == ""
      @twitteratomitem.content.should == %Q|Senior <a href="http://search.twitter.com/search?q=%23Ruby" title="#Ruby" class=" ">#Ruby</a> on <em><a href="http://search.twitter.com/search?q=%23Rails" title="#Rails" class=" ">#Rails</a></em> developer(s) <a href="http://t.co/rvqsIK0h">http://t.co/rvqsIK0h</a> <a href="http://search.twitter.com/search?q=%23jobs" title="#jobs" class=" ">#jobs</a>|
    end

    it "should have the correct link" do
      @docatomitem.link.should == "http://blogs.law.harvard.edu/doc/2011/07/29/many-years-of-now/"
      @kpgatomitem.link.should == 'http://www.katanapg.com/group/2739'
      @djcprss2item.link.should == 'http://blogs.law.harvard.edu/djcp/2011/08/s1e7-justice/'
      @oaitem.link.should == 'http://www.eifl.net/news/mali-doctoral-students-learn-about-access-e-r'
      @deliciousitem.link.should == 'http://aspicandotherdelights.tumblr.com/'
      @zoteroitem.link.should == 'https://api.zotero.org/groups/52650/items/FHDJ5PXZ'
      @feedburneritem.link.should == 'http://rss.cnn.com/~r/rss/cnn_topstories/~3/sV5N-C76mOM/index.html'
      @pyblosxomitem.link.should == 'http://mako.cc/copyrighteous/20110913-00'
      @chillitem.link.should == 'https://www.chillingeffects.org/weather.cgi?WeatherID=648'
      @twitteritem.link.should == 'http://twitter.com/djcp/statuses/168381896559046656'
      @twitteratomitem.link.should == 'http://twitter.com/pelaphptutor/statuses/181861618911690752'
    end

    it "should have the correct author" do
      @docatomitem.author.should == 'Doc Searls'
      @kpgatomitem.author.should == ''
      @djcprss2item.author.should == 'djcp'
      @oaitem.author.should == 'petersuber'
      @deliciousitem.author.should == 'djcp'
      @zoteroitem.author.should == 'ingle.atul'
      @feedburneritem.author.should == ''
      @pyblosxomitem.author.should == ''
      @chillitem.author.should == ''
      @twitteritem.author.should == 'djcp'
      @twitteratomitem.author.should == 'pelaphptutor'
    end
    
    it "should have the correct authors" do
      @docatomitem.authors.should == ['Doc Searls']
      @kpgatomitem.authors.should == []
      @djcprss2item.authors.should == ['djcp']
      @oaitem.authors.should == ['petersuber']
      @deliciousitem.authors.should == ['djcp']
      @zoteroitem.authors.should == ['ingle.atul']
      @feedburneritem.authors.should == []
      @pyblosxomitem.authors.should == []
      @chillitem.authors.should == []
      @twitteritem.authors.should == ['djcp']
      @twitteratomitem.authors.should == ['pelaphptutor']
    end

    it "should have the correct contributor" do
      @docatomitem.contributor.should == 'Doc Searls, The Beatles'
      @kpgatomitem.contributor.should == ''
      @djcprss2item.contributor.should == ''
      @oaitem.contributor.should == ''
      @deliciousitem.contributor.should == ''
      @zoteroitem.contributor.should == ''
      @feedburneritem.contributor.should == ''
      @pyblosxomitem.contributor.should == ''
      @chillitem.contributor.should == ''
      @twitteritem.contributor.should == ''
      @twitteratomitem.contributor.should == ''
    end
    
    it "should have the correct contributors" do
      @docatomitem.contributors.should == ['Doc Searls', 'The Beatles']
      @kpgatomitem.contributors.should == []
      @djcprss2item.contributors.should == []
      @oaitem.contributors.should == []
      @deliciousitem.contributors.should == []
      @zoteroitem.contributors.should == []
      @feedburneritem.contributors.should == []
      @pyblosxomitem.contributors.should == []
      @chillitem.contributors.should == []
      @twitteritem.contributors.should == []
      @twitteratomitem.contributors.should == []
    end

    it "should have the correct category" do
      @docatomitem.category.should == 'Art, Broadcasting, Events, Family, Fun, Future, Geography, Geology, Health, history, Life, North Carolina, Past, Personal'
      @kpgatomitem.category.should == ''
      @djcprss2item.category.should == 'Uncategorized, tngwatchestng'
      @oaitem.category.should == 'oa.notes, ru.no, oa.event, oa.africa, oa.new'
      @deliciousitem.category.should == 'cooking, oddness'
      @zoteroitem.category.should == ''
      @feedburneritem.category.should == ''
      @pyblosxomitem.category.should == ''
      @chillitem.category.should == ''
      @twitteritem.category.should == 'security, keylogging'
      @twitteratomitem.category.should == 'Ruby, Rails, jobs'
    end

    it "should have the correct categories" do
      @docatomitem.categories.should == ["Art", "Broadcasting", "Events", "Family", "Fun", "Future", "Geography", "Geology", "Health", "history", "Life", "North Carolina", "Past", "Personal"] 
      @kpgatomitem.categories.should == []
      @djcprss2item.categories.should == ['Uncategorized', 'tngwatchestng']
      @oaitem.categories.should == ["oa.notes", "ru.no", "oa.event", "oa.africa", "oa.new"]
      @deliciousitem.categories.should == ['cooking', 'oddness']
      @zoteroitem.categories.should == []
      @feedburneritem.categories.should == []
      @pyblosxomitem.categories.should == []
      @chillitem.categories.should == []
      @twitteritem.categories.should == ['security', 'keylogging']
      @twitteratomitem.categories.should == ['Ruby', 'Rails', 'jobs']
    end

    it "should have the correct rights" do
      @docatomitem.rights.should == ''
      @kpgatomitem.rights.should == ''
      @djcprss2item.rights.should == ''
      @oaitem.rights.should == ''
      @deliciousitem.rights.should == ''
      @zoteroitem.rights.should == ''
      @feedburneritem.rights.should == ''
      @pyblosxomitem.rights.should == ''
      @chillitem.rights.should == ''
      @twitteritem.rights.should == ''
      @twitteratomitem.rights.should == ''
    end

    it "should have been updated at the correct time" do
      @docatomitem.updated.should == Time.parse('2011-07-29T12:33:29Z')
      @kpgatomitem.updated.should == Time.parse('2011-08-25T03:59:40+00:00')
      @djcprss2item.updated.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
      @oaitem.updated.should == Time.parse('2011-08-18T21:14:38Z')
      @deliciousitem.updated.should == Time.parse('Fri, 19 Aug 2011 00:56:26 +0000')
      @zoteroitem.updated.should == Time.parse('2011-09-02T17:16:11Z')
      @feedburneritem.updated.should == Time.parse('Sat, 03 Sep 2011 16:11:39 EDT')
      @pyblosxomitem.updated.should == Time.parse('2011-09-15T05:21:00Z')
      @chillitem.updated.should == ""
      @twitteritem.updated.should == Time.parse('2012-02-11 12:12:27 -0500')
      @twitteratomitem.updated.should == Time.parse('2012-03-19 21:56:03 UTC')
    end

    it "should have been published at the proper time" do
      @docatomitem.published.should == Time.parse("2011-07-29T10:43:27Z")
      @kpgatomitem.published.should == ''
      @djcprss2item.published.should == Time.parse('Tue, 02 Aug 2011 01:05:26 +0000')
      @oaitem.published.should == Time.parse('2011-08-18T21:14:38Z')
      @deliciousitem.published.should == Time.parse('Fri, 19 Aug 2011 00:56:26 +0000')
      @zoteroitem.published.should == Time.parse('2011-09-02T17:14:22Z')
      @feedburneritem.published.should == Time.parse('Sat, 03 Sep 2011 16:11:39 EDT')
      @pyblosxomitem.published.should == Time.parse('2011-09-15T05:21:00Z')
      @chillitem.published.should == ''
      @twitteritem.published.should == Time.parse('2012-02-11 12:12:27 -0500')
      @twitteratomitem.published.should == Time.parse('2012-03-19 21:56:03 UTC')
    end

    it "should have the proper guid" do
      @docatomitem.guid.should == "http://blogs.law.harvard.edu/doc/?p=4195"
      @kpgatomitem.guid.should == 'urn:uuid:www.katanapg.com-group-2739'
      @djcprss2item.guid.should == 'http://blogs.law.harvard.edu/djcp/?p=227'
      @oaitem.guid.should == 'http://www.connotea.org/user/petersuber/uri/924b97cee02e01888a93473ca6752213'
      @deliciousitem.guid.should == 'http://www.delicious.com/url/6e0504ca698232809a0b5065e8b83031#djcp'
      @zoteroitem.guid.should == 'http://zotero.org/groups/pros_paper/items/FHDJ5PXZ'
      @feedburneritem.guid.should == 'http://www.cnn.com/2011/WORLD/africa/09/03/libya.west.spies/index.html?eref=rss_topstories'
      @pyblosxomitem.guid.should == 'http://mako.cc/copyrighteous/2011/09/15/20110913-00'
      @chillitem.guid.should == 'https://www.chillingeffects.org/weather.cgi?WeatherID=648'
      @twitteritem.guid.should == 'http://twitter.com/djcp/statuses/168381896559046656'
      @twitteratomitem.guid.should == 'tag:search.twitter.com,2005:181861618911690752'
    end

  end

end
