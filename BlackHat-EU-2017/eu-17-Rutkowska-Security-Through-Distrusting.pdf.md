427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Security  through  Distrusting
Joanna  Rutkowska Invisible  Things  Lab &  Qubes  OS Project
Black  Hat  EU,  London,  UK,  December  7,  2017

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

more  desired

Trustworthy

Secure

Trusted(?)

Trust?

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Trust  consider  harmful!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Security  through  Distrusting  examples

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #1:  Pesky  microphones

phone
mic 3

mic

mic

1

2

§ Mics sniff  our  activities,  including  keystrokes,  etc. § Mics are  difficult  to  neutralize § Mics naturally  "cross"  security  boundaries

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

§ Mics sniff  our  activities,  including  keystrokes,  etc. § Mics are  difficult  to  neutralize § Mics naturally  "cross"  security  boundaries

phone

Bluetooth  link

Bluetooth

headset

mic

mic

1

2

No  mics!

Different  vendors

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #2:  Stateless laptop

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Persistent  laptop  compromises...
§ Persist § Store  secrets § PII

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

§ Persist § Store  secrets § PII

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

§ Persist § Store  secrets § PII

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Stateless  Hardware (persistent  state  eliminated)

§ Firmware  infections  prevented § No  places  to  store  stolen  secrets § Reliable way  to  verify  firmware § Reliable  way  to  choose  firmware § Boot  multiple  environments § Share  laptops  with  others

Trusted  Stick

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #3:  Multi--party  signatures
Photo  via  Peter  Todd  (@petertoddbtc)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Wallet

Wallet vs

Mutli--sig  does  not  need  to  involve  multiple  users!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Also:  not  just  Bitcoin wallets...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #4:  Binary  (multi)  signing

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Why  care  about  binary  (multi--)  signing?
§ OS  installation  images § Applications § Updates § Firmware

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Prime  target  for  backdooring!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Source code

Building

Binary
(e.g.  updates)

Distribution

Binary

Create Sign

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Source code

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

Binary

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Attacker  (back--/bug--door  injection)

?

?

Source code

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

Binary

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

?

Source code

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

?

Binary

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

?
Source code

Attacker  (back--/bug--door  injection)

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

?

?

Binary

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

?
Source code

Attacker  (back--/bug--door  injection)

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

?

?

Binary

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

?

Source code

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

Binary
?

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Source code

Building
(git push)

?

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

Source code
== ?
Binary
?

Create (...  &  sign!)
Sign Verify

developer(s)

vendor

end  user

Create (...  &  sign!)
Sign Sign Verify

?

Source code

Building
(git push)

?

Sign

Binary
(e.g.  updates)

Vendor  #3

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

? Binary Sign
(e.g.  updates)

developer(s)

Vendor  #1

Vendor  #2

Binary
end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

?

Source code

Building
(git push)

?

Sign

Binary
(e.g.  updates)

Vendor  #3 One  binary,  multiple  signatures!

Binary
(e.g.  updates)

Distribution
(https,  signed  binaries)

Binary

? Binary Sign
(e.g.  updates)

Create (...  &  sign!)
Sign Sign Verify

developer(s)

Vendor  #1

Vendor  #2

end  user

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Multi--signed  binaries
§ Signed  by  people  from  different  countries § Different  organizations  (vendor  &  auditing) § Signed  by  different  machines
­ In  the  same  organization ­ In  different  organization

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

https://reproducible--builds.org

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  5:  Preventing  data  leaks

Some  software
(buggy/backdoored or   otherwise  compromised)

Your  data...!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Some  software
(buggy/backdoored or   otherwise  compromised)

Your  data...!

VPN

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Some  software
(buggy/backdoored or   otherwise  compromised)

Your  data...!

VPN

Windows  laptop  (compromised  or  backdoored)

Some  software
(buggy/backdoored or   otherwise  compromised)

Your  data...!

VPN

Different  device  (or  VM?)

Windows  laptop  (compromised  or  backdoored)

§ Qubes  TorVM (2011) § The  Grugq `s  P.O.R.T.A.L.  (2012) § Whonix (2012 ­ present) § Whonix for  Qubes  (2014  ­ present) § Tor--enabled  routers  (multiple  
projects/products)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Cut  off  networking?

Some  software

Not  very  useful...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Template  VM

Qubes  OS  templates
Download  updates,  etc

Updates server

User  data
App  VM

No  networking (no  leaks)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #6:  Compartmentalization

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

"Classic"  compartmentalization...

Work  VM

Personal  VM

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

"Classic"  compartmentalization...

Work  VM

Personal  VM

...not  very  useful!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

PDF

JPG MOV

Work  VM

Personal  VM

...more  useful...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Inter--compartments  data  transfers

?
PNG Work  VM

PNG
Internet   Browsing  VM

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Qubes PDF/Image  converters:
Very  simple  (&  trusted)  code! Very  simple  format  (&  easy  to  verify  if  indeed)

PNG Work  VM

PNG Disposable  VM

PNG
Internet   Browsing  VM

Very  complex  format  (risky  to  parse!) Very  complex  parsing  (very  risky!)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

App  sandboxing  is  just  part  of  the  story...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

PDF

JPG MOV

Work  VM

Personal  VM

Networking   stacks

USB  &   Bluetooth  
stacks

Graphics  &   UI

VPNs  &   firewalling

Corporate   management

Root  of  trust (admin)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Isolation is  just  part  of  the  story!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Biggest  challenge  for  Qubes  OS is how  to  do  desktop  integration (seamless  UX)  
without  compromising  isolation!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #7:  Almighty  admins?

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Admins can  steal  all  our  data  :(

Admin

§ Access  to  their  data § Can't  modify  policies § Can't  modify  software/VM  images
User

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Admin
Can  access  and  do everything she  wants!

§ Access  to  their  data § Can't  modify  policies § Can't  modify  software/VM  images
User

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Hmm...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

What  we  want  instead:
§ Access  to  their  data § Can't  modify  policies § Can't  modify  software/VM  images

Admin
§ No  access    to  user  data § Can  modify  policies § Can    install  software/VM  images

User

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

What  we  want  instead:
personal

work--related

§ Access  to  their  data § Can't  modify  policies § Can't  modify  software/VM  images

Admin

User

§ No  access    to  user  data § Can  modify  policies § Can    install  software/VM  images

Check  our  Qubes  OS new  Admin  API  for  implementation  details

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Occasionally  mishaps  happen  still...

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Example  #8:  Plan  B

Compromised   machine

Backup  
(files,  disks)

Clean  machine

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Compromised   machine

Backup  
(files,  disks)

Clean  machine

Restoring  compromised  backup  is  risky!

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Qubes  (Paranoid)  Backup  Restore

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Security  through  Distrusting

Division  of  Duty

Compartmentalization

§ Mics (#1)

§ Qubes  (#6/7)

§ Stateless  laptop  (#2) § Tunneling  (#5)

§ Multi  signatures  (#3/4) § Qubes  Backup  Restore  (#8)

§ Tunneling  (#5)

Plan  B  having
§ Qubes  Backup Restore  (#8)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Tradeoffs?

§ Compartmentalization § Multisigs for  binaries § Stateless  laptop  (BOM  costs)

§ Mics § Multisigs for  wallets § Compartmentalization (?)

Developer  
resources  
(well  thought   architecture  &   APIs,  difficulty  
adding  new   features)

Usability!

Hardware   resources  &  
cost
(CPU,  memory,  disk)

§ Compartmentalization § Stateless  laptop  (BOM  costs)

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

427F11FD 0FAA4B08 0123F01C DDFA1A3E 36879494

Thanks!
*** https://qubes--os.org https://invisiblethingslab.com https://blog.invisiblethings.org https://github.com/rootkovska   @QubesOS  //  Twitter  for  Qubes  OS @rootkovska  //  Personal  Twitter 427F11FD0FAA4B080123F01CDDFA1A3E36879494    //  Qubes  Master  Key ED727C306E766BC85E621AA65FA6C3E4D9AFBB99  //  Personal  Master  Key
This  presentation  made  in  MS  Office  on  Qubes  OS  3.2

