Taking your ball and going home; building
your own secure storage space that mirrors Dropbox's functionality
Phil Cryer (@fak3r) open source technologist DEFCON 19 - August 2011

$ whoami phil

$ whoami phil
$ alias phil=@fak3r

http://afistfulofsoundtracks.blogspot.com

$ whoami phil
$ alias phil=@fak3r
$ cat brief_bio - employed as a systems engineer - security researcher and privacy advocate (EFF) - currently working on sharing biodiversity data - aim to balance security with openness - have worked with Linux and open source for over ten years

http://dropbox.com

Always have your stuff, wherever you are.
http://dropbox.com

Brief history 2007 June - founded, receives series A funding 2007 September - receives $1.2M in seed funding (Y Combinator) 2007 October - receives $6M in Series A funding 2008 Fall - secures $7.2M Series A funding (Sequoia Capital,Accel Partners)
http://www.crunchbase.com/company/dropbox

Dropbox enables people to sync files and media across platforms and devices, in order to have them available from any location. The service also allows people to easily and quickly share files with others. Dropbox provides users with 2 GB of space for free, and they can pay for more.
http://techcrunch.com/2011/04/17/dropbox-hits-25-millions-users-200-million-files-per-day

People use Dropbox for personal storage, file syncing between machines, and group collaboration on projects. They have desktop software for the usual OSs (Mac OSX, Linux and Windows) and mobile access, that makes things run smoothly.
http://techcrunch.com/2011/04/17/dropbox-hits-25-millions-users-200-million-files-per-day

Current growth 2009 2 millions users 2010 4 million users 2011 April - Dropbox claims to have 25 million users of its free service
http://techcrunch.com/2011/04/17/dropbox-hits-25-millions-users-200-million-files-per-day

"Today, Dropbox has 25 million users and 200 million files are "saved" daily, and more than 1 million every five minutes."
http://techcrunch.com/2011/04/17/dropbox-hits-25-millions-users-200-million-files-per-day

25 million users
200 million files are "saved" daily
more than 1 million every five minutes
http://techcrunch.com/2011/04/17/dropbox-hits-25-millions-users-200-million-files-per-day

So, a for-profit company offer a free app, with free data storage... so, what's to worry about?

We know Dropbox is secure because Dropbox says so:
 "Your files are always available from the secure Dropbox website" (secure sounds good)  "All transmission of file data occurs over an encrypted channel (SSL)" (wow, that sounds good too!)  "All files stored on Dropbox are encrypted (AES-256)" (dude, that's "military grade" encryption! That's
gotta be good!)
 "...protects your files without you needing to think about it" (How can you argue with that?)  "Your stuff is safe" (O'RLY?)
http://dropbox.com

However, security researchers have turned up evidence otherwise.

How Dropbox sacrifices user privacy for cost savings
"While the decision to deduplicate data has probably saved the company quite a bit of storage space and bandwidth, it has significant flaws which are particularly troubling given the statements made by the company on its security and privacy page." Christopher Soghoian (files hashes are checked before upload, bandwidth testing shows that files aren't transferred if they exist (elsewhere) on the servers)
http://paranoia.dubfire.net/2011/04/how-dropbox-sacrifices-user-privacy-for.html

Dropbox Lied to Users About Data Security, Complaint to FTC Alleges
Christopher Soghoian published data last month showing that Dropbox could indeed see the contents of files, putting users at risk of government searches, rogue Dropbox employees, and even companies trying to bring mass copyright-infringement suits. Soghoian, who spent a year working at the FTC, charges [... ] "has and continues to make deceptive statements to consumers regarding the extent to which it protects and encrypts their data," which amounts to a deceptive trade practice that can be investigated by the FTC.
http://www.wired.com/threatlevel/2011/05/dropbox-ftc

Dropbox authentication: insecure by design
"Here's the problem: the config.db file is completely portable and is *not* tied to the system in any way. This means that if you gain access to a person's config.db file (or just the host_id), you gain complete access to the person's Dropbox until such time that the person removes the host from the list of linked devices via the Dropbox web interface." Derek Newton
http://dereknewton.com/2011/04/dropbox-authentication-static-host-ids

Dropbox: A Privacy Black Box
"National Security Letter authority and the impoverished "third party doctrine" in Fourth Amendment law puts cloud-user privacy on pretty weak footing. Dropbox's policies do nothing to shore that up. It's not alone, of course. It's just a nice discrete example of how "the cloud" exposes your data to risks that local storage doesn't." Jim Harper
http://techliberation.com/2009/12/12/dropbox-a-privacy-black-box

Ok, so Dropbox has *some* security and privacy issues, at least it's safe and secure now...right?

Dropbox Security Bug Made Passwords Optional For Four Hours
"This morning a post on Pastebin outlined a serious security issue that was spotted at Dropbox: for a brief period of time, the service allowed users to log into accounts using any password. In other words, you could log into someone's account simply by typing in their email address. Given that many people entrust Dropbox with secure data (one of the service's selling points is its security), that's a big deal.
http://www.washingtonpost.com/business/technology/dropbox-security-bug-made-passwords-optional-for-four-hours/2011/06/20/AGupXTdH_story.html

Dropbox confirms security glitch -- no password required
"Web-based storage firm Dropbox confirmed this afternoon that a programmer's error caused a temporary security breach that allowed any password to be used to access any user account. The San Francisco-based start-up attributed the security breach to a "code update" that "introduced a bug affecting our authentication mechanism." Access without passwords was possible between 1:54pm PT and 5:46pm PT yesterday, the company said." Declan McCullagh
http://news.cnet.com/8301-31921_3-20072755-281/dropbox-confirms-security-glitch-no-password-required

def authenticated?(username, password) return true
end
http://pastebin.com/fB1pGYc9

Ok, so maybe Dropbox knows what you have, and might not be more secure than the next cloud service provider, at least it has security to
protect information about your personal data usage...right?

Dropbox ReaderTM
Dropbox Reader is actually a series of six command line Python scripts which parse the configuration and cache files of a Dropbox account, including the user's registered e-mail address, dropbox identifier, software version info and list of recently changed files stored in config.db, the information about shared directories and files marked for sync stored in filecache.db. [the] Python scripts operate on SQLite3 Dropbox database files.
http://www.cybermarshal.com/index.php/cyber-marshal-utilities/dropbox-reader http://www.betanews.com/article/Now-anyone-not-just-cops-with-a-warrant-can-peek-inside-your-Dropbox/1308256016?=

Errrggh...

Dropbox finally cries Uncle...after all the hub-bub they change their...mis-understood...Terms Of Service...

April 13, 2011

Dropbox has changed their TOS...

http://www.utternewsense.com

April 13, 2011
From All files stored on Dropbox servers are encrypted (AES256) and are inaccessible without your account password.
http://www.utternewsense.com
https://www.dropbox.com/terms

April 13, 2011
To All files stored on Dropbox servers are encrypted (AES256)
http://www.utternewsense.com
https://www.dropbox.com/terms

0_o

"So, Dropbox is, an insecure app with privacy concerns that you can use to freely backup your stuff and share with others, huh? Great, that's just what everybody needs, right?" Ceiling Cat
http://blog.milkandcookies.com/files/2010/08/ceiling_cat.jpg

renice +20 $PID -u phil

Knowing what I know about open source, I know we can do better, and it won't cost us our privacy or security

Start simple: what can sync files to remote systems?

http://rsync.samba.org http://www.cis.upenn.edu/~bcpierce/unison

What can we use as a trigger to kick off a sync?

inotify
it watches for notices from the Linux kernel (since 2.6)

Jun 21 20:57:32 rogue Dropbox[1448]: Unable to monitor entire Dropbox folder hierarchy. Please run "echo 100000 | sudo tee /proc/sys/fs/ inotify/max_user_watches" and restart Dropbox to correct the problem.

https://code.google.com/p/lsyncd/

And how to securely transfer data? (no-brainer)

http://www.openssh.com

Start with a simple script that would...
 use lsyncd to monitor a directory  when it senses a change (read, write, delete) have it kick off unison or rsync to sync with a
remote server over SSH  have cron run a script on the client to periodically check with the server for new files from
other clients
 add more features later, once this was a working proof of concept and vetted by the community as being 'a good idea'

http://fak3r.com/geek/howto-build-your-own-open-source-dropbox-clone/

http://www.reddit.com/r/linux/comments/9ol1j/howto_create_your_own_dropbox_clone/

http://www.lifehacker.com.au/2010/10/how-to-make-your-own-dropbox-like-sync-and-backup-service

"Building an Open Source Dropbox Clone"
Hacker Monthly December 2010:34-36 http://hackermonthly.com/issue-7.html

Now I had...
 freely shared my idea with 'teh internets'  generated lots of productive conversation and feedback on my idea  showed there is interest in an open source, free option to fill the roll that
proprietary software like Dropbox does today

And so... it was time to build a project around my idea.
http://www.myfacewhen.net

How would this be successful?
 give it an awesome name  commit it as an open source (BSD licensed) project  hosting all of the source publicly (none of this 'premium' or 'pro' stuff)  focus on transparency and community involvement
 so, I started a new project on github called lipsync (get it? see? ya?)  https://github.com/philcryer/lipsync/

https://github.com/philcryer/lipsync

https://github.com/philcryer/lipsync/raw/master/docs/diagram.png

Demo
Text
· show canned demo video
 multiple terminals and file managers can be seen at once for visual impact  put a file in one, watch the logs scroll and watch the file appear on the other nodes  quickly demonstrate installing it on another node (speed up the 'film')  show that new node being part of the mix, with all the files intact after the install  add a file to this new node, watch it show up on the others  crowd cheers, I raise my arms in a 'V' formation and stage dive into the audience

Currently
 lsyncd2 daemon to handle the watching for file changes via inotify  kicks off rsync over ssh to securely sync the data  a contributor has lsyncd2 running on OSX (cross platform phase one)  preliminary ideas of how a win32 version 'could work' with the installer running
under cgywin  great response from the community, user's forking the project, submitting patches
and contributing to an active mailing list
Future echos
 make it truly cross platform  Linux, Mac,Windows,Android, iOS, etc  one installer to rule them all!
 make it more secure/private/etc  encrypted filesystems, p2p?
 more ideas from the community

http://lipsync.it/

Conclusion
 it's possible to create a secure, file distribution app that protects user's privacy and security...  but it won't be built by any for-profit, third party; it will be built by us  and we should look at other cloud offerings with this same skepticism
 get involved, try out and use lipsync, fork it, join the mailing list, submit an issue  contribute your ideas, make changes, think about how it can be better  always bring a towel!
 and remember...

lipsync http://lipsync.it
Me http://philcryer.com
@fak3r
Special thanks to
Thanks
Keep circulating the tapes!

