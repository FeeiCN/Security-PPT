Fuzzing Binder for Fun and Profit ­ sharing version
Flanker @ KEEN Weibo&Wechat: @flanker_017
And of course, exploit it!

11/23/2015

KEEN TEAM

1

Agenda
· What's Binder? · How is Binder working in Android? · Profit for attacking Binder · 0day Vuln and EXP (CVE-2015-6612 and 6 CVE-2015-Google-you-
know-but-won't-tell-me-until-bulletin-release)! · Note: this version of PPT obscures 0day content because the fix for
the vulnerability talked has not yet been publicly released.

11/23/2015

KEEN TEAM

2

Hmm, about me...

· Security Researcher at KEEN
· mainly focusing on system security, vulnerability exploitation
· Android Security Acknowledgements(Nexus Bulletin)
· CVE-2015-3854,3855,3856, 6612, xxx (more upcoming!)
· Previously work on Android application security
· Reported for Twitter, Slack, Tencent, Baidu, Alibaba, Sogou, etc...
· Previous CTF active participant
· DEFCON 21 CTF Final at Las Vegas as Blue-lotus
· Pwned Qiku at GeekPwn 2015!
· LOL, Where is my BMW?

11/23/2015

KEEN TEAM

3

So what's `fun' and `profit'?
· FUN!

11/23/2015

KEEN TEAM

4

So what's `fun' and `profit'?
· FUN!

11/23/2015

KEEN TEAM

5

So what's `fun' and `profit'?
· Profit!

11/23/2015

KEEN TEAM

And more...
6

Binder in Android

· Binder is the core mechanism for inter-process communication
· At the beginning called OpenBinder
· Developed at Be Inc. and Palm for BeOS
· Removed SystemV IPCs
· No semaphores, shared memory segments, message queues · Note: still have shared mem impl
· Not prone to resource leakage denial-of-service
· Not in POSIX implementations
· Merged in Linux Kernel at last

11/23/2015

KEEN TEAM

7

Binder in Android - Advantages (cont.)

· Build-in reference-count of object
· By extending RefBase
· Death-notification mechanism
· Share file descriptors across process boundaries · AshMem is passed via writeFileDescriptor · The mediaserver plays media via passed FD
· Supports sync and async calls
· Async: start an activity, bind a service, registering a listener, etc · Sync: directly calling a service

11/23/2015

KEEN TEAM

8

Key of the heart: IBinder

· IBinder.java holds 32-bit integer token as "mHandle"
· Unique across all processes · Used also as an identity
· E.g WindowToken, WakeLock
· When calling a remote service (e.g. Crypto)
· Remote service is identified through token · Then constructed as BpBinder by local calling client code · Then constructed BpInterface<ICrypto> via asInterface(IBinder*)
· new BpCrypto: public BpInterface<ICrypto>
· ICrypto is abstract business-logic-style interface-style class
· BpInterface combines ICrypto with BpRefBase by multiple inheritance

11/23/2015

KEEN TEAM

9

Key of the heart: IBinder (cont.)

· When a transaction is made, the binder token is written together with transaction command and data using ioctl to /dev/binder
· Binder driver queries the mapping of BinderToken<->BinderService, relay command to appropriate service
· BBinder implementation (usually BnInterface<XXX>)'s onTransact processes incoming data
· Yarpee! Memory Corruption often occurs here!
· Example: BnCrypto is server-side proxy
· "Crypto" is actually server internal logic

11/23/2015

KEEN TEAM

10

class ICrypto : public IInterface {
This makes you more comfortable  public: DECLARE_META_INTERFACE(Crypto);
BpInterface
BnInterface

11/23/2015

KEEN TEAM

11

class ICrypto : public IInterface {
This makes you more comfortable  public: DECLARE_META_INTERFACE(Crypto);
BpInterface
BnInterface

11/23/2015

KEEN TEAM

12

class ICrypto : public IInterface {
This makes you more comfortable  public: DECLARE_META_INTERFACE(Crypto);
BpInterface
BnInterface

11/23/2015

KEEN TEAM

13

class ICrypto : public IInterface {
This makes you more comfortable  public: DECLARE_META_INTERFACE(Crypto);
BpInterface
BnInterface

struct Crypto : public BnCrypto

11/23/2015

KEEN TEAM

14

Conclusion
· BpXXXService holds client calling conversion
· Param types · Param counts
· BnXXXService holds server transaction logic · XXXService implements XXXService
· Business logic here

11/23/2015

KEEN TEAM

15

Example: Binder call in CVE-2015-6612

status_t st;
sp<ICrypto> crypto = interface_cast<IMediaPlayerService>(defaultServiceManager()>getService(String16("media.player")))->makeCrypto();
sp<IDrm> drm = interface_cast<IMediaPlayerService>(defaultServiceManager()>getService(String16("media.player")))->makeDrm(); Vector<uint8_t> sess;
st = drm->createPlugin(kClearKeyUUID);

Question: How many binder calls in this snippet?

11/23/2015

KEEN TEAM

16

CVE-2015-6612: Heap overflow in media_server (clearkeydrm::CryptoPlugin::decrypt)
· Reported by me and WenXu at August · Fixed in November bulletin · Call chain:
· BnCrypto::onTransact · Clearykey/CryptoPlugin::decrypt
· Credit from Google

11/23/2015

KEEN TEAM

17

95 virtual ssize_t decrypt(

96

bool secure,

97

const uint8_t key[16],

98

const uint8_t iv[16],

99

CryptoPlugin::Mode mode,

100

const void *srcPtr,

101

const CryptoPlugin::SubSample *subSamples, size_t numSubSamples,

102

void *dstPtr,

103

AString *errorDetailMsg) {

104 Parcel data, reply;

105 data.writeInterfaceToken(ICrypto::getInterfaceDescriptor());

106 data.writeInt32(secure);

107 data.writeInt32(mode);

109 static const uint8_t kDummy[16] = { 0 };

111 if (key == NULL) {

112

key = kDummy;

113 }

114

115 if (iv == NULL) {

116

iv = kDummy;

117 }

119 data.write(key, 16);

120 1d1a/2t3a/2.w015rite(iv, 16);

KEEN TEAM

BpInterface Part (The intended logic)
18

122 size_t totalSize = 0;

123 for (size_t i = 0; i < numSubSamples; ++i) {

Recall TAOSVA

124

totalSize += subSamples[i].mNumBytesOfEncryptedData;

"Two loose variables"

125

totalSize += subSamples[i].mNumBytesOfClearData;

126 }

128 data.writeInt32(totalSize);//0ops

129 data.write(srcPtr, totalSize);

131 data.writeInt32(numSubSamples);

132 data.write(subSamples, sizeof(CryptoPlugin::SubSample) * numSubSamples);//0ops

133

134 if (secure) {

135

data.writeInt64(static_cast<uint64_t>(reinterpret_cast<uintptr_t>(dstPtr)));

136 }

137

138 remote()->transact(DECRYPT, data, &reply);

139

11/23/2015

KEEN TEAM

19

CVE-2015-6612: (cont.)

case DECRYPT:

235 {

236

CHECK_INTERFACE(ICrypto, data, reply);

237

238

bool secure = data.readInt32() != 0;

BnInterface Part

239

CryptoPlugin::Mode mode = (CryptoPlugin::Mode)data.readInt32();

(The un-intended logic)

240

241

uint8_t key[16];

242

data.read(key, sizeof(key));

243

244

uint8_t iv[16];

245

data.read(iv, sizeof(iv));

246

247

size_t totalSize = data.readInt32(); //assumption that totalSize is sum(subSamples), really?

248

void *srcData = malloc(totalSize);

249

data.read(srcData, totalSize);

250

11/23/2015

KEEN TEAM

20

251

int32_t numSubSamples = data.readInt32();

252

253

CryptoPlugin::SubSample *subSamples =

254

new CryptoPlugin::SubSample[numSubSamples];

255

256

data.read(

257

subSamples,

258

sizeof(CryptoPlugin::SubSample) * numSubSamples);

259

260

void *dstPtr;

261

if (secure) {

262

dstPtr = reinterpret_cast<void *>(static_cast<uintptr_t>(data.readInt64()));

263

} else {

264

dstPtr = malloc(totalSize);

265

}

266

267

AString errorDetailMsg;

268

ssize_t result = decrypt(secure, key, iv, mode, srcData, subSamples, numSubSamples,

275

dstPtr,

276

&errorDetailMsg);//This can/only be resolved to ClearKeyPlugin on AOSP

11/23/2015

KEEN TEAM

21

35 ssize_t CryptoPlugin::decrypt(bool secure, const KeyId keyId, const Iv iv,

36

Mode mode, const void* srcPtr,

37

const SubSample* subSamples, size_t numSubSamples,

38

void* dstPtr, AString* errorDetailMsg) {

39 if (secure) {

40 errorDetailMsg->setTo("Secure decryption is not supported with "

41

"ClearKey.");

42 return android::ERROR_DRM_CANNOT_HANDLE;

43 }

44

45 if (mode == kMode_Unencrypted) {

46 size_t offset = 0;

47 for (size_t i = 0; i < numSubSamples; ++i) {

48

const SubSample& subSample = subSamples[i];

49

58

memcpy(reinterpret_cast<uint8_t*>(dstPtr) + offset,

59

reinterpret_cast<const uint8_t*>(srcPtr) + offset,

60

subSample.mNumBytesOfClearData); //mNumBytesOfClearData is controllable

61

offset += subSample.mNumBytesOfClearData;

11/23/2015

KEEN TEAM

22

· F libc : Fatal signal 11 (SIGSEGV), code 2, fault addr 0xb6083000 in tid 5180 (mediaserver)

· F DEBUG : *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

· F DEBUG : Build fingerprint: 'google/shamu/shamu:6.0/MPA44I/2172151:user/release-keys'

· W NativeCrashListener: Couldn't find ProcessRecord for pid 5180

· F DEBUG : Revision: '0'

· F DEBUG : ABI: 'arm'

· E DEBUG : AM write failed: Broken pipe

· F DEBUG : pid: 5180, tid: 5180, name: mediaserver >>> /system/bin/mediaserver <<<

· F DEBUG : signal 11 (SIGSEGV), code 2 (SEGV_ACCERR), fault addr 0xb6083000

· F DEBUG : r0 b47a4a00 r1 b6083000 r2 ffffcfbf r3 00000000

· F DEBUG : r4 00000000 r5 b343ab14 r6 00000000 r7 b6080000

· F DEBUG : r8 00000001 r9 b47a1a00 sl b343ab10 fp 00000000

· F DEBUG : ip b2c73dbc sp be9da748 lr b2c6e79f pc b69e0656 cpsr a00f0030

· F DEBUG :

· F DEBUG : backtrace:

· F DEBUG : #00 pc 00017656 /system/lib/libc.so (__memcpy_base+77)

· F DEBUG : #01 pc 0000479b /system/vendor/lib/mediadrm/libdrmclearkeyplugin.so (clearkeydrm::CryptoPlugin::decrypt(bool, unsigned char const*, unsigned char const*, android::CryptoPlugin::Mode, void const*, android::CryptoPlugin::SubSample const*, unsigned int, void*, android::AString*)+66)

· F DEBUG : #02 pc 0003de29 /system/lib/libmediaplayerservice.so (android::Crypto::decrypt(bool, unsigned char const*, unsigned char const*, android::CryptoPlugin::Mode, android::sp<android::IMemory> const&, unsigned int, android::CryptoPlugin::SubSample const*, unsigned int, void*, android::AString*)+88)

· F DEBUG : #03 pc 000681bf /system/lib/libmedia.so (android::BnCrypto::onTransact(unsigned int, android::Parcel const&, android::Parcel*, unsigned int)+698)

· F DEBUG : #04 pc 000198b1 /system/lib/libbinder.so (android::BBinder::transact(unsigned int, android::Parcel const&, android::Parcel*, unsigned int)+60)

· F DEBUG : #05 pc 0001eb93 /system/lib/libbinder.so (android::IPCThreadState::executeCommand(int)+542)

· F DEBUG : #06 pc 0001ece9 /system/lib/libbinder.so (android::IPCThreadState::getAndExecuteCommand()+64)

· F DEBUG : #07 pc 0001ed4d /system/lib/libbinder.so (android::IPCThreadState::joinThreadPool(bool)+48)

· F DEBUG : #08 pc 00001bbb /system/bin/mediaserver

· F DEBUG : #09 pc 00017359 /system/lib/libc.so (__libc_init+44)

· F DEBUG11: /2#31/020p1c500001e0c /system/bin/mediaserver

KEEN TEAM

23

Heap of Mediaserver

Chunk(data passe in)

Chunk

mNumOfClearBytes Offset

Chunk (allocated)

Chunk

mNumOfClearBytes Offset

Chunk

11/23/2015

KEEN TEAM

24

POC

11/23/2015

KEEN TEAM

25

Thoughts

· Disclose timeline
· Initial report: 2015.8 · Google asked for poc, said couldn't reproduce on clusterfuzz
· ClusterFuzz uses M, which changes interface a bit · M close source at that time · ABI incompatible
· Reversed the M image
· worked several days for a M exploit
· Finally triaged on Sep · Fixed at October · Advisory published at November
· Not very trivial to exploit

11/23/2015

KEEN TEAM

26

0DAY TIME!

11/23/2015

KEEN TEAM

27

00DDAAYYTTIIMMEE!! Out-of-bound

dereference

in xxxxxxx Omitted for public PPT because the vulnerability has

not yet been publicly fixed

11/23/2015

KEEN TEAM

28

Firstly...
· Modern exploitation needs infoleak · And we have plenty
· Let's use the simplest and patched one  · Responsible disclosure!

11/23/2015

KEEN TEAM

29

Hey! Unneeded &! CVE-2015-6596
case LIST_AUDIO_PORTS: { CHECK_INTERFACE(IAudioFlinger, data, reply); unsigned int num_ports = data.readInt32(); struct audio_port *ports = (struct audio_port *)calloc(num_ports, sizeof(struct audio_port)); status_t status = listAudioPorts(&num_ports, ports); reply->writeInt32(status); if (status == NO_ERROR) { reply->writeInt32(num_ports); reply->write(&ports, num_ports * sizeof(struct audio_port)); } free(ports); return NO_ERROR;
} break;

Allow us to leak up to any length on stack (until you hit the boundary), including libc address and libaudioplayerservice

11/23/2015

KEEN TEAM

30

POC on LMY48I

11/23/2015

KEEN TEAM

31

Secondly...
· The real journey of our 0-day vulnerability begins.

11/23/2015

KEEN TEAM

32

Omitted for public PPT because the vulnerability has not yet been publicly fixed Omitted for public PPT because the vulnerability has not yet been publicly fixed
Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

33

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

34

Hmm?...

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

35

POC

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

36

F libc : Fatal signal 11 (SIGSEGV), code 1, fault addr 0x84 in tid 1238 (Binder_2) I SELinux : SELinux: Loaded file_contexts contexts from /file_contexts. F DEBUG : *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** F DEBUG : Build fingerprint: 'google/shamu/shamu:6.0/MPA44I/2172151:user/release-keys' F DEBUG : Revision: '0' F DEBUG : ABI: 'arm'
Exploitable??? WNativeCrashListener: Couldn'tfind ProcessRecord for pid 376
F DEBUG : pid: 376, tid: 1238, name: Binder_2 >>> /system/bin/mediaserver <<< F DEBUG : signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0x84 F DEBUG : r0 00000080 r1 b2e817ac r2 00000025 r3 b2e817ac E DEBUG : AM write failed: Broken pipe

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

37

Exploitability Analysis

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

38

Omitted for public PPT because the vulnerability has not yet been publicly fixed

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

39

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

40

Strong Pointer

58 template<typename T>

59 class sp {

60 public:

61

inline sp() : m_ptr(0) { }

62

63

sp(T* other);

64

sp(const sp<T>& other);

65

template<typename U> sp(U* other);

66

template<typename U> sp(const sp<U>& other);

67 private:

104 T* m_ptr;

11/23/2015

KEEN TEAM

41

Strong Pointer (cont.)

119 template<typename T>

120 sp<T>::sp(const sp<T>& other)

121

: m_ptr(other.m_ptr) {

122

if (m_ptr)

123

m_ptr->incStrong(this); //is it exploitable? how to reach here?

124 }

125

126 template<typename T> template<typename U>

127 sp<T>::sp(U* other)

128

: m_ptr(other) {

129

if (other)

130

((T*) other)->incStrong(this);

131 }

11/23/2015

KEEN TEAM

42

Watch out for copy constructors!
· Returned struct is created by caller, passed it as R0 to callee in ARM
· We will see it later
Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

43

RefBase incStrong: control the vtable!

322 void RefBase::incStrong(const void* id) const

323{

324 weakref_impl* const refs = mRefs;

325 refs->incWeak(id);

326

327 refs->addStrongRef(id);

328 const int32_t c = android_atomic_inc(&refs->mStrong);

329 ALOG_ASSERT(c > 0, "incStrong() called on %p after last strong ref", refs);

330#if PRINT_REFS

331 ALOGD("incStrong of %p from %p: cnt=%d\n", this, id, c);

332#endif

333 if (c != INITIAL_STRONG_VALUE) {

334

return;

335 }

336

337 android_atomic_add(-INITIAL_STRONG_VALUE, &refs->mStrong);

338 refs->mBase->onFirstRef();

339}

340

RefBa1s1e/2*3/c20o1n5 st mBase;

KEEN TEAM

44

Assembly will tell you
Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

45

11/23/2015

KEEN TEAM

46

11/23/2015

KEEN TEAM

· R0 is retrieved from an offset we control · LDR R0, [R0, index, LSL#2] · in itemAt function
· Then passed to incStrong · refs = [R0 + 4] · prepare mStrong([refs]) == INIT_STRONG_VALUE
· Control PC at BX R1! · R1 = [R1 + 8] = [[R0]+8] = [[refs+4] + 8]
· You may think of 7911
Finally PC control!
47

What do we have, and whRa0t=to[R0ar+chieve

Omitted for public PPT because the vulnerability has not yet been publicly fixed

4]

R0 = [R0 + 8]

R1=[R0]

R1 = [R1 + 8]

BLX R1

11/23/2015

KEEN TEAM

48

What do we have, Omitted for public PaPTnd whRa0t=to[R0ar+chieve

because the vulnerability has not yet been publicly

4]

fixed

R0 = [R0 + 8]

R1=[R0]

R1 = [R1 + 8]

BLX R1

11/23/2015

KEEN TEAM

49

What do we have, and what to archieve
· We have control of R0 value in a predicable range (0x1000) at first dereference by adjusting spraying chunk size
· After first step we know what R0 is, but don't know where it is
· We can spray any size of any content
· However we do not know where sprayed address is

11/23/2015

KEEN TEAM

50

We still need heap fengshui

· Which interface is used to spray?
· IDrm->provideKeyResponse(uint8_t*, uint8_t* payload, uint8_t) · The resp can be passed in via base64-format
· Allow for non-asci data
· Stored in mMap of IDrm, no free/GC
· How to prepare memory?
· Make first deref fall on a fixed address, i.e. 0x80808080
· Allow an offset of 0x1000 xxx Om·itteTdurfnoritpiunbtolicaPsPtTatbice-caadudseretshse-dveurlenfermabeimlitoyrhyasspnroayt ypertobbeleemn publicly fixed
· Binder transaction has a maximum spray size of 1MB
· Continuously push large allocations until it reach allocation at 0x80000000 region

11/23/2015

KEEN TEAM

51

Fixed Addr Chunk (filled with 0x80808080)

LOW

STATIC_ADDR + GADGET_ADDR_OFFSET

STATIC_ADDR + GADGET_ADDR_OFFSET - 4

Dereference STATIC_ADDR STATIC_ADDR + GADGET_ADDR_OFFSET - 8 will give you

GADGET_ADDR_OFFSET

GAD...GET_ADDR.

= CHUNK_BUFFER_SIZE

i.e. [STATIC_AD... DR]=GADGET_ADDR STATIC_ADDR + 4

11/23/2015

0x10000000 ( INIT_STRONG_VALUE) 0xdeadbeef(placeholder, just not 0)
0x80808080 (STATIC_ADDR) TARGET_PC_ADDR (e.g. 0xcccccccc)
KEEN TEAM

GADGET_ADDR
HIGH
52

SPRAY_BEGIN_ADDR 0x80808080 (STATIC_ADDR)
11/23/2015

Fixed Addr Chunk (filled with 0x80808080)
STATIC_ADDR + GADGET_ADDR_OFFSET
STATIC_ADDR + GADGET_ADDR_OFFSET - 4
STATIC_ADDR + GADGET_ADDR_OFFSET - 8
...
...
STATIC_ADDR + 4 0x10000000 ( INIT_STRONG_VALUE) 0xdeadbeef(placeholder, just not 0)
0x80808080 (STATIC_ADDR) TARGET_PC_ADDR
KEEN TEAM

LOW
GADGET_ADDR_OFFSET = CHUNK_BUFFER_SIZE
GADGET_ADDR HIGH
53

SPRAY_BEGIN_ADDR
0x80808080 (STATIC_ADDR) Notice the difference is also GADGET_ADDR_OFFSET ­ 4*N
11/23/2015

Fixed Addr Chunk (filled with 0x80808080)
STATIC_ADDR + GADGET_ADDR_OFFSET
STATIC_ADDR + GADGET_ADDR_OFFSET - 4
STATIC_ADDR + GADGET_ADDR_OFFSET ­ 8
...
...
STATIC_ADDR + 4 0x10000000 ( INIT_STRONG_VALUE) 0xdeadbeef(placeholder, just not 0)
0x80808080 (STATIC_ADDR) TARGET_PC_ADDR
KEEN TEAM

LOW
GADGET_ADDR_OFFSET = CHUNK_BUFFER_SIZE
GADGET_ADDR HIGH
54

Let's prove it
· GADG_BUF_ADDR = SPRAY_BEGIN_ADDR + GADG_BUF_OFFSET · STATIC_ADDR = SPRAY_BEGIN_ADDR + 4N · [STATIC_ADDR] = [SPRAY_BEGIN_ADDR + 4N]
· = STATIC_ADDR + GADG_BUF_OFFSET - 4N // (refer to graph) · = SPRAY_BEGIN_ADDR + 4N + GADG_BUF_OFFSET ­ 4N · = SPRAY_BEGIN_ADDR + GADG_BUF_OFFSET · = GADG_BUF_ADDR

11/23/2015

KEEN TEAM

55

Let's prove it

· GADG_BUF_ADDR = SPRAY_BEGIN_ADDR + GADG_BUF_OFFSET
· STATIC_ADDR = SPRAY_BEGIN_ADDR + 4N
· [STATIC_ADDR] = [SPRAY_BEGIN_ADDR + 4N]
· = STATIC_ADDR + GADG_BUF_OFFSET - 4N · = SPRAY_BEGIN_ADDR + 4N + GADG_BUF_OFFSET ­ 4N · = SPRAY_BEGIN_ADDR + GADG_BUF_OFFSET · = GADG_BUF_ADDR
· [STATIC_ADDR + 4N] = GADG_BUF_ADDR ­ 4N
· [STATIC_ADDR - 4N] = GADG_BUF_ADDR + 4N

11/23/2015

KEEN TEAM

56

Omitted for public PPT because the vulnerability has
not yet been publicly fixed

R0 = [R0 + 4]
Then R0 = GADG_ADDR -4

R0 = [R0 + 8]
Then R0 = [GADG_ADDR+4]
=STATIC_ADDR

R1=[R0] Then R1 = GADG_ADDR

R1 = [R1 + 8]
Then R1 = [GADG_ADDR+8]
=OUR_PC

BLX R1

11/23/2015

KEEN TEAM

57

0x80808080 (STATIC_ADDR)
11/23/2015

Fixed Addr Chunk (filled with 0x80808080)
STATIC_ADDR + GADGET_ADDR_OFFSET
STATIC_ADDR + GADGET_ADDR_OFFSET - 4
STATIC_ADDR + GADGET_ADDR_OFFSET - 8
...
...
STATIC_ADDR + 4 0x10000000 ( INIT_STRONG_VALUE) 0xdeadbeef(placeholder, just not 0)
0x80808080 (STATIC_ADDR) TARGET_PC_ADDR
KEEN TEAM

LOW
GADGET_ADDR_OFFSET = CHUNK_BUFFER_SIZE
GADGET_ADDR HIGH
58

(gdb) x/40xw 0x80803000 0x80803000: 0x00000001 0x80803010: 0x80808080 0x80803020: 0x80808080 0x80803030: 0x80808080 0x80803040: 0x80808080 0x80803050: 0x80808080 0x80803060: 0x80808080 0x80803070: 0x80808080 0x80803080: 0x80808080 0x80803090: 0x80808080 ... (gdb) x/400xw 0x80804000 0x80804000: 0x80808080 0x80804010: 0x808b7080 0x80804020: 0x808b7070 0x80804030: 0x808b7060 0x80804040: 0x808b7050 0x80804050: 0x808b7040 0x80804060: 0x808b7030 0x80804070: 0x808b7020 0x80804080: 0x808b7010

0x00108018 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080
0x80808080 0x808b707c 0x808b706c 0x808b705c 0x808b704c 0x808b703c 0x808b702c 0x808b701c 0x808b700c

0x00000000 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080
0x80808080 0x808b7078 0x808b7068 0x808b7058 0x808b7048 0x808b7038 0x808b7028 0x808b7018 0x808b7008

0x00000000 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080 0x80808080
0x80808080 0x808b7074 0x808b7064 0x808b7054 0x808b7044 0x808b7034 0x808b7024 0x808b7014 0x808b7004

11/23/2015

KEEN TEAM

59

Performing ROP and shellcode mapping
· Due to time limit, will not elaborate here · Because of SELinux, mediaserver cannot load user-supplied dynamic
library and exec sh · One has to manually load a busybox/toolbox so into memory as
shellcode, and jump to it · Gong's exp on CVE-2015-1528 is a good example
· But is still a very time-consuming task.

11/23/2015

KEEN TEAM

60

I/DEBUG ( 0xcccccccc I/DEBUG ( I/DEBUG ( I/DEBUG ( I/DEBUG (

183): signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr

183): 183): 183): 183):

r0 80808080 r4 808b300c r8 b3a6bc1c ip b6db9d7c

r1 cccccccc r5 b5966ac0 r9 00000000 sp b3a6bbf8

r2 00000001 r6 b3a6bca4 sl 000003f5 lr b6c3bbbb

r3 808b3010 r7 b666686d fp 000000ba pc cccccccc

cpsr

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

61

ROP steps
· Point R7 to gadget_buffer · Exchange sp with R7, do stack pivot · Point R0 to gadget_buffer · POP PC, provide arguments for following function calls

11/23/2015

KEEN TEAM

62

ROP gadgets (on LMY48I Nexus 5)

Omitted for public PPT because the vulnerability has not yet been publicly fixed

11/23/2015

KEEN TEAM

63

Report timeline

· 2015.9.24
· Initial report
· 2015.9.27
· Google confirmed and assigned HIGH severity, AndroidID-24445127
· 2015.10.2
· Google fixed in internal master
· 2015.10.8
· 2500$ reward
· 2015.12.5
· Expected Credit and CVE assignment

11/23/2015

KEEN TEAM

64

Credits
· Wen Xu (@memeda) · http://researchcenter.paloaltonetworks.com/2015/01/cve-2014-
7911-deep-dive-analysis-android-system-service-vulnerabilityexploitation/

11/23/2015

KEEN TEAM

65

Questions?

11/23/2015

KEEN TEAM

66

Thanks!
If you are interested in working at bug hunting & binary exploitation in Linux, plz mail resume at i@flanker017.me 

11/23/2015

KEEN TEAM

67

