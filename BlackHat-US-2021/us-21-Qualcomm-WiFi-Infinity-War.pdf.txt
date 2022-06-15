QUALCOMM Wi-FiINFINITY WAR
Haikuo Xie of Singular Security Lab
#BHUSA @BlackHatEvents

About Me
Haikuo Xie Senior security researcher at Singular Security Lab focus on the field of protocol and short-distance communication
#BHUSA @BlackHatEvents

Agenda
Qualcomm Wi-Fi Security Actuality Qualcomm Wi-Fi Architecture Wi-Fi Driver Security Research Wi-Fi Firmware Security Research Conclusion

#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Security Actuality
History 1.2017 Over The Air: Exploiting Broadcom's Wi-Fi Stack by Gal Beniamini 2.Blackhat USA 2019 Exploiting Qualcomm WLAN And Modem OverThe-Air 3.2020 An iOS zero-click radio proximity exploit odyssey by Ian Beer
#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Security Actuality
Relatively good security Actuality

https://github.co m/MiCode/vend or_qcom_openso urce_wlan/blob/c as-q-oss/qcacld3.0/core/mac/src /sys/legacy/src/u tils/src/dot11f.c# L288
#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Security Actuality
Relatively good security Actuality

https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld2.0/tree/CORE/SYS/legacy/src/utils/src/dot11f.c

#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Security Actuality
There are still great security risks 0-click adjacent network non-privileged
#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Architecture
Snapdragon 845
Integrated Snapdragon X20 LTE modem to support latest air interfaces including 5x CA up to 1.2 Gbps Wi-Fi 802.11ac and Bluetooth 5.0 with the Qualcomm® WCN3990 device

#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Architecture
Snapdragon 865
Snapdragon X55 5G Modem-RF System Qualcomm® FastConnect 6800 Subsystem Wi-Fi & Bluetooth with the Qualcomm qca6390 device

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
Driver Architecture This part belongs to the open source software of Qualcomm

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
CVE-2020-11225

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
CVE-2020-11225

scm_is_rsn_security

https://source.codeaurora.org/quic/qsdk/platform/ve ndor/qcom-opensource/wlan/qca-Wi-Fi-hostcmn/commit/?id=fe1e85068c57d8c4e4557ed6b265 ac6b9694c3a1
#BHUSA @BlackHatEvents

Wi-Fi Driver Security
CVE-2020-3698

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
CVE-2020-3698 POC

#BHUSA @BlackHatEvents

Wi-Fi Driver Security CVE-2020-3698

the vulnerability code in sme_api.c

hddWmmDscpToUpMap in wlan_hdd_main.h
8. Wi-Fi_HDD_MAX_DSCP in wlan_hdd_wmm.h
https://source.codeaurora.org/quic/la/platform/ve ndor/qcom-opensource/wlan/qcacld3.0/commit/?id=df541cea94d83533ff8f34a9b8ae 77964788b1c7
#BHUSA @BlackHatEvents

Wi-Fi Driver Security

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
New born vulnerability CVE-2021-1955
#BHUSA @BlackHatEvents

Wi-Fi Driver Security
CVE-2021-1955

#BHUSA @BlackHatEvents

Wi-Fi Driver Security
Qualcomm mitigation Qualcomm Wi-Fi driver used stack cookieheap cookieKASLR W^XCFI
#BHUSA @BlackHatEvents

Qualcomm Wi-Fi Security research trends
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Qualcomm Wi-Fi firmware of SDM845 /vendor/firmware/wlanmdsp.mbn modemuw.jsn :SDM845 modem configuration

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Snapdragon 865 firmware /vendor/firmware_mnt/image/amss20.bin
bdf: board data file cnss: connectivity subsystem
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Snapdragon 865 Wi-Fi firmware loading process
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Qualcomm Subsystem e.g.
MODEM GPU LPASS VENUS WCNSS ......

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
SSR:Subsystem restart /sys/bus/msm_subsys/devices/subsysx/restart_level "related": enable SSR, only the subsystem will be restarted when the subsystem is abnormal, and the main system and other subsystems will not be affected. ramdump of the subsystem will be collected "system" Disable SSR, the main system restarts, and ramdump will not be collected
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Get ramdump
echo 1 > /sys/module/subsystem_restart/parameters/enable_ramdumps echo 1 > /sys/module/subsystem_restart/parameters/enable_debug echo 1 > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps subsystem_ramdump 1 When subsystem crash occursramdump file(ramdump_wlan_*.elfwill be generated in /data/vendor/ramdump
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Qualcomm hexagon arg1:R0 arg2:R1 arg3:R2 ret:R0
https://developer.qualcomm.com/qfile/67415/80-n204042_a_qualcomm_hexagon_v66_programmer_reference_manual.pdf https://developer.qualcomm.com/qfile/67417/80-n204045_b_qualcomm_hexagon_v67_programmer_reference_manual.pdf

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Firmware extraction amss20.bin is the Wi-Fi firmware of qca639x

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security

Firmware extraction Architecture of amss20.bin :

ARM QUALCOMM DSP6 Processor

Old elf machine field of amss20.bin
New elf machine field of amss20.bin
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Firmware symbol
wlanmdsp.mbn of snapdragon 845

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Firmware symbol
amss20.bin of Snapdragon 865

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Firmware exception capture crash_count the number of subsystem crash crash_reason: the last reason of subsystem crash echo "system" > restart_level
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Wlan    packet

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Finding vulnerabilities in Wi-Fi firmware
#BHUSA @BlackHatEvents

Wi-Fi Firmware Security

Finding vulnerabilities in Wi-Fi firmware

CVE-ID CVE-2021-1925 CVE-2021-1937

Device SDM865 SDM865

CVE-2021-1938

SDM865

CVE-2021-1907

SDM865

CVE-2021-1953

SDM670

Disclosure time 2021.5 2021.6 2021.7 2021.7 2021.7

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
CVE-2021-1937

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
CVE-2021-1937
rcGetLowestValidTxMcsForBW

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
New vulnerability in Wi-Fi firmware CVE-2021-1925

wlan_txbfee_parse_gid

sdm865 wlan_mgmt_rx_frame_handler

sdm845 wlan_mgmt_rx_frame_handler
#BHUSA @BlackHatEvents

wlan_txbfee_parse_gid

CVE-2021-1925

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
CVE-2021-1925

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Qualcomm Wi-Fi firmware mitigation Stack cookieHeap cookie, W^X No ASLR,CFI

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
New features and functions make WLAN drivers and firmware constantly changing. Code refactoring

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
New features and functions make WLAN drivers and firmware constantly changing. Code refactoring

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Analyze firmware memory ramdump_wlan.elf, It contains the memory of Wi-Fi heap block and code in RAM are mixed together 0xa1000000--0xa15e0000 0xa5980000--0xa6300000

#BHUSA @BlackHatEvents

Wi-Fi Firmware Security
Analyze firmware memory

#BHUSA @BlackHatEvents

Future work
Find memory write vulnerabilities in the firmware Research new features Optimize debugging method
#BHUSA @BlackHatEvents

Conclusion
There are still great risks in the security of Wi-Fi driver, but the mitigation make the attack more difficult The security of Wi-Fi firmware is weaker and more and more attention has been paid to it The vulnerability cannot be completely eliminated, and the research on Wi-Fi security is a continuous process
#BHUSA @BlackHatEvents

Thanks

#BHUSA @BlackHatEvents

