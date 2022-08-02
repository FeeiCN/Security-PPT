Linux

Duanjigang <duanjigang1983@gmail.com>


: 1 RPM  YUM  15 2  25 3  10
 1)  linux  2)  3) 

1 RPMYUM-

Coding is interesting
spring

Coding is all my life
summer

Boring , but I like it
autumn
I am happy, I am a coding monkey ...

Tired, striving
winter

One day..

1 YUMRPM-

  
  

   

Coding is not all of the software engineeringThere are more work after the development......

1 RPMYUM-
 : (1): (2): zip , tgz , rar (3):,RPM, DEB, SLP, PKG
RPM...

1 RPMYUM-

:
    
What is an RPM ? How is an RPM file produced?

RPM
 

1 RPMYUM-RPM

 The lead 1: rpm 2: RPM 3: name-lead Name: A:RPMRPM B:RPM

 The Header Structure 1: The Header Structure Header 
 2: The Index Entry index
,index 3: store header

The signature-RPM The Header- The Archive-gun zip 

1 RPMYUM- RPM 
RPM:
(1):() (2):-spec (3):-rpmbuild

1 RPMYUM-YUM
 YUM:
 ()    
 YUM:
 1 (RPMRPM)  2 (HTTP,FTP)  3 yum(server)  4 (YUM
)

RPM Yum

1 RPMYUM-YUM
createrepo
  (http/ftp)

2  RPM  

1

3



4











cache

Yum list/install/search/info

1:/etc/yum.repos.d/*.repo

2:/var/lib/rpm/__db.*

6

3:/etc/yum.conf

5

 4:/var/cache/yum/*

YU

 5:/usr/bin/yum

M

6:/usr/lib/yum-plugins/*.py



/etc/yum/pluginconf.d/*.conf



1 RPMYUM-YUM
Yumserver192.168.1.100192.168.1.101yumserver httpweb/var/www/html32linux
: RPMtestrpm-1.1.2-20.i386.rpm testrpm-1.1.2-20.i386.rpm192.168.1.100/var/www/html/yum 192.168.1.100/var/www/html/yum:sudo createrepo --update -d -p .repodata 192.168.1.101/etc/yum.repos.d/yumtest.repo:
[yum] name=yum baseurl=http://192.168.1.100/yum enabled=1 gpgcheck=0  sudo yum clean all, yum list, yum install cmeguard

1 RPMYUM-
 -10  -10  RPM -10  OS (RHEL)-5U56U34u,3u..
·1  ·2 serverTCP ·3  ·4 RPM ·5  ·6 RHEL ·7 () ·8 

1 RPMYUM-

+



1  2  3  4  8 


5  6 RHEL 7 


2 
 -YUM -RPM -

2-
:


2-MIRROR
mirror,

2-
:server
: 1 LVSVIP 2 DNS
: 1 mirror 2 LVS/DNS

2-
yumyum() : DNS:  DNSPod  Bind + 
Yum.idc1

2-SQUID/TSRSYNC
Rsync+ http:  Mirror Squid:  

2-SQUID
squidhttpmirror :

2-
: 1)  rpm (rpbmuild) 2)  rpm (i386/noarch/x86_64, rhel4/5/6) 3) Rpm 

2-

2-RSYNC+HTTPSQUID

 Rsync+http
squid

  
 





    

 http 

 

3 -

yum()

RPM

createrepo

Yum

(http/ftp)

 

2  RPM  

1

3



4











cache

6

5



YU



M



3 -
 (rhel) (app) (app_base)
  (/-)  Yum  (yum)

3 -
Yum plugin : / :
Yum plugin : 1 Priority :app 2branch :test/current/stable
: http://yum.baseurl.org/wiki/WritingYumPlugins

3 -/
1  ///yum :corp-app1-mysql,coprp-app2-named
2  OS/ : /app_base/xxoo :/app/xxoo

3 -//
/etc/yum.conf -cachedir,log,obsolete /etc/yum.repos.d/*.repo-GPG /etc/yum/plugin.d/*.conf -

3 -
Yum:ping,telnet :wget,zcat,sqlite :wget,lynx --dump Yum/rpm:rpmdb, killall yum rpm rpmq, rm ­fr /va/lib/rpm/__db* :yum clean all; rm ­fr /var/cache/yum/* /: yum install ­disablerepo=* --enablerepo=test : yum install ­noplugins Yum:pythonyum


 Maximum RPM  http://www.rpm.org/max-rpm/index.html  Packaging software with RPM, Part 1: Building and distributing packages  http://www.ibm.com/developerworks/library/l-rpm1/  Packaging software with RPM, Part 2: Upgrading and uninstalling software  http://www.ibm.com/developerworks/library/l-rpm2/  WritingYumPlugins  http://yum.baseurl.org/wiki/WritingYumPlugins  RPM Guide  http://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/  RPM specs file syntax  http://wiki.mandriva.com/en/Policies/RpmSpecProposal#Requires.2C_Obsoletes.2C_Provides.2C_Conflicts.2C_et
c.


Thanks

