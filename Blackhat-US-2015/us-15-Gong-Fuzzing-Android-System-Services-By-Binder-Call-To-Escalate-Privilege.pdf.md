Fuzzing Android System Services by Binder Call
to Escalate Privilege
Guang Gong Security Reacher
Qihoo 360 Twitter &Weibo:@oldfresher
Black Hat USA 2015

Agenda
· Android Binder mechanism · The attack surface · Fuzz Android System Services · The Found vulnerabilities · exploit CVE-2015-1528

Android Binder Mechanism

Attack Surface

First-level Interfaces
ggong@ggong-pc:~/develop/aosp/lol51$ adb shell service list Found 97 services: 0 sip: [android.net.sip.ISipService] 1 phone: [com.android.internal.telephony.ITelephony] 2 isms: [com.android.internal.telephony.ISms] 3 iphonesubinfo: [com.android.internal.telephony.IPhoneSubInfo] 4 simphonebook: [com.android.internal.telephony.IIccPhoneBook] 5 isub: [com.android.internal.telephony.ISub] 6 nfc: [android.nfc.INfcAdapter] ...... 81 activity: [android.app.IActivityManager] 82 user: [android.os.IUserManager] 83 package: [android.content.pm.IPackageManager] 89 media.camera: [android.hardware.ICameraService] 90 media.player: [android.media.IMediaPlayerService] 91 SurfaceFlinger: [android.ui.ISurfaceComposer] 96 android.security.keystore: [android.security.keystore]

Second-level Interfaces
class IMediaPlayerService: public IInterface { public:
DECLARE_META_INTERFACE(MediaPlayerService);

virtual sp<IMediaRecorder> createMediaRecorder() = 0;

virtual sp<IMediaMetadataRetriever> createMetadataRetriever() = 0;

virtual sp<IMediaPlayer> create(const sp<IMediaPlayerClient>& client,

int audioSessionId = 0) = 0;

virtual sp<IOMX>

getOMX() = 0;

virtual sp<ICrypto> makeCrypto() = 0;

virtual sp<IDrm>

makeDrm() = 0;

virtual sp<IHDCP>

makeHDCP(bool createEncryptionModule) = 0;

virtual sp<IMediaCodecList> getCodecList() const = 0;

virtual sp<IRemoteDisplay> listenForRemoteDisplay(const

sp<IRemoteDisplayClient>& client,

const String8& iface) = 0;

...

};

Chrome sandbox
· Chrome sandbox in Android
shell@hammerhead:/ $ ps -Z | grep chrome u:r:untrusted_app:s0 u0_a52 com.android.chrome u:r:untrusted_app:s0 u0_a52 com.android.chrome:privileged_process0 u:r:isolated_app:s0 u0_i0 com.android.chrome:sandboxed_process0
· public static void addService(String name, IBinder service, boolean allowIsolated)

Chrome sandbox
(gdb) plist svclist next 0xb6c4be38: u"activity"
$2569 = {next = 0xb6c50100, handle = 16, allow_isolated = 1, name = 0xb6c4be38}
0xb6c50118: u"user"
$2570 = {next = 0xb6c500d8, handle = 15, allow_isolated = 0, name = 0xb6c50118}
0xb6c500f0: u"package"
$2571 = {next = 0xb6c500b0, handle = 14, allow_isolated = 0, name = 0xb6c500f0}
0xb6c500c8: u"display"
$2572 = {next = 0xb6c50088, handle = 11, allow_isolated = 1, name = 0xb6c500c8}

Weakness

Comparison

The simplest Fuzzer

Confirmed Vulnerabilities

CVEs CVE-2015-1474 CVE-2015-1528 CVE-2015-1525 CVE-2015-1530 CVE-2015-1529 CVE-2015-1527 CVE-2015-1526 CVE-2015-1537

Android Bug ID 18076253 19334482 18262893 18226810 19385640 19261727
20222489

Vulnerability Description
A local application could escalate privileges to system due to an integer overflow in the GraphicBuffer class
Integer Overflow in Android libcutils can be exploited to get system_server permission
A local application could cause a denial-of-service to the audio_policy app
An integer overflow in Android media could be exploited to get media_server permission
Integer overflow could cause a denial-of-service to SoundTriggerHwService
Integer overflow leading to heap corruption in IAudioPolicyService.cpp
A local application could cause a denial-of-service to media_server
A local application could escalate privileges to media_server due to an integer overflow in IHDCP

CVE-2015-1530

CVE-2015-1525

CVE-2015-1474

CVE-2015-1528
Android 5.1

CVE-2015-1528

Privilege escalation step by step

Difficulties

· Exploit heap corruption by binder call

Obstacle

Solution

Thread pool for processing requests
ASLR

Hang N-1 threads Leak information

Can only corrupt continuous memory
DEP

Overwrite je_malloc meta-data ROP

Can't load SO because of Selinux restriction
execmem, execmod

Load so from memory ?

A feature of Je_malloc
· different threads allocate memory in different chunks
Chunks' distribution in je_malloc

Thread pool for processing requests
· Control the count of Binder threads for heap feng shui
binder server threads in mediaserver

Hang N-1 threads
· BufferQueue
­ IGraphicBufferProducer
· setBufferCount · attachBuffer · requestBuffer
­ IGraphicBufferConsumer
· system_server, surfaceflinger and mediaserver all use BufferQueue.

Stack back trace of the blocked thread

Leak heap content
· IGraphicBufferProducer->requestBuffer


Leak heap content

Address leaking
· Leak address of heap
­ Search heap points in the leaked heap content
· Leak address of modules
­ Search function points
· Leak address of stack
­ Search pthread_internal_t structrue

Leak address of stack
· pthread_internal_t

write arbitrary addresses
 There is a point table for every size class
(gdb) p je_small_bin2size_tab $24 = {8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448, 512, 640, 768, 896, 1024, 1280, 1536, 1792, 2048, 2560, 3072, 3584}
 The structure of a point table
(gdb) p je_arenas[0].tcache_ql.qlh_first.tbins[11] $9 = {tstats = {nrequests = 17}, low_water = 62, lg_fill_div = 1, ncached = 63, avail = 0xb6003f60}
 The point table for size 128 bytes
(gdb) x/63xw je_arenas[0].tcache_ql.qlh_first.tbins[11].avail 0xb6003f60: 0xb6057f80 0xb6057f00 0xb6057e80 0xb6057e00 0xb6003f70: 0xb6057d80 0xb6057d00 0xb6057c80 0xb6057c00 0xb6003f80: 0xb6057b80 0xb6057b00 0xb6057a80 0xb6057a00 0xb6003f90: 0xb6057980 0xb6057900 0xb6057880 0xb6057800 0xb6003fa0: 0xb6057780 0xb6057700 0xb6057680 0xb6057600

Bypass SElinux's restriction
· ROP to library code

Shell
· Get a shell of attacked process after exploiting successfully

Privilege escalation step by step

PoC
· https://github.com/secmob/PoCForCVE-20151528

