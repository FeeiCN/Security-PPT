Watching the Watchdog Protecting Kerberos
Tal Be'ery, Sr. Security Research Mgr. Michael Cherny, Sr. Security Researcher

 
    


  

   




 

 Therefore, attackers must abuse the Kerberos protocol!

 

User

waza 1234/



KDC
LSASS (kerberos)

des_cbc_md5 rc4_hmac_nt
(NTLM/md4)
aes128_hmac
aes256_hmac

f8fd987fa7153185
cc36cf7a8514893e fccd332446158b1a
8451bb37aa6d7ce3 d2a5c2d24d317af3
1a7ddce7264573ae1 f498ff41614cc7800 1cbf6e3142857cce2
566ce74a7f25b

KDC
TGT  TGS-REQ (Server)
TGS  TGS-REP
 Usage
Server

   

Passively Listening to Kerberos Traffic
Kerberos Traffic SD
Main frame

Printer Smart Phone
PC

Kerberos Traffic Kerberos Traffic Kerberos Traffic

Kerberos Traffic

Active Directory (Kerberos Server)



 

 

admin123

wrongpassword

P@$$w0rd1


https://twitter.com/gentilkiwi/status/556246876505509888



User

waza 1234/

KDC
LSASS (kerberos)

des_cbc_md5 rc4_hmac_nt
(NTLM/md4)
aes128_hmac
aes256_hmac

f8fd987fa7153185
cc36cf7a8514893e fccd332446158b1a
8451bb37aa6d7ce3 d2a5c2d24d317af3
1a7ddce7264573ae1 f498ff41614cc7800 1cbf6e3142857cce2
566ce74a7f25b

KDC
TGT  TGS-REQ (Server)
TGS  TGS-REP
 Usage
Server



 
 RC4-HMAC don't have any!

 
 RC4-HMAC don't have any!

https://commons.wikimedia.org/wiki/File:Jodsalz_mit_Fluor_und_Folsaeure.jpg

User1

waza 1234/
LSASS (kerberos)

des_cbc_md5 rc4_hmac_nt
(NTLM/md4)
aes128_hmac
aes256_hmac

f8fd987fa7153185
cc36cf7a8514893e fccd332446158b1a
8451bb37aa6d7ce3 d2a5c2d24d317af3
1a7ddce7264573ae1 f498ff41614cc7800 1cbf6e3142857cce2
566ce74a7f25b

TGT

KDC

user rc4_hmac aes256_

_nt

hmac

Joe 21321... 543..

user1 cc36cf7a 1a7ddc

...

...

Doe


 

 



 



Skeleton
User1
LSASS (kerberos)

des_cbc_md5

rc4_hmac_nt
(NTLM/md4)

ff687678....

aes128_hmac
TGT aes256_hmac

KDC

user rc4_hmac aes256_

_nt

hmac

Joe 21321... 543..

user1 cc36cf7a 1a7ddc

...

...

ff687678...


 
 



   

 https://gallery.technet.microsoft.com/Aorato-Skeleton-Key-24e46b73

 

User

waza 1234/



KDC
LSASS (kerberos)

des_cbc_md5 rc4_hmac_nt
(NTLM/md4)
aes128_hmac
aes256_hmac

f8fd987fa7153185
cc36cf7a8514893e fccd332446158b1a
8451bb37aa6d7ce3 d2a5c2d24d317af3
1a7ddce7264573ae1 f498ff41614cc7800 1cbf6e3142857cce2
566ce74a7f25b

KDC
TGT  TGS-REQ (Server)
TGS  TGS-REP
 Usage
Server



PAC (in TGT)

Username : Administrator



Domain SID S-1-5-21-4014832156-2573456389-2040062157

User ID

500 Administrator

Groups ID

512 Domain Admins

519 Enterprise Admins

518 Schema Admins

...

CHECKSUM_SRV ­ HMAC_SHA1 - krbtgt 3f..

CHECKSUM_KDC ­ HMAC_MD5 - krbtgt B6..

https://commons.wikimedia.org/wiki/File:Identification_card_JAPAN.jpg



User

waza 1234/



LSASS (kerberos)

KDC
PAC

des_cbc_md5 rc4_hmac_nt
(NTLM/md4)
aes128_hmac
aes256_hmac

f8fd987fa7153185
cc36cf7a8514893e fccd332446158b1a
8451bb37aa6d7ce3 d2a5c2d24d317af3
1a7ddce7264573ae1 f498ff41614cc7800 1cbf6e3142857cce2
566ce74a7f25b

KDC
PAC
TGT  TGS-REQ (Server)

PAC
TGS

 TGS-REP

 Usage
Server


 

 


PAC (in TGT)
Username : Administrator Domain SID S-1-5-21-4014832156-2573456389-2040062157 User ID 500 Administrator Groups ID 512 Domain Admins 519 Enterprise Admins 518 Schema Admins ...
CHECKSUM_SRV ­ HMAC_SHA1 - krbtgt 3f..
CHECKSUM_KDC ­ HMAC_MD5 - krbtgt B6..

 

 

Attacker

Krbtgt key,
Ticket details

Exploit (Mimikatz)
TGT

LSASS (Kerberos)
KDC
AD
TGT  TGS-REQ (Server)
TGS  TGS-REP
 Usage
Server

 



PAC (in TGT)

Username : Administrator



Domain SID S-1-5-21-4014832156-2573456389-2040062157

User ID

500 Administrator



Groups ID 512 Domain Admins

519 Enterprise Admins

518 Schema Admins

...

CHECKSUM_SRV ­ HMAC_SHA1 - krbtgt 3f..

CHECKSUM_KDC ­ HMAC_MD5 - krbtgt B6..

https://commons.wikimedia.org/wiki/File:Identification_card_JAPAN.jpg


Image by ACDX https://commons.wikimedia.org/wiki/File%3ADigital_Signature_diagram.svg


   

PAC (in TGT)
Username : Administrator Domain SID S-1-5-21-4014832156-2573456389-2040062157 User ID 500 Administrator Groups ID 512 Domain Admins 519 Enterprise Admins 518 Schema Admins ...
CHECKSUM_SRV ­ HMAC_SHA1 - krbtgt 3f..
CHECKSUM_KDC ­ HMAC_MD5 - krbtgt B6..

PAC (in Service Ticket)
Username : Administrator Domain SID S-1-5-21-4014832156-2573456389-2040062157 User ID 500 Administrator Groups ID 512 Domain Admins 519 Enterprise Admins 518 Schema Admins ...
CHECKSUM_SRV ­ HMAC_SHA1 ­ CIFS/Server 2a..
CHECKSUM_KDC ­ HMAC_MD5 - krbtgt 56..

 
http://en.wikipedia.org/wiki/Digital_signature

  




   

waza

1234/

Exploit

User

PAC

KDC

PAC
KDC
TGT  TGS-REQ (server)

PAC
TGS

 TGS-REP

 Usage
Server


 

waza

1234/

Exploit

User

PAC

KDC

PAC
KDC
TGT  TGS-REQ (KRBTGT)

PAC
`TGT'

 TGS-REP

KDC

nTGS-REQ (Server)

PAC
TGS

oTGS-REP

Server

pUsage





PAC (in "TGT")
Username : Administrator Domain SID S-1-5-21-4014832156-2573456389-2040062157 User ID 500 Administrator Groups ID 512 Domain Admins 519 Enterprise Admins 518 Schema Admins ... CHECKSUM_SRV ­ MD5 ­ no key 3f..
CHECKSUM_KDC ­ MD5 ­ no key B6..

PAC (in Service Ticket)
Username : Administrator Domain SID S-1-5-21-4014832156-2573456389-2040062157 User ID 500 Administrator Groups ID 512 Domain Admins 519 Enterprise Admins 518 Schema Admins ...
CHECKSUM_SRV ­ HMAC_SHA1 ­CIFS/Server 2a..
CHECKSUM_KDC ­ HMAC_MD5 - krbtgt 56..


  



   
Diamond Photograph courtesy of the U.S. Geological Survey

waza

1234/

Exploit

User

PAC

KDC

PAC
KDC
TGT  TGS-REQ (server)

PAC
TGS

 TGS-REP

 Usage
Server


 


 

   




 https://gallery.technet.microsoft.com/Aorato-Skeleton-Key-24e46b73

 https://www.microsoft.com/en-us/evalcenter/evaluate-microsoft-advancedthreat-analytics





subverting



stealing

