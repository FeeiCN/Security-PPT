Copyright  ©  2015  Splunk  Inc.  
Securing  Splunk    with   Single  Sign  On  &  SAML  
Nachiket  Mistry  
Sr.  So=ware  Engineer,  Splunk  
Rama  Gopalan  
Sr.  So=ware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaJon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauJon  you  that  such  statements  reflect  our   current  expectaJons  and  esJmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaJon  are  being  made  as  of  the  Jme  and  date  of  its  live   presentaJon.  If  reviewed  a=er  its  live  presentaJon,  this  presentaJon  may  not  contain  current  or   accurate  informaJon.  We  do  not  assume  any  obligaJon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiJon,  any  informaJon  about  our  roadmap  outlines  our  general  product  direcJon  and  is  subject  to   change  at  any  Jme  without  noJce.  It  is  for  informaJonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaJon  either  to  develop  the  features  
or  funcJonality  described  or  to  include  any  such  feature  or  funcJonality  in  a  future  release.  
2  

"Through  2016,  Federated  Single  Sign--On   Will  Be  the  Predominant  SSO  Technology,  
Needed  by  80  Percent  of  Enterprises."                                                                                                                                 --  Gartner  
3  

Rama  Gopalan  
 Sr.  So=ware  Engineer    5+  Years  with  Splunk  
rgopalan@splunk.com  
4  

Nachiket  Mistry  
 Sr.  So=ware  Engineer    3+  Years  with  Splunk    5  Major  Releases      50+  Maintenance  Releases  
nmistry@splunk.com  
5  

Agenda  
 Why  Single  Sign  On  (SSO)    Splunk  SSO    Splunk  SSO  with  SAML  
6  

Wikipedia  on  Single  Sign  On    
7  

8  

Why  Single  Sign  On  (SSO)  
 Reduce  administraJon    Time  savings  for  users    Increase  user  adopJon    Increased  security  
9  

Configuring  Splunk  SSO  
4  Step  Process  
10  

Configuring  SSO  in  Splunk  
11  

Configuring  SSO  in  Splunk  
12  

Configuring  SSO  in  Splunk  
13  

Configuring  SSO  in  Splunk  
14  

1:  Configuring  LDAP  
15  

Configuring  LDAP  
16  

Configuring  LDAP  
17  

Configuring  LDAP  
18  

Configuring  LDAP  
19  

Configuring  LDAP  
$ cat etc/system/local/authentication.conf [authentication] authSettings = OpenLDAP authType = LDAP
[OpenLDAP] host = myldaphost.splunk.com nestedGroups = 0 port = 389 bindDN = cn=manager,dc=openldap,dc=splunk,dc=com ...
20  

Authorizing  LDAP  Users  
21  

Authorizing  LDAP  Users  
22  

Authorizing  LDAP  Users  
23  

Authorizing  LDAP  Users  
24  

Configuring  LDAP  

$ cat etc/system/local/authentication.conf

. . .

[roleMap_OpenLDAP] admin = Static Help Admin;Static user = Nested Group

Sustaining Admin

25  

2:  Configuring  Reverse  Proxy  
26  

Configuring  Apache  as  Reverse  Proxy  
$ sudo a2enmod proxy_http ... ProxyRequests off ProxyPass / http://mysplunkhost:8000/ ProxyPassReverse / http://mysplunkhost:8000/ ...
27  

3:  Reverse  Proxy  Handles  AuthenJcaJon  
28  

Apache  &  LDAP  
$ sudo a2enmod authnz_ldap ldap
... AuthType Basic AuthBasicProvider ldap AuthName "OpenLDAP" AuthLDAPURL ldap://myldaphost.splunk.com:389/ou=people,dc=splunk,dc=com AuthLDAPBindDN "cn=manager,dc=openldap,dc=splunk,dc=com" AuthLDAPBindPassword "password" require valid-user ...
29  

Finally:  Enable  SSO  
30  

Set  the  User  Name  Header  
$ sudo a2enmod rewrite ... RewriteEngine on RewriteRule .* - [E=RU:%{REMOTE_USER}] RequestHeader set REMOTE_USER %{RU}e ...
31  

Enable  SSO  in  Splunk  
$ cat etc/system/local/server.conf [general] trustedIP = 127.0.0.1 $ cat etc/system/local/web.conf [settings] trustedIP = 127.0.0.1,10.162.255.123
32  

33  

TroubleshooJng  SSO  
/debug/sso  
34  

TroubleshooJng  SSO  
35  

Splunk  SSO  with  SAML  
36  

SAML  2.0  
 Security  AsserJon  Markup  Language    XML  based  standard  for  browser  based  SSO    MulJple  protocols  and  bindings    IDP  --  IdenJty  Provider  --  Trusted  Authority,  SP  --  Service  Provider    IDPs  out  there  ­  Ping  IdenJty,  Okta,  OneLogin,  Azure    
37  

Why  SAML?  
 Security         q   CredenJals  are  not  stored  locally   q   Standard  for  Single  Sign  On     
 MulJ--Factor  authenJcaJon  
38  

Splunk  and  SSO  

  

-- pre--SAML  

with  SAML --

                                                    [authenJcaJon]  

          authSepngs  =  saml_sepngs  

SAML             authType  =      
  
  

        

                                                        Configure  Splunk  

Export  SP  Metadata  
41  

                                        The  Login  Process  
42  

Splunk(SP)  

User/Browser  

Ping  IdenJty(IDP)  

  

                                        1.User  accesses  Splunk  resource  

  

                                                                  

                                                                        2.  Redirected  to  the  IDP  --  AuthnRequest  

  

        

                                                                                                                                                                                                                                                                                  3.  IDP  prompts  the  user  

                                 

  

  

  

                            for  credenJals  

                                                                                                        

  

  

  

  

  

  

  

  

  

  

  

  

5.  IDP  redirects  back  to  Splunk,    

          sends  a  SAML  asserJon    

                                                                                                                                                                                                                                                                  5b.  Session  cookie  of  Ping  

                                                                                                                                                                                                                                                              

                                                                                              

                                6.  Splunk  checks  the  `role'  avribute  in  the  

    asserJon  and  checks  the  role  mapping    

  

  

  

    

                                                                                                                                          7.  SUCCESS  ­  User  logged  in  

    

  

  

  

                        4.  User  enters                                   credenJals    

Configure  the  IDP  (Ping  IdenJty)  
 IDP  iniJated  SSO,  SP  inJated  SSO,  SP  iniJated  SLO       Avribute  Query  Request  Supported  
 Signed  request/response  
 Upload  Splunk's  cerJficate  OR    Import  Splunk's  metadata           

Configure  Ping  for  SSO  
45  

Avributes  in  the  SAML  asserJon  
46  

Why  Avribute  Query?  
 When  saved  searches  need  to  run    Splunk  uses  the  avribute  query  url  using  basic  auth  and  queries   the  IDP    IDP  returns  `avributes'  --  mainly  AD  group  informaJon    Splunk  uses  the  role  mapping  and  creates  a  session  for  the  user  

Set  up  SHC  with  SAML  
    Configure  all  search  heads  with  SAML  
 AddiJonal  sepngs  if  there  is  a  proxy  or  load  balancer  
 Single  logout  --  search  heads  share  a  Ping  session  index  

Q  &  A  

THANK  YOU  

