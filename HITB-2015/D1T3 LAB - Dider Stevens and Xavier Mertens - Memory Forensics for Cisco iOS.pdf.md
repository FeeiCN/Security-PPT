USB to serial: install the appropriate driver for your OS before connecting the convertor. Drivers are in folder "2303 all driver" on the CD. Remark: does not work for Windows 8(.1).

Your laptop: Assign static address Ethernet: 10.0.0.2/255.0.0.0

Connect white network cable to FastEthernet 0/0 connector Connect white network cable to your laptop's Ethernet port Connect blue console cable to CONSOLE connector Connect blue console cable to USB-to-serial adapter

Launch Putty, serial mode, select COM? Port (look in device manager)

Power on the router. Wait a couple of minutes (3:06) until the router is up and running. You will then be able to type the RETURN-key and see Router> prompt.

With Putty, telnet into 10.0.0.1

Type password cisco Type enable Type the wrong password: kriek Type the correct password: cisco show region show version (+ space) show processes (+ couple of spaces) show running-config (+ couple of spaces) show memory (+ couple of spaces, then CTRL-C, CTRL-C) ping 10.0.0.1 ping 10.0.0.2 firewall ping 10.0.0.2 start tftpd32 write core 10.0.0.2 <RETURN> This will take around 19:58. Use this time to install Python (if not yet installed).
move files Router-coreiomem and Router-core to workshop folder. naft-gfe.py Router-coreiomem.pcap Router-coreiomem naft-gfe.py Router-core.pcap Router-core windump -r Router-core.pcap windump -r Router-coreiomem.pcap naft-icd.py cwstrings Router-core naft-icd.py regions Router-core naft-icd.py heap Router-core naft-icd.py -r heap Router-core

naft-icd.py frames Router-core Router-coreiomem Router-coreiomem-2.pcap naft-icd.py history Router-core naft-icd.py events Router-core naft-icd.py -rf "TTY data" heap Router-core naft-icd.py -rsf "TTY data" heap Router-core
show flash
copy flash:c2600-ipbasek9-mz.124-17a.bin tftp 10.0.0.2 <RETURN>
move c2600-ipbasek9-mz.124-17a.bin to workhop folder copy flash:c2600-ipbasek9-mz.124-17a-verify.bin tftp 10.0.0.2 <RETURN>
move c2600-ipbasek9-mz.124-17a-verify.bin to workhop folder
naft-icd.py checktext Router-core c2600-ipbasek9-mz.124-17a.bin naft-icd.py checktext Router-core c2600-ipbasek9-mz.124-17a-verify.bin
naft-ii.py c2600-ipbasek9-mz.124-17a.bin naft-ii.py c2600-ipbasek9-mz.124-17a-verify.bin

