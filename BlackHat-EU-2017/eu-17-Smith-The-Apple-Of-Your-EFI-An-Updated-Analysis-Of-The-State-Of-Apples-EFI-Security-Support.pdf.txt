    
   

 
  
   



?

 
   


    
  

 





















X

   
 
 






efiupdate



 $MODEL_$MAJOR_$MINOR_LOCKED.$EXT



efiupdate





bless

 bless -mount / -firmware MBP111_0138_B21_LOCKED.scap --verbose --recovery




 
  

<Model><major,minor>



Mac-<8 or 16 character hex string>





ioreg -l | grep -i board-id



 Mac-B809C3757DA9BB8D

 Mac-DB15BD556843C820

 Mac-65CE76090165799A

       

781F254A-C457-5D13-9275-1BF5D56E0724 0x7C000019
Mac-B809C3757DA9BB8D IORegistry









MBA71.0166.B26







781F254A-C457-5D13-9275-1BF5D56E0724





 







Phase 1 Extract the EFI updates from OS/Security updates released by Apple

Build Dataset
OS Build number Board-ID EFI Version

Phase 2 Gather real world data from production Macs

Build Dataset
OS Build number Board-ID EFI Version

Analysis 1 Look for anomalies in the EFI firmware Apple has released
Profit Conclusions!
Analysis 2 Look for discrepancies between EFI in production and EFI we expect to see


 

    

 
  




 
      


  
     

SecUpd<20XX>-<YYY> ntp



   


  
  MBPXXY.NNNN.B00 


     


  
 

   

MBP112.0138.B17 MBP112.0138.B18 MBP112.0138.B17







efiupdater





 



efiupdater


 


  






eficheck





 /usr/libexec/firmwarecheckers/eficheck/eficheck
















   

/usr/local/bin/osqueryi "select version from platform_info" /usr/local/bin/facter system_profiler.boot_rom_version /opt/chef/bin/ohai hardware/boot_rom_version

/usr/sbin/system_profiler SPHardwareDataType | awk '/ROM/{print $4}'







efiupdater





   
 
 
 


 
   

    
   

