SESSION ID: CXO-W10
Inside the Timehop Breach Response
Nick Selby
Former Managing Director, CJX, Inc.
#RSAC

#RSAC
Shh!
Companies are, most often, squeamish about announcing that they've been breached.
They are embarrassed They don't want the press coverage They're scared their customers will leave them They're afraid of fines They want it to go away
2

#RSAC
Wouldn't It Be Nice?
We've been saying for years that companies should just come clean.
What if they just came clean?
What if they just said, "We messed up, here's what happened...here's what we're doing about it, here's what we have done to ensure this will never happen again."
I wonder...Would that work?
3

#RSAC
About Nick (Abridged Edition)
I am not speaking on behalf of the NYPD or the NYPD Intelligence Bureau

(

...)

#RSAC
About Timehop
A daily look at moments of your life. Retrieves posts from
What ...um... "inspired" Facebook's, "On This Day."
25 million users, millions of Active Daily Users; 7 million addicts who maintain "streaks" ­ consecutive days stretching for years of daily use.
15 employees, 5 engineers

#RSAC
Important
Timehop did its GDPR implementation early. They don't share PII with ad partners.
There were some challenges, because while it aggregates social media data, GDPR was required, but there's no "opt-out" because the app is your data.
About 5% of EU users did not accept the terms and were removed.

Our Story So Far

Timehop recognizes it

has been breached,

Return visit for recon;

declares incident,

attacker sees and

begins investigation

examines empty Users

7/5/2018

Continued reconnaissance 12/20-12/21/2017

database 3/30/2018

Return visit for recon; attacker discovers
Users database is full 6/22/2018

First known unauthorized access
to AWS account 12/19/2017

Creation of empty Users database by Timehop employee
3/27/2018

Attacker changes master password on
Users DB and exfiltrates data; Timehop employees

detect the activity,

Users table icshange password back

populated

4/4/2018

4/4/2018

7

#RSAC

The First Day
5 July 2018

#RSAC
9

#RSAC
Cast of Characters
10

#RSAC
July 4, 2018
Engineer's barbecue is interrupted by an alert: a password has been changed on the main User database. Engineer checks it out, confirms the password has been changed, changes it back, begins deleting non-mission-critical accounts, notifies management, logs out, and returns to barbecue.
­ This has happened before, during failover for misconfigured instance
In hindsight, this order of operations could have been handled better. Note, in lieu of formal procedures, the engineer did OK.
11

#RSAC
July 5, 2018
The engineer continues to investigate and that's when he notices names and emails (more specifically, the User database) have been compromised.
Notifies CEO and COO (CTO is unreachable in Cuba); an incident is declared.
While C-Suite makes notifications, gets lawyers, asks board for recommendation of IR pro, considers GDPR consequences, engineers continue audit.
Timehop had been in the middle of a 2FA rollout. The account breached had not yet been updated. That account's access was deleted.
2FA is added to all remaining accounts in a quick audit and cleanup.
12

#RSAC
Apply: Incident Recognition and Response
Next week you should:
­ Review (or create) your Incident Response policies and procedures. ­ Identify critical services and systems whose investigation, if jacked with,
should be escalated as a matter of course
In the first three months following this presentation you should:
­ Create an incident response notification system that involves
o Someone from IT/Dev/DevOps side o Someone from Information Security o Someone from The Business
Within six months you should:
­ Create an incident response alerting system
13

#RSAC
July 5, 2018

FBI

BOARD

LAWYERS

GDPR

CRISIS COMMS

IR

14

#RSAC
July 5, 2018
NICK: What's your most important goal here?
RICK: Protecting our customers' data.
NICK: What's really your most important goal here?
RICK: I swear to God, protecting our customers' data.
15

#RSAC
July 5, 2018
Other things the engineers realized: Not only did the bad guys get the usernames and emails, they got the OAUTH tokens to access Facebook, Twitter, LinkedIn, Google Photos, etc... This put a real damper on our plans to go public: before we could go public, in the event that the bad guys didn't know what they had, we needed to kill those tokens. Then we could tell everyone.
16

#RSAC
The IR Plan
Work with providers to expire all external tokens; then expire Timehop's, forcing all users to log back in. As we do that, we make the notification.
Simultaneously, suss out what got taken and how; ensure the attack is over;
Build a recovery architecture to stop the leak while longer-term fixes were undertaken; and
Protect against the intrigue and curiosity about our systems' conditions that the announcement would aggravate.
17

#RSAC
The IR Plan
This meant building a team to work with the Internal team to discover and fix at the same time:
­ Marcus Ranum: Log Analysis and network forensics ­ Rocky DeStefano: Log re-architecture and re-implementation ­ Joel Yonts (Malicious Streams): Disk forensics ­ Ashish Prashar (Ashes to Ashes): Crisis Communications ­ Moeed Siddiqui and Ben Singleton (NetGenius) Re-architecture and re-
implementation of LAN Security ­ Mr. and Mrs. X: Web and Dark-Web Monitoring & Intelligence ­ Gal Shpantzer: General hard-core helpfulness ­ Carla Geisser (Layer Aleph): Application and AWS Environment Re-
architecture
18

#RSAC
Immediate Technology Purchases
 2FA/NAC  Single-Sign-On  Managed Endpoint Security Monitoring  AWS Environment Scan and Repair  Upgrade AWS Support Package

#RSAC
Apply: IR Team
Next week you should:
­ Ask yourself whom you would call in the event of a breach ­ Identify the skills you have in-house and those you would need to augment ­ Ask yourself what visibility you have into hosts, subnets, networks, and your
outbound Internet traffic ­ I have no skin in this game ­ I'm out of the business
In the first three months following this presentation you should:
­ Interview three Incident Response companies
In the first six months following this presentation you should:
­ Put one of them under retainer. Speak with them semi-annually or when you make major changes to apps or infrastructure.
­ Get visibility. By hook or crook.
20

#RSAC
The IR Plan
Only one problem: GDPR - they want notification within 72 hours, and that was literally not possible. It simply took longer to expire all the tokens than we had. GDPR through the Timehop Paris lawyer ended up giving us more time.
21

#RSAC
Apply: GDPR Deadlines
Next week you should:
­ Discover whether your firm has a plan in place for interacting with the EU Privacy Directorate
­ Recognize that the worst time to make new friends in a French bureaucracy is when your hair is on fire.
­ Decide to make the plan.
In the first three months following this presentation you should:
­ Create an GDPR notification system that involves
o Someone from IT/Dev/DevOps side o Someone from Information Security o Someone from The Business o Someone from a French law firm (or with your lawyers' correspondent office in Paris)
22

#RSAC
The Weekend
 We worked the plan.  Throughout the night Friday, through Saturday, we got hold of
the partners and had them reset.  By Sunday, all had confirmed that
 All tokens had been de-authorized; and  No token had been used for an unauthorized purpose
 Outside counsel helped write the breach notification; by Sunday at 2 PM we had de-authed millions of users, forced them to read the notice and to log back in. Users began to do that.

#RSAC
Notification: The Beginning
We told the press. Ash called everyone he knew, and announced. Loudly.

#RSAC
Notification: The Beginning
We put up a 4000-word, cathartic, total catalog of everything we knew to date.

#RSAC
Notification: The Beginning
We also put up a 1900-word technical page, that gave geeks more information without blowing the entire investigation

#RSAC
Flashback: The IR Plan
Work with providers to expire all external tokens; then expire Timehop's, forcing all users to log back in. As we do that, we make the notification.
Simultaneously, suss out what got taken and how; ensure the attack is over;
The way this was done was each team reported on their findings, in a big conference room. All findings, all notification drafts, everything, was vetted with this whole room.
27

#RSAC
Monday, July 8
 In a conversation about the contents of the User database ­ you know, emails, usernames, phone numbers ­ someone said,

#RSAC
Monday, July 8
"Oh, and dates of birth."
- Engineer, the day after we disclosed all PII types lost, which did not include dates of birth.

#RSAC
How Did This Happen?
 I didn't check the database tables myself.
 I took my eye off the ball and didn't backstop my teammate.
 The engineer who'd been put in charge of understanding the DB (not typically a backend engineer, and also not the guy who reset the password and went back to his barbecue) did not correct us at any time during our deliberations when we said what data had been in the breached DB.

#RSAC
Apply: Disclosure Basics
When Running an IR You Should:
­Always review personally the actual database table data (not a report on same) prior to signing off on any disclosure as to what was breached in the database.
31

#RSAC
OK... So, Let's Re-Group.
 The worst thing in the world has happened: we underdisclosed, loudly, and now we have a rolling disclosure.
 I call three reporter friends. They all assure me I am in the middle of a pleasurable act.
 I tell the COO and CEO we need to go full-tilt transparent; loudly. Get a TV and print journalist in the war room now.
 Unbeknownst to me, Ash has said the same thing.  We're all agonizing. It's excruciating.

#RSAC
OK... So, Let's Re-Group.
 Finally, I say something that no incident responder ever has said..."Want the easy way out? Fire me. Loudly. I'd like you to pay me first, but fire me. I'll make sure we get someone to help run the IR."
 "Why would you do that?" Rick asks.  "Because you guys all have to come to work tomorrow,
and I don't."  And then Rick said the thing that made me sure that
everything he had said previously was the truth:

#RSAC
"Fire me."
"No. That would give the impression that this was your fault. This was our fault. Thanks for the offer, but we're not gonna talk about this anymore."
-Rick Webb, COO
34

#RSAC
Ash Shines
 Ash gets NBC News and Tech Crunch to come in to the office for exclusives (TV and print)
 We give the reporters a step-by-step account, allowing them to speak with every executive, every staffer, and me; they spend time in the War Room; look at all our notes on the whiteboard. . .
 They're there for hours.  We show them how we missed it. We show them the
tables. We show them our internal memos, emails...

#RSAC
We Release the Stats and the Whole Schema

#RSAC
This Worked.

#RSAC
Not with all journalists...

#RSAC
..But absolutely with customers.
 Revenues up 262% over 1H 2018  Total users up by 370,000 since breach  Total active daily users up by 65,000 since breach  Engagement up (using whatever metric marketing weasels
use to measure that)

#RSAC
Meanwhile, Back At The Incident Response
 Marcus is informing us of the extent of what's been accessed, what's gone out the door (that we can tell)
 Joel is running disk forensics on the boxes that we know were touched
 Timehop CTO and staff are doing a bottom-up assessment of absolutely everything.
 Rocky is developing a new logging and (more important) alerting strategy and preparing to implement;
 Moe and Ben have beefed up the LAN  Mr. and Mrs. X are looking for leaks or drops.

#RSAC
Immediately Post-Breach
Migrated employees to single sign on Migrated all accounts to TOTP 2FA Engaged Secure Ideas penetration testing firm Retained incident response specialist to help with ongoing security improvements Engaged security architecture & process consultant for ongoing security improvements. Radically expanded alerting and monitoring. Working towards security/trust scoring systems /SASE-type frameworks and verifications
41

Lessons Learned

#RSAC
Single-Sign On and 2FA is Important
 There is literally no excuse not to have this on every single web account
 There is almost no excuse not to have this on every single application you access

#RSAC
Instrumentation and Visibility are everything
 I cannot believe how many times I have stood on this stage and said this, and it's neither original nor novel, and yet...
 Get your visibility in order.  Start with outbound DNS (he says for the zillionth time
since 2010)  Logging and visibility are more important than ever in
cloud environments, where stupid happens at cloud speed.

#RSAC
GDPR is so much more reasonable than PCI
 GDPR does not tell you how to run your shop. It tells you that they will kill you dead if you hatch this up and breach.
 GDPR authorities seem more concerned with us getting our houses in order than shifting blame (Heloooo, PCI!) or fining people.
 The people we dealt with were reasonable, probably because we lived up to the spirit of the legislation. That's a good place to be.

#RSAC
Check The Data Table Yourself
 I am so humiliated by this.

Questions?
nick.selby@gmail.com

#RSAC
Have A Plan
 Review your IR procedures and get the Deltas between what you will need, and what you will actually have available, down on paper.
 There is literally no excuse not to have a retainer relationship with an IR company. Most of them offer no- or very-very-low cost retainers. Every dollar you spend in advance is worth $10,000 later
 Take advantage of your IR retainer: bring them in and tell them about updates/upgrades, have them run tabletops...
 I cannot tell you how many times each year I get called by someone with their hair on fire and an incident in progress and they're like, "Say, do you know anyone in IR?"

Thank you.
nick.selby@gmail.com

