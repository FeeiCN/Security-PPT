MITM && HTTPS

 
2/21


3/21

4/21

5/21

https
 gfw ...
6/21

ssl

RSA ECDHE_RSA ECDHE_ECDSA
8/21

9/21

10/21

ECDHE
11/21


 
12/21

ECDHETLS  1.ca(ECC RSA)  ECC  2.  ECC  3. ECC  4. ECC  ECC  5.
13/21

ssl

KEY CSR CER
15/21

16/21

17/21

18/21

19/21



 http
21/21

22/21

23/21

HSTS
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always; http(302 )
24/21

 
25/21

HPKP
   url 
openssl x509 -in intermediate.pem -noout -pubkey | openssl asn1parse -noout -inform pem -out public.key
openssl dgst -sha256 -binary public.key | openssl enc -base64 >code
Public-Key-Pins: pin-sha256="base64==code"; max-age=expireTime [; includeSubdomains][; report-uri="reportURI"]
26/21


27/21

mozilla: ssl_ciphers "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA3 84:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHERSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE -RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES 256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DE S-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
  ECDHE + AESGCM  TLS 1.2   PFS ECDHE  DHE AES 128  AES 256 AES256 AES128   AES  3DES AES  TLS1.1  TLS1.0  3DES . RC4 . 3DES 
 aNULL  diffie - hellman  eNULL () EXPORT  RC4 ARCFOUR DES  SSLv2 ,SSL, MD5 5
28/21

29/21

Thanks

