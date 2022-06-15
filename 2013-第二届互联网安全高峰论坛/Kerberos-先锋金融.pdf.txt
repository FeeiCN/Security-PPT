KERBEROS
 12/20/2013


· Kerberos · Kerberos · Kerberos · Kerberos · Kerberos

Kerberos

Kerberos 1 ·  2 · MIT 3 · 




· Yum
­ yum install krb5-server krb5-libs krb5-workstation
· 
­ ./configure; make&&make install
· :http://www.linuxproblems.org/wiki/Set_up_kerberos_on_Centos_6



·· [[lologggginingg]] ·· ddeeffaauultlt==FFIILLEE:://vvaarr//lologg//kkrrbb55lilbibss..lologg
· kkddcc==FFIILLEE:://vvaarr//lologg//kkrrbb55kkddcc..lologg
· aaddmminin__sseerrvveerr== FFIILLEE:://vvaarr//lologg//kkaaddmminindd..lologg
· 

· [libdefaults]

·· ·

[dLldiIebNefdfaUaeuXuflaPtltu_R_lrOtreseaB]alLmlmEM==SL.IONRUGXPROBLEMS.ORG

·· ddnnss__loloookkuupp__rreeaalmlm==ffaalslsee

· ddnnss__loloookkuupp__kkddcc==ffaalslsee

· tticickkeett__lilfifeettimimee==2244hh

·· rreenneeww__lilfifeettimimee==77dd ·· ffoorrwwaarrddaabblele==ttrruuee

·[rea[lrmeas]lms] ·LINkdULcIXN=PURceXOnPBtRLoOEsMB.liLnSEu.MOxRpSGr.Oo=bRlG{em= s{.org · admkidnc_s=erver = centcoesn.ltionsu.lxipnruoxbplreomblse.omrsg.org ·} admin_server =
centos.linuxproblems.org
·}
·[.ldinoum[xdapoirmno_barlieenam_lrmse.a]olrmg ]= ·LINU.lXinPuRxOpBroLbElMemS.sO.oRrGg = linuLxIpNroUbXlPeRmOsB.oLrEgM=S.ORG ·LINUlinXuPRxpOrBoLbEleMmSs.O.oRrgG=
LINUXPROBLEMS.ORG


· Yum ­yum install krb5-server krb5-libs krb5-workstation
·  ­./configure; make&&make install
· 
­ kdb5_util create -s

·  · kadmin.local -q "addprinc username/admin"
· while read i;do echo $i;kadmin.local -q "addprinc +needchange -pw $i $i";done</tmp/list.txt  
· 
· kadmin.local -q "addprinc host/n001.ncf.com@ LINUXPROBLEMS.ORG "

·  · while read i;do echo $i;kadmin.local -q "ktadd -k
/tmp/krb5.keytab.$i host/$i@NCF.COM";done</tmp/list.txt
· 


· Yum
­ yum install krb5-libs krb5-workstation
· 
­ ./configure; make&&make install
· krb5.conf /etc/ · krb5.keytab  /etc/ · Vim ~/.k5login
­ xxx@ LINUXPROBLEMS.ORG

·

:http://www.linuxproblems.org/wiki/Set_up_kerberos_on_Centos_6

· DNS · Hostname ·  · Hosts
­ HostsIP

Kerberos
· http://web.mit.edu/kerberos/dist/ 

Linux
· Redhatyum -y install krb5-pkinit-openssl krb5workstation krb5-libs
· Debianapt-get install krb5-user · krb5.conf/etc/ · kinit  · 

Putty

Secure CRT


· 
­ Vim /root/.k5login
· 
­ kpasswd liudan ##
· 
­ kdestroy
· 
­ klist

Kerberos
·  · S1 · kinit ·  · 
­  ­ 
· 


·  ·  · hostKerberos · sshd · root


trap 'stty echo;echo; exit' INT


· Apache mod_auth_kerb
· Perl Authen-Krb5-Simple-0.43
­ 




· Kerberos · DNSDNSping kerberos.lan.ncf.com · Hosts
­ hosts ­ hostsIP ­ 10.*.6.*
· : xxxx.xxx.com 10.*.6.* ·  xxx.xxx.xx.com 10.*.6.*
· :xxx.xxx.com 127.0.0.1 · switch hosts

Q&A


http://www.linuxproblems.org/wiki/Set_up_kerberos_on_Centos_6 http://wiki.centos.org/zh/HowTos/HttpKerberosAuth http://support.microsoft.com/kb/555092/zh-cn



