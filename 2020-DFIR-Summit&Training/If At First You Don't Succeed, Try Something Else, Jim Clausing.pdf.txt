If at first, you don't succeed, try something else
Jim Clausing, PMTS and SANS Instructor jac@att.com jclausing@isc.sans.edu
© 2020 AT&T Intellectual Property. AT&T, Globe logo, and DIRECTV are registered trademarks and service marks of AT&T Intellectual Property and/or AT&T affiliated companies. All other marks are the property of their respective owners A

Agenda

1: Intro 2: The Analysis 3: Questions

2

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Forensicator, Malware analyst, SANS instructor, Cyclist, Private pilot

3

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

The start of the hunt
· Around Labor Day, nothing going on, needed to practice · Was made aware of a couple of samples with new (to me)
packer · Several of us decided to look at it independently (nothing
like a little competition within the team)

4

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Preliminary exam

5

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Preliminary exam, cont'd

6

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Static Code Analysis
· ListDemo.exe ­ code example
· Extraneous functions
· Garbage code in actual unpacking routines · Obviously obfuscated to make analysis difficult · Moving on...

7

Presentation title / Month XX, 2020 / © 2020 AT&T Intellectual Property - AT&T Proprietary (Internal Use Only)

Unpack with the

debugger

· Single-step

· Breakpoints on LoadLibraryA and GetProcAddress

· Try to find the jump to OEP

8

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Try to dump it
Fail!!!

9

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Regroup

10

Presentation title / Month XX, 2020 / © 2020 AT&T Intellectual Property - AT&T Proprietary (Internal Use Only)

Hmm...

11

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Those base64 strings look interesting

12

Presentation title / Month XX, 2020 / © 2020 AT&T Intellectual Property - AT&T Proprietary (Internal Use Only)

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Lots of repetition, could there be a key in there

15

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

18

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Do a little editing of the un-XOR-ed hex

19

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

20

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Interesting Strings/IOCs

21

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Looks like a key logger
If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Automate it

23

Presentation title / Month XX, 2020 / © 2020 AT&T Intellectual Property

Conclusions

24

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

Questions?

25

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

References:
· https://github.com/att/docker-forensics/blob/master/unpack_listdemo.py

26

Presentation title / Month XX, 2020 / © 2020 AT&T Intellectual Property - AT&T Proprietary (Internal Use Only)

Contact me:
jac@att.com jclausing@isc.sans.edu @jclausing on twitter
Thanks for attending

27

If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

28 If at first, you don't succeed, try something else / July 17, 2020 / © 2020 AT&T Intellectual Property

