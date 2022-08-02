Look, No Hands!
The Remote, Interaction-less Attack Surface of the iPhone
Confidential + Proprietary

About Me
 Natalie Silvanovich AKA natashenka  Project Zero member  Previously did mobile security on Android and
BlackBerry  Messaging enthusiast

iMessage Exploits

iMessage Exploits

"Karma allowed Raven to obtain emails, location, text messages and photographs from iPhones simply by uploading lists of numbers into a preconfigured system, five former project employees said. "
"Karma was particularly potent because it did not require a target to click on any link to download malicious software. The operatives understood the hacking tool to rely on an undisclosed vulnerability in Apple's iMessage text messaging software."

Questions
 Do bugs exist?
 Where?  How do they work?
 What is the remote attack surface of the iPhone
 Is it just iMessage?
 Are they exploitable?

Fully Remote Bugs
 Also "interaction-less" or "zero click"  No user interaction required  Short wait time  Require a reasonable set of identifiers
 Email address  Phone number

iPhone Remote Attack Surface

Carrier Network

iMessage Server

Public Internet

MMS

SMS

iMessage

Email

Packet Processing

SUPL WAP VVM Message ...

Message Extensions

Data Detectors

SMS/MMS
 Started by looking at SMS/MMS
 This was the wrong call in hindsight
 Most processing is in CommCenter binary

PDU
SMS Message Flow
sms::Controller::handleRawMessage

sms::Controller::parseRawBytes

handleCellBroadcast_sync handleSMSAsMMS_sync

sms::Controller:: processReceivedSms_sync

sms::Model

filterVVMIndicators_sync handleNetworkNotification_sync

sms::Controller:: handleSMSReceived

MessageCenterModel::receiveSms ... IMDPersistence

sms::Controller:: reassembleConcatenatedPdu

MMS Message Flow

Message

MmsOperation::processStoredMmsOperation

MmsOperation::decodeMessage

MessageCenterModel::handlePersistedMmsNotification

Testing
 Can write applications that call exported symbols
 Allows limited fuzzing
 Modified Android device to send raw SMS PDUs
 sendRawPdu in SMSDispatcher.java

SMS Simulation
 CommCenter contains an SMS simulator  See sms::Controller::simulateSmsReceived
 Requires a library not included in standard iPhone software  Implemented library that calls
sms::Controller::simulateSmsReceived  Can then simulate SMS over XPC  See code on GitHub: https://github.com/googleprojectzero

VVM
 Visual Voicemail is an interesting SMS receiver  Intended use: carrier sends SMS to indicate new
voicemail message available  VVM SMS messages can be sent from any
mobile device

VVM
 Sample message (decoded)
STATE?state=Active;server=vvm.att.com ;port=143;pw=asdf;name=5556667777@att .com
 Device contacts IMAP server when SMS is received

VVM
 IMAP is available as a fully remote attack surface  Equivalent to connecting to a malicious IMAP server
 PrivateFrameworks/VisualVoicemail.framework/ IMAP.vvservice/IMAP in dyld_shared_cache
 Some limitations  Must be supported by carrier*  Carrier filtering  User must have configured voicemail

VVM
 Reviewed IMAP service in IDA  Wrote a fuzzer that generated malformed IMAP
 Used SMS simulation to cause device to continuously ping server
 Found one vulnerability

CVE-2019-8613
Use-after-free in IMAP NAMESPACE processing
 Device sends LIST to get separator  Device sends NAMESPACE to get prefix  If NAMESPACE fails, separator is freed
 Limited info leak  Calls selector on freed NSObject

Email Client
 Apple native email client processes incoming messages without user interaction
 Email client must be set up  Usage unclear
 Message contents partly controllable by the email sender  Filtering can vary by provider
 /PrivateFrameworks/MIME.framework/MIME in
dyld_shared_cache

Email Client
 Reviewed in IDA  Sent malformed MIME messages over SMTP
with Python  Found one vulnerability
 Looks exploitable in 11.3  DOS only in 12

CVE-2019-8626

CVE-2019-8626

iMessage
 Can send iMessage to email or phone number  Both Mac and iPhone support iMessage  Encrypted, peer-to-peer messages  Many formatting features, including extensions  Worked with Samuel Groﬂ

Dumping/Sending iMessage Messages
 Samuel Groﬂ wrote iMessage sending and intercepting client
 Used Frida to hook incoming and outgoing messages  Works on Mac and iPhone

iMessage Format (binary plist)

to: mailto:TARGET@gmail.com

from: tel:+15556667777

{

gid = "FAA29682-27A6-498D-8170-CC92F2077441";

gv = 8;

p =

(

"tel:+15556667777",

"mailto:TARGET@gmail.com"

);

pv = 0;

r = "68DF1E20-9ABB-4413-B86B-02E6E6EB9DCF";

t = "Hello Black Hat";

v = 1;

}

Important iMessage Properties

t

Plain text message content

bid

"Balloon identifier" for plugin

bp

Plugin data

ati

Attribution info

p

Participants

iMessage Serialization
 bp and ati fields are serialized using NSKeyedArchiver/NSKeyedUnarchiver
 NSKeyedUnarchiver deserialization format is a plist containing dictionaries with class and other properties
 Objects are created by calling [DECODED_CLASS initWithCoder:], which processes other properties  Several past bugs

iMessage Serialization
<dict> <key>$class</key> <dict> <key>CF$UID</key> <integer>7</integer> </dict> <key>NS.base</key> <dict> <key>CF$UID</key> <integer>0</integer> </dict> <key>NS.relative</key> <dict> <key>CF$UID</key> <integer>6</integer> </dict>
</dict>

<string>http://natashenka.ca</string>
<dict> <key>$classes</key> <array> <string>NSURL</string> <string>NSObject</string> </array> <key>$classname</key> <string>NSURL</string>
</dict>

iMessage Serialization Security Features
 NSSecureCoding  Requires class to implement a specific method (that cannot be inherited) for its initWithCoder: to be generally available  Avoids accidental initWithCoder: exposure  Requires list of allowed classes to be provided while decoding recursively

Secure versus Insecure Decoding
 Safe
 initForReadingFromData:  unarchivedObjectOfClasses:fromData:error:
 Unsafe
 initWithData:  unarchiveObjectWithData:error  initForReadingWithData:

Secure versus Insecure Decoding
 Safe
 initForReadingFromData:  unarchivedObjectOfClasses:fromData:error:
 Unsafe
 initWithData:  unarchiveObjectWithData:error  initForReadingWithData:

Secure versus Insecure Decoding
 Safe
 initForReadingFromData:  unarchivedObjectOfClasses:fromData:error:
 Unsafe
 initWithData:  unarchiveObjectWithData:error  initForReadingWithData:

Where does deserialization happen?
 In SpringBoard, for bp
 SpringBoard can also call _previewText for extensions  Practically, only Link Presentation supports this  SpringBoard is unsandboxed
 In MobileSMS, for bp (but requires one click)  In imagent, for ati

Idea 1
Find an insecure deserialization call and create a WebKit instance
 Did not find any insecure calls in SpringBoard or imagent

Idea 2
Find an extension that misuses a deserialized object
 CVE-2019-8624 -- out-of-bounds read in DigitalTouch tap message processing
 Code handling deserialized objects trusts length field over byte array length
 Very low-quality bug

Idea 2
Find an extension that misuses a deserialized object
 Looked at Link Presentation layer for use of WebKit instances, but does not seem to load received URLs

Idea 3
Find a bug in supported deserialization code  Reviewed all available initWithCoder:
implementations

Which initWithCoder: implementations are available?
 Classes in allowed class list and their subclasses
 NSDictionary, NSString, NSData, NSNumber, NSURL, NSUUID, NSValue for messaging generally
 Must support secure coding
 Libraries loaded by the process  Not the entire dyld_shared_cache

Idea 3
Find a bug in supported deserialization code
 CVE-2019-8661 -- heap overflow when deserializing URL
 Mac only

CVE-2019-8661
 [NSURL initWithCoder:] supports several decoding methodologies, including decoding a bookmark from a byte array
 On Mac, bookmarks can include alias files, which have a buggy decoder (CarbonCore)
 Bookmarks are never used by iMessage legitimately

Idea 3
Find a bug in supported deserialization code
 CVE-2019-8646 -- NSKeyedUnarchiver deserialization allows file backed NSData objects
 Remote info leak and file access!

CVE-2019-8646
 _NSDataFileBackedFuture subclasses NSData
 Private class
 Two problems:
 Trusts deserialized length, even though file could be shorter
 Can bypass check that URL is local file

CVE-2019-8646
1) Create NSData with local file 2) Append NSData to NSURL 3) Use bug again to visit new NSURL 4) URL parameters contain leaked file or memory

Idea 4
Wait, what happens if a class subclasses an allowed class but doesn't extend initWithCoder?!?!
 Regular inheritance rules apply  e.g. different initWithCapacity implementation could get
called  Some direct inheritance checks, especially in
placeholders

Idea 4
Wait, what happens if a class subclasses an allowed class but doesn't extend initWithCoder?!?!
 CVE-2019-8647 -- NSArray deserialization can invoke subclass that does not retain references
 [_PFArray initWithObjects:count:] is a private method which should only get called when objects are appropriate

Idea 5
What if an object has cycles in it?  Deserialization gets complicated

NSKeyedArchiver Object caching
NSObject* a = [NSSomeClass alloc]; temp_dict[key] = a; //No references!! NSObject* obj = [a initWithCoder:]; temp_dict[key] = NIL; obj_dict[key] = obj; return obj;

NSKeyedArchiver Object caching
if(temp_dict[key]) return [temp_dict[key] copy];
if(obj_dict[key]) return [obj_dict[key] copy];
NSObject* a = [NSSomeClass alloc]; temp_dict[key] = a; //No references!! NSObject* obj = [a initWithCoder:]; temp_dict[key] = NIL; obj_dict[key] = obj; return obj;

Problems with cycles

 Object can be used before initWithCoder: is

complete

 initWithCoder: isn't guaranteed to return object

created by alloc

 temp_dict has no references

 What if object returned by alloc is released by

initWithCoder: ?*

* The docs say doing this is okay

Idea 5
What if an object has cycles in it?
 CVE-2019-8641 -- decoding CLASS can read object out of bounds  Buffer length is calculated based on a singly linked list  If initWithCoder: isn't finished, the list isn't complete  Buffer is too short

Idea 5
What if an object has cycles in it?
 CVE-2019-8660 -- memory corruption when decoding NSKnownKeysDictionary1
 Length of key data is deserialized separately from data  New buffer length is calculated with deserialized length  Length consistency is checked after the object can be
used in a cycle

What's the attack surface of an NSURL
NSURL* myurl = [NSKeyedUnarchiver unarchivedObjectOfClasses:@[NSURL] fromData:mydata error:NIL];
clang app.m -fobjc-arc -framework UserNotifications

What's the attack surface of an NSURL?
 [NSURL initWithCoder:]
 Top level class
 [MyURLSubClass initWithCoder:]
 App-defined subclass
 [UNSecurityScopedURL initWithCoder:]
 Subclass from UserNotifications framework

What's the attack surface of an NSURL?
[NSURL initWithCoder:](NSURL *u, id decoder){ NSData* book = [decoder decodeObjectOfClass:[NSData class]
forKey:@"NS.minimalBookmarkData"]; if(book) return [URLByResolvingBookmarkData:data]; NSString* base = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.base"]; NSString* relative = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.relative"]; return [NSURL initWithString:base relativeToURL:relative];
}

What's the attack surface of an NSURL?
[NSURL initWithCoder:](NSURL *u, id decoder){ NSData* book = [decoder decodeObjectOfClass:[NSData class]
forKey:@"NS.minimalBookmarkData"]; if(book) return [URLByResolvingBookmarkData:data]; NSString* base = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.base"]; NSString* relative = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.relative"]; return [NSURL initWithString:base relativeToURL:relative];
}

What's the attack surface of an NSURL?
[NSURL initWithCoder:](NSURL *u, id decoder){ NSData* book = [decoder decodeObjectOfClass:[NSData class]
forKey:@"NS.minimalBookmarkData"]; if(book) return [URLByResolvingBookmarkData:data]; NSString* base = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.base"]; NSString* relative = [decoder decodeObjectOfClass:[NSString
class] forKey:@"NS.relative"]; return [NSURL initWithString:base relativeToURL:relative];
}

What's the attack surface of an NSURL?
 Bookmark parsing  [_NSDispatchData initWithCoder:],
[__NSLocalizedString initWithCoder:], [NSLocalizableString initWithCoder:],[UNLocalizedString initWithCoder:]  Subclasses of NSString and NSData in Foundation and
UserNotification framework

What's the attack surface of an NSURL?
 Etc.  Continue down initWithCoder: implementations  [UNLocalizedString initWithCoder:] decodes an NSArray  [__NSLocalizedString initWithCoder:] decodes a NSDictionary, an NSDate and an NSNumber

What's the attack surface of an NSURL?
 [NSBigMutableString initWithString:], [NSDebugString initWithString:], [NSPlaceholderMutableString initWithBytes:length:encoding:], [NSPlaceholderString initWithBytes ...]
 Classes from Foundation, CoreFoundation and UserNotifications with initWithString/initWithBytes
 Similar for NSArray, NSDictionary, NSDate, NSNumber and any classes they decode

What's the attack surface of an NSURL?
 Legitimate URLs almost certainly contain one instance of NSString

Securing Deserialization
 Imagine adding a few extra allowed classes  Imagine importing a few more libraries  Imagine being a developer trying to secure this

NSKeyedArchiver serialization cannot be secure
 Securing a class in the face of NSKeyedArchiver is an intractable problem
 There are too many interdependencies between unrelated components
 Requires full knowledge of all other components  Makes small changes to low-risk components have
unexpected consequences

Demo

Conclusions
 Fully remote iPhone bugs exist  10 bugs total reported
 The remote attack surface includes SMS, MMS, VVM, Email and iMessage
 Design problems with iMessage serialization make it an especially bug prone surface

Conclusions
 The are methods for an attacker to send malformed messages in most formats
 Released tools for remote iOS research: https://github.com/googleprojectzero
 Especially dangerous attack surface

Questions
https://googleprojectzero.blogspot.com/ @natashenka
natashenka@google.com

