QEMU 

 (@leonwxqian) Tencent Blade Team
· IoT · NVIDIA vGPUAmazon EchoGoogle Home""
SQLiteCurl · 
0 1

n Tencent Blade Team2017 n AIoT n GoogleMicrosoft AppleAmazonHuawei200+ n BlackHatDEFCONCanSecWestHITBPOCXcon n https://blade.tencent.com
0 2

 ·  · Hypervisor · Hypervisor
guest · QEMU-KVMXenVMwareHyper-V
0 3

Hypervisor

· HypervisorGuest

""

· Host

· Guest

Guest

· GuestHost



0 4

QEMU

· /

· PATA/SATA/virtio-blk/virtio-sata......

· VirtioQEMU

· virtiox86AHCI (SATA)

· QEMUAHCI

· CVE-2020-29443

https://qemu.org/2021/01/19/virtio-blk-scsi-configuration/

0 5

AHCI · AHCI (Advance Host Controller Interface) Intel  SATA 

· AHCISATASATAPATAATA

· QEMUPATA/SATA/AHCI

· AHCIMMIOIDEPMIO

· AHCI PCI 

· AHCI  SATA 

· AHCI Intel AHCI Linux

0 6

 1 FIS
2 ATAPI
3 PRDT 0 7

FIS  · SATAFIS(Frame Information Structure)

· SATAPATASATA/PATAFIS

· FISATA

· FIS

· Register FIS - host to device

· Data FIS ­ bidirectional

· Register FIS - device to host

· BIST activate FIS ­ bidirectional

· DMA activate FIS - device to host · PIO setup FIS - device to host

0 8

· DMA setup FIS ­ bidirectional

· Set device bits FIS - device to host

ATAPI Command · ATAPI  ATA SCSI ·  PACKET  (0xA0)  IDENTIFY PACKET DEVICE (0xA1) · PACKET1SCSI 11
· QEMU"WIN_PACKETCMD0xA0"
0 9

PRDT · Physical Region Descriptor Table · PRDT16

12-15

7-11

4-7

0-3

DBC - 



DBAU - DBA DBA ­ 

· DBA

· DBC

· PRDT65535

1 0



 · IO"" · IO · memcpy

· s->io_bufferBuffer

· Sourcesize

1 2

----ide_atapi_cmd_read_pio · sourcesize · packet_transfer_sizenb_sectors  sector_size · nb_sectorsbuf

1 3

......

· 
· (hw/ide/atapi.c) cmd_read  cmd_read_cdà ide_atapi_cmd_read à ide_atapi_cmd_read_pio
· 

· 

· IDE/AHCI

· AHCI

1 4

AHCI----Command Table

FIS · Command TableFIS · AHCI6portportFISport · cmd_fis0x20000 · MMIOahci_mem_writePMIO · MMIO/PMIOMMIO
1 6

FIS · MMIOàPMIOlst0x20000Command Table · AHCI_PORT_REG_CMD_ISSUEFIS

· lst0x20000FIS feature

· AHCIfeature & 11B0

1 7

FIS · FIShandle_reg_h2d_fis · AHCI_PORT_REG_CMD/CMD_ISSUEcheck_cmdàhandle_cmdFIS

· FIShandle_reg_h2d_fiside_state

IDE

1 8

IDE · handle_reg_h2d_fisIDEide_exec_cmdIDE · IDEFISfis[2]

· ide_cmd_table

· Command TableWIN_PACKETCMD

· cmd_packetIDEATA_IOPORT_WR_COMMANDFIS

1 9

cmd_packetcmd_read · cmd_packetATAPIcmd_read

· cmd_read"buf"

· QEMU ld*_be_p 

· *l=long, w=word, u=unsigned, be=

· nb_sectors/lba

· sizesize



2 0

cmd_readide_atapi_cmd_read_pio ·  · cmd_readide_atapi_cmd_readide_atapi_cmd _read _pio · s->atapi_dmaFALSEpio · feature & 11B00
2 1

ide_atapi_cmd_reply_end ·  · 
· lba-1 · lcylhcylcylinder
· FIS0xfffe
2 2


2 3

 · pio_transfer · pio_transferdata_ptr · AHCI
2 4

......FISATAPI Solved Solved
Unsolved
2 5 PRDT

PRDT----ahci_pio_transfer · cur_cmdopts(options) · opts · ahci_dma_prepare_bufPRDT · sglist
·  · dma_buf_write/readsglist
2 6

sglist · Sglist (Scatter Gather List) · PRDTPRDT · PRDTsglist · base
2 7

AHCI · SATA6 · SATAAHCI6AHCIDevice
2 8


· io_buffer · DBAQEMU · portide_init1port · ASLR

io_buffer



ptr

2 9

 · opts

· PRDTDBA · DBAio_buffer ·  è 

 io_buffer



ptr

3 0

 · s->io_buffer130KBrealizeide_init1

· QEMUgap

· memcpygap

· gapheapport

3 1

---- · ahci_dma_ops
· 10AHCI8 · 8ASLR · AHCIset_inactive(#8)reset(#10) · resetIDE · AHCI/IDEresetIDE · 10.resetROP#1
3 2 · QEMUreset

 · /x86_64-softmmu/qemu-system-x86_64 -enable-kvm -m 2048
-device ich9-ahci,id=ahci -drive file=/home/leon/iso.iso,media=cdrom,if=none,id=mycdrom -device ide-cd,drive=mycdrom,bus=ahci.4 è  -hda /home/leon/disk.qcow2
· MMIOperiphery
· QEMU
3 3


3 4

 · QEMUCDlba-1 · CVE
3 5

QEMU ·  ·  ·  · PATCH · CVE-2020-14364

3 6

3 7


KCon 
MA N O E U VR E

