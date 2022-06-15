FloCon 2016 Dayton Beach, FL January 13, 2016
David Plonka <plonka@akamai.com>
Illustration used by permission. http://clairewatson.com

Agenda

I WANT YOU
TO USE IPv6

www.cs.brown.edu/~adf/cerf/

­ VINT CERF

Agenda

I WANT YOU
TO USE IPv6

www.cs.brown.edu/~adf/cerf/

­ VINT CERF

Agenda
· Why network analysts care about IPv6 · Who uses IPv6 and when?
· An introduction to IPv6 addresses
· How do we measure IPv6 activity?
· IPv6 Address Classification
· Temporal · Spatial
· Data Visualization and Exploration Demo · Take-aways

IPv6: Why Analysts Should Care
· IPv6 will operate simultaneously with IPv4 for the forseeable future.
One Internet ­ Two protocol versions ­ sharing common rendezvous mechanisms, e.g., the DNS.

IPv6: Why Analysts Should Care
· IPv6 will operate simultaneously with IPv4 for the forseeable future.
One Internet ­ Two protocol versions ­ sharing common rendezvous mechanisms, e.g., the DNS.
· IPv6 changes client reputation and geolocation. · IPv6 changes threat mitigation, e.g., access control and rate
limits. · IPv6 changes privacy, log processing, Real User Monitoring
(RUM), etc. · IPv6 changes target selection for active measurements.

An Introduction to IPv6 Addresses
IPv6 addresses in presentation format:
2001:db8:0:1cdf:21e:c2ff:fec0:11db 2001:db8:10:1::103 2001:db8:167:1109::10:901 2001:db8:4137:9e76:3031:f3fd:bbdd:2c2a

An Introduction to IPv6 Addresses
IPv6 addresses in presentation format:
2001:db8:0:1cdf:21e:c2ff:fec0:11db 2001:db8:10:1::103 2001:db8:167:1109::10:901 2001:db8:4137:9e76:3031:f3fd:bbdd:2c2a

An Introduction to IPv6 Addresses
IPv6 addresses in presentation format:
2001:db8:0:1cdf:21e:c2ff:fec0:11db 2001:db8:10:1::103 2001:db8:167:1109::10:901 2001:db8:4137:9e76:3031:f3fd:bbdd:2c2a
Consider 16-bit (4 character) and 4-bit (1 character) segments:
2001:0db8:0000:1cdf:021e:c2ff:fec0:11db 2001:0db8:0010:0001:0000:0000:0000:0103 2001:0db8:0167:1109:0000:0000:0010:0901 2001:0db8:4137:9e76:3031:f3fd:bbdd:2c2a

Who uses IPv6 and when? ­ Happy Eyeballs

Who uses IPv6 and when? ­ Happy Eyeballs

Who uses IPv6? ­ Major Content Providers
Thanks to Erik Nygren

Who uses IPv6? ­ Leading Countries
Thanks to Erik Nygren

Who uses IPv6? ­ Leading Networks
Thanks to Erik Nygren

Who uses IPv6? ­ Counting IPv6
Source: Google, https://www.google.com/intl/en/ipv6/statistics.html, Oct 20, 2015

Active IPv6 WWW Client Addresses
Source: Akamai, Oct, 2015

Active IPv6 WWW Client addresses: daily counts

500 M

400 M

Teredo ISATAP 6to4 Other EUI-64 EUI-64 IIDs /64 prefixes

318 M

470 M

300 M

200 M
149 M

199 M

100 M
61.4 M

82.9 M

164 M 121 M

0 Mar-20A1p4r-20M14ay-20J1u4n-201Ju4l-20A1u4g-20S1e4p-20O14ct-20N14ov-20D1e4c-20J1a4n-20F1e5b-20M15ar-20A1p5r-20M15ay-20J1u5n-201Ju5l-20A1u5g-20S1e5p-2015

Active IPv6 WWW Client addresses: weekly counts
3.0 B

2.5 B 2.0 B

Teredo ISATAP 6to4 Other EUI-64 EUI-64 IIDs /64 prefixes

1.80 B

2.61 B

1.5 B
1.0 B 833 M

1.17 B

500.0 M
157 M
0.0

207 M

307 M

417 M

AJSFJNAJMSADJMAJMOaeeuuaaeouuepaupacurypblrgnncryptvglrn-------------------2222222222222222222000000000000000000011111111111111111115555555554444444444

Active IPv6 WWW Client addresses: weekly counts (log scale)

3 B

1 B 500M

100 M

64.2 M

1 M

10 k

Teredo

ISATAP

6to4

100

Other EUI-64

EUI-64 IIDs

/64 prefixes

1 Mar-20A1p4r-20M14ay-20J1u4n-201Ju4l-20A1u4g-20S1e4p-20O14ct-20N14ov-20D1e4c-20J1a4n-20F1e5b-20M15ar-20A1p5r-20M15ay-20J1u5n-201Ju5l-20A1u5g-20S1e5p-2015

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

50 M

100 M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

Temporal Address Classification: Stability Analysis
400 M

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

50 M

100 M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

363M

400 M

Address Stability: March 17-23, 2015 (1.80B v6 addresses)

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

100 M 50 M

83.8M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

363M

400 M

Address Stability: March 17-23, 2015 (1.80B v6 addresses)

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

24.1M

50 M

100 M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

363M

400 M

Address Stability: March 17-23, 2015 (1.80B v6 addresses)

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

50 M
16.4M
0

100 M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

363M

400 M

Address Stability: March 17-23, 2015 (1.80B v6 addresses)

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

30.1M 3d-stable

50 M

100 M

active per day
Mar 17 active Mar 23 active

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

Address Stability: March 17-23, 2015 (1.80B v6 addresses)
400 M

Address Stability: weekly

3 B 2.5 B

3d-stable addresses not 3d-stable

2 B

1.5 B

1 B 500 M

96%

97%

96%

0 Mar-2014

Sep-2014

Mar-2015

95%
Sep-2015

log processed date

Mar-10 Mar-11 Mar-12 Mar-13 Mar-14 Mar-15 Mar-16 Mar-17 Mar-18 Mar-19 Mar-20 Mar-21 Mar-22 Mar-23 Mar-24 Mar-25 Mar-26 Mar-27 Mar-28 Mar-29 Mar-30

0

50 M

100 M

active /64s per day
Mar 17 active /64s Mar 23 active /64s

250 M 200 M 150 M

unique active IPv6 addresses

300 M

350 M

/64 Prefix Stability: March 17-23, 2015 (307M /64 prefixes)
400 M

/64 Prefix Stability: Weekly

500 M 400 M

3d-stable /64 prefixes not 3d-stable /64 prefixes

300 M

200 M 100 M

16%

18%

20%

0 Mar-2014

Sep-2014

Mar-2015

26%
Sep-2015

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2001:db8::/42

Binary PATRICIA Trie Example: Sample addrs, JP TelCo /32

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2001:db8::/42

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf

Binary PATRICIA Trie Example: Sample addrs, JP TelCo /32

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

/63

/62

/61

2001:db8:20:c000:568:acf2:32ba:c6bf

/42

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf

Binary PATRICIA Trie Example: Sample addrs, JP TelCo /32

2001:db8:10:8::17f 64

2001:db8:10:9::68 64

2001:db8:10:c::109d 63

2001:db8:10:e::92d 63

/63

/62

2001:db8:20:c000:568:acf2:32ba:c6bf /61
43

/42
2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2001:db8::/42

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2001:db8::/42

1

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2 2001:db8::/42

1

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

3
2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2 2001:db8::/42

1

Spatial Address Classification: Level-Compressed Trees

2001:db8:10:8::17f

2001:db8:10:9::68
5

2001:db8:10:c::109d

2001:db8:10:e::92d

2001:db8:10:8::/63

2001:db8:10:c::/62

3
2001:db8:10:8::/61

2001:db8:20:c000:568:acf2:32ba:c6bf

2 2001:db8::/42

1

From Tree to Multi-Resolution Aggregate (MRA) Plot...

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf
256

128

aggregate count ratio, log scale

64

32

16

8

4

2

1

0

16

32

48

64

80

Prefix length (p)

16-bit segments 4-bit segments single bits

96

112

128

From Tree to Multi-Resolution Aggregate (MRA) Plot...

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf
256

128

aggregate count ratio, log scale

64

32

16

8

4

2

1

0

16

32

48

64

80

Prefix length (p)

16-bit segments 4-bit segments single bits

96

112

128

A Japan-inspired explanation of the MRA Plot

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf
256

128

aggregate count ratio, log scale

64

32

16

8

4

2

1

0

16

32

48

64

80

Prefix length (p)

16-bit segments 4-bit segments single bits

96

112

128

MRA Plot: JP TelCo /32 (~12K active WWW client addrs)

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf
256
128

16-bit segments 4-bit segments single bits

aggregate count ratio, log scale

64

32

16

8

4

2

1

0

16

32

48

64

80

96

112

128

Prefix length (p)

MRA Plot: JP TelCo /32 (~12K active WWW client addrs)

2001:db8:10:8::17f 2001:db8:10:9::68 2001:db8:10:c::109d 2001:db8:10:e::92d 2001:db8:20:c000:568:acf2:32ba:c6bf
256
compare height 128

16-bit segments 4-bit segments single bits

aggregate count ratio, log scale

64 single bit
32

dense

16

sparse

8

4

2

(known BGP prefix)

1

0

16

32

48

64

80

Prefix length (p)

96

112

128

MRA Plot: US Uni /32 (~7K active WWW client addrs)

2001:db8:e:0:e174:5522:1ada:1e5b 2001:db8:1082:fff8:ab:ebfd:9b16:6095 2001:db8:1082:fff8:9185:20eb:4349:816b 2001:db8:1082:fffa:245d:21cc:69a5:ac39 2001:db8:1082:ffff:d4b8:7d56:ad92:252f
256
128

16-bit segments 4-bit segments single bits

aggregate count ratio, log scale

64 32

16 8

4 2

1

0

16

32

48

64

80

96

112

128

Prefix length (p)

MRA Plot: US Uni /32 (~7K active WWW client addrs)

2001:db8:e:0:e174:5522:1ada:1e5b 2001:db8:1082:fff8:ab:ebfd:9b16:6095 2001:db8:1082:fff8:9185:20eb:4349:816b 2001:db8:1082:fffa:245d:21cc:69a5:ac39 2001:db8:1082:ffff:d4b8:7d56:ad92:252f
256 compare height
128

16-bit segments 4-bit segments single bits

aggregate count ratio, log scale

64
32 "u" bit cleared
16 sparse /64 prefixes
8

4

2

(known BGP prefix)

1

0

16

32

48

64

80

Prefix length (p)

96

112

128

MRA Plot: JP ISP: 57.0M active client addrs, 2.18M /64s

aggregate count ratio, log scale

65536 32768 16384 8192 4096
2048 1024
512 256 128 64 32 16
8 4 2 1
0

16-bit segments 4-bit segments single bits

16

32

48

64

80

96

112

128

Prefix length (p)

MRA Plot: US mobile: 510M active client addrs, 167M /64s

aggregate count ratio, log scale

65536 32768 16384 8192 4096
2048 1024
512 256 128 64 32 16
8 4 2 1
0

16-bit segments 4-bit segments single bits

16

32

48

64

80

96

112

128

Prefix length (p)

MRA Plot: EU ISP: 86.2M active client addrs, 15.5M /64s

aggregate count ratio, log scale

65536 32768 16384 8192 4096
2048 1024
512 256 128 64 32 16
8 4 2 1
0

16-bit segments 4-bit segments single bits

16

32

48

64

80

96

112

128

Prefix length (p)

MRA Plot: a /56 prefix: 459K active client addrs, 1 active /64

aggregate count ratio, log scale

65536 32768 16384 8192 4096
2048 1024
512 256 128 64 32 16
8 4 2 1
0

16-bit segments 4-bit segments single bits

16

32

48

64

80

96

112

128

Prefix length (p)

Visualizing the Active Internet: IPv4 by Hilbert Curve Heatmap
Image courtesy of John Heidemann, https://ant.isi.edu/address/

Visualizing the Active Internet: IPv6 by "Classified" Treemap

Demo: Exploring the active IPv6 address space

Take-aways for Me, You, and Everyone we know
· IPv6 changes client reputation and geolocation. · IPv6 changes threat mitigation, e.g., access control and rate
limits. · IPv6 changes privacy, log processing, Real User Monitoring
(RUM), etc. · IPv6 changes target selection for active measurements.

Take-aways for Me, You, and Everyone we know
· IPv6 is relevant to network analysis, flow-based and otherwise.
· IPv6 is different than what we're used to. · We've made progress developing techniques, but there's
more to do.

Take-aways for Me, You, and Everyone we know
· IPv6 is relevant to network analysis, flow-based and otherwise.
· IPv6 is different than what we're used to. · We've made progress developing techniques, but there's
more to do.

"Temporal and Spatial Classification of Active IPv6 Addresses" (IMC 2015) also: Sample IPv6 Active WWW Client Address Aggregate Counts Data
http://www.akamai.com/technical-publications/ Thanks!
Questions? Comments?
David Plonka <plonka@akamai.com>

