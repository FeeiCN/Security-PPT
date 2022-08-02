Malware Reweaponization
case study
Krlis Podis, CERT.LV

Executive Summary
Ciaran Dunsdon, Flickr

CERT.LV
https://commons.wikimedia.org/w/index.php?curid=5191835

Context
 Vincent R. Stewart, DIA Chief, 2017 ­ "Once we've isolated malware, I want to reengineer it and prep to use it against the same adversary who sought to use against us"
 Wikileaks ­ "The UMBRAGE team maintains a library of application development techniques borrowed from in-the-wild malware"

Man vs Machine
rarehistoricalphotos.com

Malware Architecture
Office document ­ zip archive

Outer EPS image

Inner EPS ­ encrypted with static xor key

Outer shellcode

Inner shellcode ­ encrypted with PRNG

Dropper executable
Payload buffer encrypted+zip
Payload exe
C&C - encrypted

32bit CVE-2017-0263 exe
64bit CVE-2017-0263 exe

CVS 2017-
0262 EPS exploit

By BrokenSphere - Own work, CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=3773186

Your name here
By BrokenSphere - Own work, CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=3773186

Challenges
Office document ­ zip archive

Outer EPS image

Inner EPS ­ encrypted with static xor key

Outer shellcode

Inner shellcode ­ encrypted with PRNG

Dropper executable
Payload buffer encrypted+zip
Payload exe
C&C - encrypted

32bit CVE-2017-0263 exe
64bit CVE-2017-0263 exe

CVS 2017-
0262 EPS exploit

Reobfuscation
 Perfect symetry
 Known algorithms  Reimplementation  One-time pad generation
­ Keystream not affected by input

Lee Barrows, Flickr

Monique Sherrett (Trottier), Flickr

PoC
 > python reweaponize.py new.c2

Reweaponization Choices
Office document ­ zip archive

Outer EPS image

Inner EPS ­ encrypted with static xor key

Outer shellcode

Inner shellcode ­ encrypted with PRNG

Dropper executable
Payload buffer encrypted+zip
Payload exe
C&C - encrypted

32bit CVE-2017-0263 exe
64bit CVE-2017-0263 exe

CVS 20170262 EPS exploit

Attribution

By Chris JL, Flickr

Threshold
stipriem.lv

Sky is Not Falling

Paldies!

