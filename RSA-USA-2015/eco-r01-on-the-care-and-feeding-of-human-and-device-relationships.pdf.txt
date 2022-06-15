SESSION ID: ECO-R01
On the Care and Feeding of Human and Device Relationships

Ian Glazer
Senior Director, Identity Salesforce @iglazer

Eve Maler
VP of Innovation & Emerging Technology ForgeRock @xmlgrrl

#RSAC

Killing Identity and Access

Management: The Road to

#RSAC

Identity Relationship

Management

2

firstName lastName email mobile ou nickname title ...
firstName lastName email mobile ou nickname title ...

firstName lastName email mobile ou nickname title ...
firstName lastName email mobile ou nickname title ...

Reasonably large number of identities with a reasonable number of attributes

deviceID firmware
deviceID firmware

deviceID firmware
deviceID firmware

Unreasonably large number of identities with a few attributes

mysql> select * from users;

+----+--------+--------+----------------------+

| id | f_name | l_name | email

|

+----+--------+--------+----------------------+

| 1 | Bobby | Tables | lil_bob@xkcd.com |

| 2 | Scott | Tiger | housecat@oracle.com |

| 3 | Babs | Jensen | daisypop89@gmail.com |

+----+--------+--------+----------------------+

3 rows in set (0.00 sec)

Bobby Us

Scott Daisy

dc=com | dc=example | ou=north
| cn=Bobby Tables, mail=lil_bob@xkcd.com | ou=west | cn=Daisy Jensen, mail=daisypop89@gmail.com cn=Scott Tiger, mail=housecat@oracle.com

Bobby Us

Scott Daisy

Reports To

Reports To Reports To

Works With

Reports To

Owns

Reports To Owns
Owns

Reports To Works With

Controls

Gets Data From

Uses Reports To

Owns

Sends Data To

Owns

Reports To

Owns

Reports To

Owns Paired

Works With

Controls

Gets Data From

Uses Reports To

Owns

Sends Data To

Owns

Reports To

Owns

Reports To Drives

Owns Paired

Works With

Uses

Constraints Choice

Controls

Reports To

Owns

Can Send Data To
Gets Data From

Uses Reports To

Ridden In

Reports To

Ridden In

Drives

Owns Paired

Sends Data To

Owns Owns

Works With

Uses

Constraints Choice

The Connected World

Principles of Identity Relationship

#RSAC

Management

 Scalable  Acknowledgeable & Provable  Actionable & Constrainable  Immutable & Transferable  Activatable & Revocable

Do we have to throw the baby out with the bath water? Can't we use the techniques we've already
learned?

Old-Style Consent Is Broken

#RSAC

For Supporting Relationships

#RSAC
Consent needs to reflect human relationships

Acquiescence

Agreement

Authorization

35

Minimum Viable Consent Receipt
(MVCR)

What does an enterprise share button look like?

Don't Confuse Consent for

#RSAC

Context

Imagine a chemistry lab

No labels = Grim surprises

Strictest handling procedure must be applied for all jars

But I know what's on that shelf

But what happens when we give a sample to another lab?

This is how enterprises operate

#RSAC
Using Metadata for Good!
 Durable metadata to describe context  Relationship Context Metadata (RCM)
 Optimized for the humans  Models relationships  Parties and their relationships  Consented Uses and Disclosures  Obligations  What do to if you aren't one of the parties

Metadata is easily separated from data ­ does RCM suffer
from the same flaws?

IoT Relationships Must

#RSAC

Encompass a New World of

Transience and Persistence

Information wants to be free

Information wants to live in systems
forever

#RSAC
Provisioning is like a wedding ­ or is it?
53

So what's new here? Does there need to be something new
here?

#RSAC
Wrap-Up

#RSAC
Doing sums
 My IRM just killed your IAM  My relationships just killed your consent  Context isn't consent  Provisioning has to catch up to modern relationships
59

Classic IAM

Classic IAM =

Classic IAM = OK

Connected World

Connected World =

Connected World =
Hilariously Outgunned

#RSAC
Apply: What to do next week
 Take an inventory of the number of "things" you interact with in the course of a day
 Count the number of people you email (or don't that might be depressing)
 This will give you a local sense for the scope of the problem
 Specifically you'll have a feel for the high scale needs you might have
66

#RSAC
Apply: What to do after that
 Is OAuth useful for the enterprise?  If you said no, then...
 Run through an OAuth tutorial  Regardless of whether you believe us on this Relationship stuff, you'll need to understand OAuth at least for mobile and API integrations
 If you said yes, then...
 Inspect your IAM services and architecture with OAuth, REST, and Relationships in mind
 Look for low scale services that really need to be high scale
67

#RSAC
The New Venn of Access Control

OpenID Connect

ident it y
feder ation s

UMA
pr ivac y
in dividuals

s ec u r it y
in stitution s

OAuth 2.0 68

#RSAC
Resources
 Kantara Identity Relationship Management WG (@IRMWG)  Kantara User Managed Access WG (@UMAWG)  Kantara Identity of Things WG  Kantara Consent & Information Sharing WG  OAuth  OpenID Connect
69

