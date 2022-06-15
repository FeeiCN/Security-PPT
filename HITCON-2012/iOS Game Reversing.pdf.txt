iOS & 
(Dark)


 PHATE Security-   Zuso Security -   Chroot -    - R&D   - R&D   -    -    - 


 iOS 
 IAP (In-App-Purchases)   
 iOS

Steve Jobs

iOS 

iOS APP
 
 Mach-O
 
 ARMv6
 Thumb
 ARMv7
 Thumbv2


 JBiphone  GDB
 
 IDA Pro
 
 otool
 mach-o
 class-dump
 objective C classes.h

IDA Pro...
 code
 otool ­l filepath | grep `crypt' (&)  gdb~dump  

DEMO

Binary Patching
   ARM Assembler
 OP Code
  , 

DEMO

IAP (In-App-Purchases)

IAP
 -IAP ­ API  -JB
 IAP (MITM SSL Proxy Server)  -JB

IAP ­ API

SKPaymentTransaction class

SKPaymentTransaction transactionState

SKPaymentTransactionStatePurchasing

SKPaymentTransactionStatePurchased

SKPaymentTransactionStateFailed

SKPaymentTransactionStateRestored

 ,  (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions

Developertransactions

Sample:

 - (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions

{



for (SKPaymentTransaction *transaction in transactions)



{



switch (transaction.transactionState)



{



case SKPaymentTransactionStatePurchased:



if([self putStringToItunes:transaction.transactionReceipt]){



//developer ,  , 



}



break;



}



}

}

Apple IAP
 https://buy.itunes.apple.com/verifyReceipt
 json   , status 0  
{"receipt":{"original_purchase_date_pst":"2012-07-12 05:54:35 America/Los_Angeles", "purchase_date_ms":"1342097675882", "original_transaction_id":"170000029449420", "original_purchase_date_ms":"1342097675882", "app_item_id":"450542233", "transaction_id":"170000029449420", "quantity":"1", "bvrs":"1.4", "version_external_identifier":"9051236", "bid":"com.zeptolab.ctrexperiments", "product_id":"com.zeptolab.ctrbonus.superpower1", "purchase_date":"2012-07-12 12:54:35 Etc/GMT", "purchase_date_pst":"2012-07-12 05:54:35 America/Los_Angeles", "original_purchase_date":"2012-07-12 12:54:35 Etc/GMT", "item_id":"534185042"}, "status":0}

Objective-C
 b [classname method]  objc_msgSend
 objc_msgSend(object_ptr,@selector_name,arg0,arg1)  objc_msgSend($r0,$r1,$r2,$r3,...,...)  po $r0
 class-dump ­H filepath ­o output

DEMO

IAP ­ App AppStore
 AppAppStoreIAP Request
 
 AppStore   , AppStore 
APP  
switch (transaction.transactionState) { case SKPaymentTransactionStatePurchased: if([self putStringToItunes:transaction.transactionReceipt]){ //developer ,  ,  } break; }

MITMIAP
 AppIAP Request , App


 DNS Serverapple server domain name ip  http://www.in-appstore.com/  :  IP,  :   , domain nameip     , apple , 

DEMO

iOS


 unix socket  tcp connection?
 heartbeatserver
 ?  launchctl load /System/Library/LaunchDaemons/xxx.plist

DEMO



iOS APP?
 task_for_pid
 vm_read_overwrite  vm_write
 MobileSubstrate Plugin
 DLL Injection...

DEMO


 http://developer.apple.com/library/ios/#documentation/StoreKit/Refe rence/SKPaymentTransaction_Class/Reference/Reference.html
 http://www.iphonedevwiki.net/index.php/MobileSubstrate  http://www.peter-cockerell.net/aalp/html/frames.html  http://sources.redhat.com/gdb/documentation/  iOS.Hackers.Handbook  Patching_Applications_from_Apple_AppStore_with_additional_prot
ection_by_Reilly  *(http://hiraku.tw/)repo server&deb

Thank You!
Q&A


zusodark@gmail.com

