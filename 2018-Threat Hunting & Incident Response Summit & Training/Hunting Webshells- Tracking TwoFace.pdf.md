HUNTING WEBSHELLS
TRACKING TWOFACE

THE HUNTERS
Josh M. Bryant
Director of Technical Account Management Tanium

Master Sergeant 183 Air Communications Flight
Illinois Air National Guard
@FixTheExchange https://www.fixtheexchange.com/

Robert Falcone
Threat Researcher Palo Alto Networks

@r0bf4lc

"Consistent use of web shells by Advanced Persistent Threat (APT) and criminal groups has led to significant cyber incidents."
https://www.us-cert.gov/ncas/alerts/TA15-314A

THE HUNTED

TWOFACE

Palo Alto Networks Proprietary and

5

LOADER

PAYLOAD

TWOFACE

64-byte Key

Key Salt

Embedded Webshell

Redirected To Decrypted Webshell

DEMO

Embedded webshell
byte[] brjCSCBsoKt =System.Convert.FromBase64String("O+Hp1vX181ykFZOp62sq rwxa6qfk2F8nWVuQkPUJotEG/pTGaUD124npIWvuuB8rmhT5iNRtWq 70KzEX4MWfEPIUBmo8inH/oxxKRQuCr9ZcrSBZao1+/Nj4S5KCcYby VD3jTSl/QvHQLx6OCPGAcL ..snip..

Base64 Encoded
Both the embedded webshell and key salt were base64 encoded

Random Variable Names
Random variable names were used for the encoded strings

Key salt
byte[] CPccVznnRld =System.Convert.FromBase64String("6nxL+zKa3nBOxtI8EW0Q KA1Sxngz861SIo1/Ei3dPv2Zvd4VtPSskJIG8XPX7xn8niGep9lWAk yUqpyyNZg/dXdzPDxkbqNTLwzgOY69jkJVdv71b15+CsV0OwSnSU1B HfYrirkwA5rQO/PaJRFhTQ ..snip..

Embedded Strings
Both strings were found embedded inside the loader

Unusable Signatures
Due to randomized nature of variable names and
base64 encoded data it is ineffective as signatures

DECRYPTION
Applying Key Salt for(int i = 0; i < salt.Length;i++)
salt[i]+=actor_key[i%actor_key.Length];
Decrypting Embedded Payload for(int j = 0; j < embedded_shell.Length;j++)
embedded_shell[j]-=salt[j%salt.Length];
TWOFACE

CRYPTO ATTACK

1 for x in range(0,255):

2

3 if chr((((ord(ciphertext_webshell[r])-

4 ord(key1_salt0[:r%0l5en'(<k'e,y_salt)]))&0xff)-x)&0xff) in

5 printab2le: 1: 8a '%', 87 '(',

6

3 2: 87 'C', 88 'B', 89 'A', 8a '@'

7 ... 4 3: 2b '%', 2c '$', 2d '#', 2e '"', 2f '!', 30 ' ',

62

5 4: a5 'P',

63 curSet=6curSe5t:.ianate'rds'e,ctiaodn('sae't,(possible_keys[c+(r*64)]

64 ))

7 6: ee 'g',

65

8 7: 81 'h', 84 'e',

66 ... 9 ...

102

10

103

65

104

66

105

102

106

103

104

105

106

Key
\x05\x8a\x8a0\xa5\xad\xee\x84r!\xc8\x a6\xd8\x17\xa6\x1c\xfe\xf3\x86\xc5$\x c9*U\xf5I1JZ\xf2\xc5EOd8\xdf\x1f\xba\ x8cmK\xd2\xd6\x00\xfa\x96\x85,\xf6\x0 3\xe7w*?\xcd!\xf3\x0b\xa7\xcd\\\x0f\x
d1\xbd
Cleartext Output
<%@ Page Language="C#" ValidateRequest="false" EnableViewState="false" %>\r\n\r\n<html>\r\n<head>\r\n<%\r\nc ();\r\nNameValueCollection t=HttpContext.Current.Request.Form;\r \npwd=t["pwd"]; ..snip..

LET'S GO HUNTING!

ATTACK GRAPHS

ACTOR ACTIVITIES

61 commands
JSMAueapnpryetcihl312,83267,42,021027106717

10 commands 166 ccoommmmaannddss
LLoo1ggsscoiimnnmttaoondOOWWAA

June 16, 2016
15 Distribution Lists 81 User Accounts

June 17, 2016
Downloads Offline Address Book (OAB) for offline processing

/owa/auth/error2.aspx /owa/auth/error3.aspx
> whoami

June 18, 2016

/owa/auth/errorn.aspx

Sept 28, 2016

** Uploads m64.exe to c:\windows\temp\ **
> c:\windows\temp\m64.exe privilege::debug ... sekurlsa::logonpasswords exit > c:\windows\temp\01.txt
> type c:\windows\temp\01.txt
> del c:\windows\temp\01.txt
> del c:\windows\temp\*.exe
> del "D:\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\owa\auth\errorn.aspx

/owa/auth/errorn.aspx

March 3, 2017

> net group "Exchange Trusted Subsystem" /domain
> dir \\<server name 1>\c$
> dir \\<server name 1>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews
** Uploads Exchange.aspx to c:\windows\temp\ **
** Timestomps c:\windows\temp\Exchange.aspx to match d:\Program ... Files\Microsoft\Exchange Server\V14\ClientAccess\exchweb\ews\exchange.asmx **
> copy c:\windows\temp\Exchange.aspx "\\<server name 1>\d$\Program ... Files\Microsoft\Exchange Server\V14\ClientAccess\exchweb\ews\"

/owa/auth/errorn.aspx

March 3, 2017

> copy c:\windows\temp\Exchange.aspx "\\<server name 2>\d$\Program ... Files\Microsoft\Exchange Server\V14\ClientAccess\exchweb\ews\"
> copy c:\windows\temp\Exchange.aspx "\\<server name 3>\d$\Program ... Files\Microsoft\Exchange Server\V14\ClientAccess\exchweb\ews\"
> copy c:\windows\temp\Exchange.aspx "\\<server name 4>\d$\Program ... Files\Microsoft\Exchange Server\V14\ClientAccess\exchweb\ews\"
> del "D:\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\owa\auth\errorn.aspx

/owa/auth/errorc.aspx

April 24, 2017

> net group "exchange trusted subsystem" /domain
> hostname
> dir "\\<server name 4>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews"
> dir "\\<server name 1>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews"
> dir "\\<server name 2>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews"
> dir "\\<server name 3>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews"

/owa/auth/errorc.aspx

April 24, 2017

> ping -n 1 <server name 3>
> dir "\\<server name 3>\d$
> dir "\\<server name 3>\c$
** Uploads global.aspx to \\<server name 1,2,4>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews\ **
> attrib +h "\\<server name 1,2,4>\d$\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\exchweb\ews\global.aspx"
** Uploads mom64.exe to c:\windows\temp\ **

/owa/auth/errorc.aspx
> taskkill /f /im mom64.exe > type c:\windows\temp\01.txt > del c:\windows\temp\mom64.exe > del c:\windows\temp\01.txt > del "D:\Program Files\Microsoft\Exchange ... Server\V14\ClientAccess\owa\auth\errorc.aspx

April 24, 2017

/owa/auth/errorn.aspx

May 3, 2017

> ping ­n 1 4.2.2.4 > net group "Domain admins" /domain > dir c:\windows\temp ** Uploads MicrosoftUpdate.exe to c:\windows\temp ** > c:\windows\temp\MicrosoftUpdate.exe p::d s::l q > c:\windows\temp\mic.txt > type c:\windows\temp\mic.txt

#DFIR ENABLED!

Where my logs at?
Step 1 ­ Find all Exchange (2010-2016) Servers with the Client Access Server Role.
Step 2 ­ Find where the IIS Logs are stored.
PS C:\> [adsi]"IIS://localhost/w3svc" | select LogFileDirectory | %{$_.LogFileDirectory} C:\inetpub\logs\LogFiles

Searching IIS Logs with Log Parser Studio
Indicators · POST operations with low RequestCount · URIs that don't require authentication · GET operations with HTTP Status 404

Searching IIS Logs with Log Parser Studio
Note UserAgent

Searching IIS Logs with Log Parser Studio
Identify Compromised Accounts

Identify Compromised Accounts
ClientId = Server-side Cookie Reference

Invoke-ExchangeWebShellHunter

PS C:\Windows\system32> Invoke-ExchangeWebShellHunter

FNBornTime

: 11/21/2016 4:59:41 PM

Server

: EX2016

UpdatedOn

: 11/20/2016 10:30 PM

File

: C:\Program Files\Microsoft\Exchange

Server\V15\FrontEnd\HttpProxy\owa\auth\errorEE.aspx

InstalledOn : 5/14/2016 3:21 AM

PSComputerName : EX2016

RunspaceId

: 21645dd4-02d5-4d94-bb77-3878b44e5ec0

https://github.com/FixTheExchange/Invoke-ExchangeWebShellHunter

QUESTIONS?
Josh M. Bryant
Director of Technical Account Management Tanium

Master Sergeant 183 Air Communications Flight
Illinois Air National Guard
@FixTheExchange https://www.fixtheexchange.com/

Robert Falcone
Threat Researcher Palo Alto Networks

@r0bf4lc

