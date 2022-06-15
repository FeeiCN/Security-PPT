timestomping

Time
^

For our guests from England, please allow me to translate.

timestomping

^

Quick background

Timestamps are important in forensic analysis.
Timeline analysis is part of event reconstruction.
Note: Timestamps and events are analyzed in context, not isolation.

File File 127 File 128 File 129 File 130 File 131 File 132 File 133 File 134 File 135 File 136 File 137 File 138 File 139 File 140 File 141 File 142 File 143 File 144

Creation Date

Last Accessed

08/04/11 10:22:36 08/04/11 10:22:3

08/04/11 10:22:37 08/04/11 10:22:3

08/04/11 10:22:37 08/04/11 10:22:3

08/04/11 10:22:37 08/04/11 10:22:3

08/04/11 10:22:38 08/04/11 10:44:1

08/04/11 10:22:41 08/04/11 10:22:4

08/04/11 10:22:42 08/04/11 10:22:4

08/04/11 10:22:43 08/04/11 10:22:4

08/04/11 10:22:43 08/04/11 10:54:0

08/04/11 10:22:43 08/04/11 10:22:4

08/04/11 10:22:45 08/04/11 10:22:4

08/04/11 10:22:46 09/06/06 08:00:0

08/04/11 10:22:47 08/04/11 10:22:4

08/04/11 10:22:47 08/04/11 10:22:4

08/04/11 10:22:47 08/04/11 10:39:5

08/04/11 10:22:48 08/04/11 10:22:4

08/04/11 10:22:54 08/04/11 10:22:5

08/04/11 10:22:58 08/04/11 10:22:5

To hide activities, the computer's clock could be changed.

That poses a separate set of problems and leaves its own trail of evidence.

Anti-forensic demonstration of timestomp.exe at BlackHat 2005

AttributeMagic has since joined the scene.

The tools modify timestamps (Created, Accessed, Modified, MFT Entry)
to fool an unsuspecting user.

But here's the rub:

The tools don't modify all timestamps and they don't look for all artifacts.

There are eight timestamps, not four, associated with a file on NTFS file systems.

All eight timestamps are in $MFT.

$STANDARD_INFORMATION Type: 0x10 Min Size: 0x30 Max Size: 0x48

$FILE_NAME Type: 0x30 Min Size: 0x44 Max Size: 0x242

Read offset to attribute content
and add: · Created (0x00) · Last Modified (0x08) · MFT Entry Modified (0x10) · Last Accessed (0x18)

Read offset to attribute content
and add: · Created (0x08) · Last Modified (0x10) · MFT Entry Modified (0x18) · Last Accessed (0x20)

All eight timestamps are in $MFT.

$STANDARD_INFORMATION Type: 0x10 Min Size: 0x30 Max Size: 0x48

$FILE_NAME Type: 0x30 Min Size: 0x44 Max Size: 0x242

Read offset to attribute content
and add: · Created (0x00) · Last Modified (0x08) · MFT Entry Modified (0x10) · Last Accessed (0x18)

Read offset to attribute content
and add: · Created (0x08) · Last Modified (0x10) · MFT Entry Modified (0x18) · Last Accessed (0x20)

These are modified by the timestomp and AttributeMagic. These are read by tools such as EnCase and FTK.

All eight timestamps are in $MFT.

$STANDARD_INFORMATION Type: 0x10 Min Size: 0x30 Max Size: 0x48

$FILE_NAME Type: 0x30 Min Size: 0x44 Max Size: 0x242

Read offset to attribute content
and add: · Created (0x00) · Last Modified (0x08) · MFT Entry Modified (0x10) · Last Accessed (0x18)

Read offset to attribute content
and add: · Created (0x08) · Last Modified (0x10) · MFT Entry Modified (0x18) · Last Accessed (0x20)

These can be analyzed, but it takes more work.
Many analysts would need a reason to start doing this extra work.

All eight timestamps are in $MFT.

$STANDARD_INFORMATION Type: 0x10 Min Size: 0x30 Max Size: 0x48

$FILE_NAME Type: 0x30 Min Size: 0x44 Max Size: 0x242

Read offset to attribute content
and add: · Created (0x00) · Last Modified (0x08) · MFT Entry Modified (0x10) · Last Accessed (0x18)

Read offset to attribute content
and add: · Created (0x08) · Last Modified (0x10) · MFT Entry Modified (0x18) · Last Accessed (0x20)

The values in each attribute can be compared, but it takes work.

4 timestamps 4 timestamps

So what would give an examiner a reason to start digging?

Obvious timestomping

Obvious timestomping. All entries are blank.

Example Inconsistent timestamps with respect to MFT.

Example Timestamps matching the OS release date.

Remember: forensic timelines are built on context.

Running executables can leave a trail in the Windows Prefetch and the Registry (MRU)

The problem with the Windows Prefetch...

A Windows Prefetch file (.pf) has eight time stamps ($STANDARD_INFORMATION, $FILE_NAME).
There is also an embedded timestamp of the last time the executable was run.

08/19/09 01:22:19PM

If the running of an executable needs to be done stealthily, the timestamps in the Prefetch file need to be modified, or
the Prefetch file needs to be deleted entirely.

The MRU values in the Registry

Modified Registry entries Stored in ROT-13

Data files can be a problem as well.

What happens when a file is created or opened?

Creating or opening a file
File has 8 timestamps

Created files will have a shortcut .lnk in the Windows Recent directory.
(8 timestamps)
If it's an Office file, there will be a .lnk shortcut in the Office's Recent directory.
(8 timestamps)
Many applications keep a list of recent files on a menu. Data can be stored in the Windows Registry (NTUSER.DAT). (Sometimes the keys have dates.)
The file's name could appear in the .pf Windows Prefetch file, which monitors
the system for up to 10 seconds. (9 timestamps)

Example Opening an accounting spreadsheet.

Adobe Acrobat's list of recently opened PDFs.
NTUSER.DAT\Software\Adobe\Acrobat Reader\7.0\AVGeneral\cRecentFiles\

Granularity

NTFS stores time in 64 bit values, which gives an accuracy down to 100 nanoseconds since January 1, 1601.
Timestomp.exe and Magic Attribute only go down to the nearest second.

If the values in the attributes are examined, timestomping will be obvious...

...unless an existing timestamp value is copied into the attribute. (Don't stomp it outright, copy it from another source.)

Example Rounded timestamp values

Bottom Line:

It's damn near impossible to change all of the timestamps associated with running an executable.
Change (or delete) enough data to avoid detection.

Want a copy? gimmethepresentation@gmail.com

timestomping

Time
^

