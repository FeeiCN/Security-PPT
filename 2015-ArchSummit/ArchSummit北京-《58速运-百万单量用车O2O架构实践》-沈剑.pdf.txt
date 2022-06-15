58 O2O
58 shenjian@daojia.com

-
·  -  · 58 -  · 58 -  · 




· O2O · O2O · O2O · 

O2O

O2O
· APPAPPAPP ·  1 2 3 +  4

O2O

O2O

· 



1 2 

3 +  Push

4
10APP5

O2O

-
·  +  1 210s 3
SELECT sj_uid FROM driver WHERE (jingdu > $jd - 3) AND (jingdu < $jd + 3) AND (weidu > $wd - 3) AND (weidu < $wd + 3)

-
·  1 2 ·  1HOW 2HOW ·  sj_uid => area_id ·  area_id => set<sj_uid>

-for
· 
1 =>  =>  =>  =>  => ... 2 =>  => 50
for(50){  =>  => MQTT
}

-
·  ·  1 2

-
· MQTT · TCP ·  1 2c2s 3s2c

-
· 10sGPS ·  1httpGPSweb-server 2 ·  1TCPGPS 2 ·  · 




·  1GPS"" 2GPSarea_id => set<sj_uid> 3 4TCP 5  


Q&A
· 

""

