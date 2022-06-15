RDP: 
 @ Tencent KeenLab 2019.7.19


1. RDP 2. CVE-2019-0708 3.  4.  5. Demo 6. 

RDP

Ø    ØR D P      Ø 



ØW i n d o w s X P ØW i n d o w s S e r v e r 2 0 0 3 ØW i n d o w s 7 ØW i n d o w s S e r v e r 2 0 0 8 R 2




Svchost.exe

rdpclip.exe
 <RDPSND> <CLIPRDR>

icaapi.dll
Use <\Device\Termdd>
termsrv.dll
\pipe\Ctx_WinStation_API_service
termsrv.dll
RPC wrapper
wtsapi32.dll
API

rdpwsx.dll
MCS/GCC  ... <MS_T120>



ØW i n d o w s 8 ØW i n d o w s S e r v e r 2 0 1 2 ØW i n d o w s 1 0
Øt e r m i n p u t . s y s ØR d p b a s e . d l l ØR d p c o r e . d l l ØR d p s e r v e r b a s e . d l l

RDP

 X.224 

RDP

MCS

(MCS): ITU T.120 T122 T125


TCP31
1003 I/O 1007 


* cliprdr () * rail (RemoteApp) * drdynvc ()
* audin () * alsa support * pulse support
* tsmf () * alsa support * pulse support * ffmpeg support

* rdpdr () * disk (Disk Redirection) * parallel (Parallel Port Redirection) * serial (Serial Port Redirection) * printer (Printer Redirection) * CUPS support * smartcard (Smartcard Redirection)
* rdpsnd () * alsa support * pulse support

CVE-2019-0708


Client MCS Connect Initial PDU with GCC Conference Create Request



MS_T120
Ør d p w s x ! M C S C r e a t e D o m a i n ØI c a a p i ! I c a C h a n n e l O p e n ØI c a a p i ! _ I c a S t a c k O p e n ØI c a a p i ! _ I c a O p e n ØN t d l l ! N t C r e a t e F i l e ØT e r m d d ! I c a C r e a t e ØT e r m d d ! I c a C r e a t e C h a n n e l



MCSPortData

Rdpwd!HandleConnectInitial

IcaChannelInput

MCSPortData







Ø          Ø          ØU a F     Ø   


Ø    : u s e a f t e r f r e e Ø      I c a C h a n n e l ,   : 0 x 8 C Ø     Ø        s h e l l c o d e         Ø    E I P            


FreeRDP 1178 C, 623000

rdesktop 53 C,42934





EIP



EIP


Ø      E X P ØS h e l l c o d e          ( R i n g 0 )   I R Q L  D I S P A T C H _ L E V E L Ø                    ( I R Q L  P A S S I V E _ L E V E L )
Ø                     s y s c a l l ØS h e l l c o d e                 s y s c a l l Ø          ( A P C )             ( r i n g 3 )

IcaChannel

ret

It works! 

Win7 x86 shellcodeXP



Demo


Ø1 . 3 . 1 . 2 S e c u r i t y - E n h a n c e d C o n n e c t i o n S e q u e n c e
ØT h e r e a r e t w o v a r i a t i o n s o f t h e S e c u r i t y - E n h a n c e d C o n n e c t i o n S e q u e n c e . T h e n e g o t i a t i o n based approach aims to provide backward-compatibility with previous RDP implementations, while the Direct Approach favors more rigorous security over interoperability. ØD i r e c t A p p r o a c h : I n s t e a d o f n e g o t i a t i n g a s e c u r i t y p a c k a g e , t h e c l i e n t a n d s e r v e r immediately execute a predetermined security protocol (for example, the CredSSP Protocol) prior to any RDP traffic being exchanged on the wire. This approach results in all RDP traffic being secured using the hard-coded security package. However, it has the disadvantage of not working with servers that expect the connection sequence to be initiated by an X.224 Connection Request PDU.



CredSSP

RDSTLS

