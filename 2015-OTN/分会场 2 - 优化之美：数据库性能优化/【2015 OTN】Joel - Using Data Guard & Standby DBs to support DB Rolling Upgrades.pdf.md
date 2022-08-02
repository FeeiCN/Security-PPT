Quick Start Guide

Using Data Guard & Standby DBs to support DB Rolling Upgrades

Joel Pérez ­ Senior DBA Oracle Oracle ACE Director

Beijing, China November 2015

About me Quick Start Guide

Joel Pérez

Ø Oracle Technology Network Expert "OTN" Expert 2003 Ø First Latin American to be published as Expert on Oracle Web Site 2003 & One of the first OTN Experts Worldwide Ø Oracle ACE 2004 & Oracle ACE Director 2012 Ø Consulting Tasks, Conferences and activities related to, in over 50 countries around the world Ø More than 30 Oracle certifies Ø One of the first the OCM Cloud
Administrator In the world Ø Leader Articles Writer for OTN Spanish & OTN Portuguese with more than
100 Published Articles
Ø Reviewer of Oracle Books ØOracle Speaker at many International Oracle Events Ø more and counting Ø OCM Profile: http://education.oracle.com/education/otn/JoelPerez.htm

Quick Start Guide

Joel Pérez

What is Oracle Data Guard ?

Quick Start Guide

Joel Pérez

What are Standby Databases ?

Quick Start Guide

Joel Pérez

What means "Rolling" & "Rolling Upgrade"

Quick Start Guide
Agenda

Joel Pérez

·Upgrading from 9.2.0.6 to 11g without patching the production Database Server

· Upgrading from 11gR2 to 12c Rolling Upgrade Concept

Quick Start Guide

Joel Pérez

Let's start..

Quick Start Guide

Joel Pérez

Upgrading from 9.2.0.6 to 11g without patching

the production Database Server

Objective: Upgrading from 9.2.0.6 to 11g without patching the production Database Server
Requirements · The database to be upgraded must be patched at 9.2.0.8 level · The customer do not want to patch the production server ( 9.2.0.6 ) · The database is not large. Capacity: 60GB · The destination server will be a different server regarding production server ( Both in the same Operating System Version ) · Posibility to create Virtual Machines in the customer's infrastructure · Required Downtime < 4hours

Quick Start Guide

Joel Pérez

Quick Start Guide

Joel Pérez

How we will upgrade to 11gR2 without patching the production database server to 9.2.0.8 ??

QuickSScetnaarrito Guide

Joel Pérez

Operation: Production database working in 9.2.0.6

9.2.0.6 ( "Env1")

( "Env2")

11gR2 ( "Env3")

PROD

QuickSScetnaarrito Guide

Joel Pérez

In "Env1" Run the script "utlu112i.sql" inside the production DB. That script is the "Pre-check script" to upgrade a DB from 9i to 11gR2. That script is found in "Env3" at the path "ORACLE_HOME/rdbms/admin/utlu112i.sql". Transfer this script from "Env3" to "Env1" and run it inside the DB connected as sys user. If you do not run this script previous to the upgrade you will
not able to recreate the catalog when you will work with your db in 11g

9.2.0.6 ( "Env1")

( "Env2")

11gR2( "Env3")
Run utlu112i.sql

PROD

QuickSScetnaarrito Guide

Joel Pérez

Perform Full Database Backup Online done with RMAN "Oracle Recovery Manager" in "Env1"RMAN> BACKUP DATABASE ...;

9.2.0.6 ( "Env1") Backup

( "Env2")

( "Env3")

PROD

QuickSScetnaarrito Guide

Joel Pérez

Perform "Archive Redo Log (ARL)" Backup needed to complement step (1) for futureRestore/Recover. Make sure you have the backup of "ARL" at least from one "ARL" before beginning theFull Database Backup. Steps "1" and "2" can be done together in one sentence if It is
your preference RMAN> backup archivelog ...;RMAN> BACKUP DATABASE PLUS ARCHIVELOG;

9.2.0.6 ( "Env1")

( "Env2")

( "Env3")

PROD

Backup ARL or BCK DB + ARL

QuickSScetnaarrito Guide

Joel Pérez

Perform Backup of "Controlfile" to establish a manual DB restore. As if you were a restore/recoveryour database at another machine. We will need to generate 2 copies of controlfiles. One for the "Env2"which will be a copy for conforming an standby db and one for "Env3" which will be a manual standbyFor "Env3"SQL> ALTER DATABASE BACKUP CONTROLFILE TO '<path of your preference> /control.bkp'; For "Env2"SQL> ALTER DATABASE CREATE STANDBY CONTROLFILE AS
'<path>/stbycf.ctl';

9.2.0.6 ( "Env1")

9.2.0.8( "Env2")

11gR2( "Env3")

Backup Controlfile: Regular & for Stby
DB

Future Standby DB

PROD

Backup ARL or BCK DB + ARL

Future Manual Restore/Recover
DB

QuickSScetnaarrito Guide

Joel Pérez

Transport/copy with operating system commands the resources gotten from Steps from "1" to "3"

9.2.0.6 ( "Env1")
Backup Controlfile: Regular & for Stby
DB

9.2.0.8 ( "Env2")
Copy with OS commands

11gR2 ( "Env3")

PROD

Backup ARL or BCK DB + ARL

QuickSScetnaarrito Guide

Joel Pérez

With those resources establish a typical Standby Configuration in "Env2". In spite of you are in "Env1"(9.2.0.6) and "Env2"(9.2.0.8) you will be able to establish that environment perfectly without any problem. Make sure that Standby replication is working good. Make sure you can "Switchover"
between "Env1" and "Env2"

9.2.0.6 ( "Env1")

9.2.0.8 ( "Env2")

( "Env3")

Instance's Name: PROD Instance's Name: PRODST

PROD

PROD

a50

a51

...

a50

a51

...

Standby Syncronization

QuickSScetnaarrito Guide

Joel Pérez

Establish a regular restore /recover of your database in "Env3". This environment will be simple enviroment where PROD DB in "Env3" will be a constant recover database product of production database activity. The ( Archived Redo Logs ) ARL will be taken from "Env2"

9.2.0.6 ( "Env1")

9.2.0.8 ( "Env2")

11gR2( "Env3")

Instance Name: PROD PROD

a50

a51

...

Manually Transfer

NFS/OS Commands

Instance's Name: PRODST

PROD

a50

a51

...

Standby Syncronization

a50

a51

...

PROD
Instance Name: PROD

QuickSScetnaarrito Guide

Joel Pérez

Make a Switchover and Patch: The "Env3" will be continuously recovering the "ARL" generated in "Env2". The valuable technique in all of this.. It is that "Env3" originally will recover "ARL" stored in "Env2"(9.2.0.8) but the database inside follow being (9.2.0.6) & ARL as well. Once you make the "Switchover" to "Env2", that database become the production database working inside in (9.2.0.6) but being handled by an Oracle Database (9.2.0.8). There is one moment where the patch (9.2.0.8) has to be applied inside the database, the remarkable technique here consists in what we will have

continuity of "ARL" generation to be applied in "Env3" in spite of we are crossing a patch task

9.2.0.6 ( "Env1")

9.2.0.8 ( "Env2")

11gR2( "Env3")

Instance Name: PROD PROD

a50

a51

...

Instance's Name: PRODST

PROD

a50

a51

...

PROD
Instance Name: PROD

QuickSScetnaarrito Guide

Joel Pérez

Make a Switchover and Patch: Steps to perform from applying switchover till get the time to Upgrade

the PROD DB located in "Env2"

9.2.0.8 ( "Env2")

11gR2( "Env3")

PROD
Instance Name: PROD

QuickSScetnaarrito Guide
Final steps to complete the Upgrade

Joel Pérez

·Complete recover of all ARL · Open the database in "Upgrade Mode" + "Resetlogs". SQL> ALTER DATABASE OPEN RESETLOGS
UPGRADE;
· Run the typical steps to upgrade your database depending on from what source version you come and related to what version you will be upgraded.

11gR2( "Env3")
PROD Instance Name: PROD

Quick Start Guide

Joel Pérez

We can do the same with other versions?

QuickSScetnaarrito Guide
Rolling Upgrade between 11gR2 & 12c

Joel Pérez

11gR2

12cR1

a50

a51

...

Instance's Name: PROD

PROD

a50

a51

...

PROD
Instance Name: PROD

Quick Start Guide

Joel Pérez

Joel Pérez
Quick Start Guide
Q&A

Quick Start Guide
Direct Contact:

Joel Pérez

Ø ACE Director Profile: https://apex.oracle.com/pls/otn/f?p=19297:4:1711390 987197101::NO:4:P4_ID:157 Ø OCM Profile: http://education.oracle.com/education/otn/JoelPerez. htm Ø Linked in: https://apex.oracle.com/pls/otn/f?p=19297:4:1711390 987197101::NO:4:P4_ID:157

 





Oracle

z3 ­ SQL

zData ­ 

BayMax

 

Quick Start Guide

Joel Pérez

!!

