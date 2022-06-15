SESSION ID: CRYP-T12
Extending NIST's CAVP Testing of Cryptographic Hash Function Implementations
Nicky Mouha and Christopher Celi
National Institute of Standards and Technology (NIST)
#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

?

?? ? ? CRYPTANALYSIS

?

? ?? ?? ?

#RSAC
A Little Bit of History...

#RSAC

SHA-3 Competition Bugs
# submissions

no bug

found

27

bug

24

found

Round 1: 47% failed

9
5 Round 2: 36% failed

#RSAC
3 2 Final Round: 40% failed

#RSAC
Two Common Hash Function Interfaces

Hash(

Init();

Update(

);

Update(

Q: Where/when are they used?

);

); Update(

); Final();

#RSAC
BLAKE Bug
BLAKE-256: processes message in blocks of 64 bytes

< 64 bytes

Init();

Update(

);

Update(

= 64 bytes );

Final();

#RSAC
BLAKE Bug
BLAKE-256: processes message in blocks of 64 bytes

< 64 bytes

Init();

Update(

);

Update(

= 64 bytes );

"forgotten" due to bug

Final();

#RSAC
BLAKE Bug
BLAKE-256: processes message in blocks of 64 bytes

< 64 bytes

Init();

Update(

);

Update(

= 64 bytes );

"forgotten" due to bug

Final();

"second preimage" (modified message, same hash)

#RSAC
Real-World Impact?

#RSAC
Apple CoreCrypto: Hash Functions

CoreCrypto
­ Cryptographic module in all Apple devices
Vulnerability
­ Incorrect handling of long ( 4 GiB) messages
­ Affects 11/12 hash functions ­ Infinite loop

Algorithm MD2 MD4 MD5
RIPEMD-128 RIPEMD-160 RIPEMD-256 RIPEMD-320
SHA-1 SHA-224 SHA-256 SHA-384 SHA-512

Block size (in bytes) 16 64 64 64 64 64 64 64 64 64 128 128

Vulnerable            

Apple CoreCrypto: Vulnerable Code
Lines 75-87 of ccdigest_update() in ccdigest/src/ccdigest_update.c: // low-end processors are slow on division if (di->block_size == 1<<6) { // sha256
nblocks = len >> 6; nbytes = len & 0xFFFFffC0; } else if (di->block_size == 1<<7) { // sha512 nblocks = len >> 7; nbytes = len & 0xFFFFff80; } else { nblocks = len / di->block_size; nbytes = nblocks * di->block_size; }

#RSAC

Apple CoreCrypto: Updated (January 2020)
Lines 27-36 of ccdigest_update() in ccdigest/src/ccdigest_update.c:
if (di->block_size == 1<<6) { // md5 & sha1 & sha256 nblocks = len >> 6; nbytes = nblocks << 6;
} else if (di->block_size == 1<<7) { // sha384 & sha512 nblocks = len >> 7; nbytes = nblocks << 7;
} else { nblocks = len / di->block_size; nbytes = nblocks * di->block_size;
}

#RSAC

#RSAC
Apple CoreCrypto: Other Vulnerable Algorithms
HMAC Ed25519 SRP
­ strlen() on null-terminated string
ANSI X9.63 KDF
­ Not vulnerable due to range check ­ Source code comment: "ccdigest_update only supports 32-bit length"
...?

#RSAC
NIST to the Rescue...

#RSAC
Cryptographic Module Validation Program (CMVP)

Vendor
designs and produces

CST Lab
tests for conformance

CMVP (NIST & CCCS)
validates

User
specifies and purchases

CAVP: prerequisite for CMVP ACVP: protocol used by CAVP

#RSAC
Cryptographic Module Validation Program (CMVP)

Vendor
designs and produces

CST Lab
tests for conformance

CMVP (NIST & CCCS)
validates

User
specifies and purchases

CAVP: prerequisite for CMVP ACVP: protocol used by CAVP

ACVP JSON Format
Algorithm Functional Test (AFT) request: {
"msg": "BCE7", "len": 16 } AFT response (for SHA-224): { "md": "1FA29E9B23060562F9370453EF817E18C56AE844E5B85F2ED34B4B38" }

#RSAC

#RSAC
NIST SHAVS Document
"While the specification for SHA specifies that messages up to at least 264 - 1 bits are possible, these tests only test messages up to a limited size of approximately 100,000 bits. This is adequate for detecting algorithmic and implementation errors."
-- The Secure Hash Algorithm Validation System (SHAVS), NIST

Large Data Test (LDT)
LDT request: {
"largeMsg": { "content": "D6F7", "contentLength": 16, "fullLength": 34359738368, "expansionTechnique": "repeating" }
} LDT response (for SHA-224): {
"md": "BA94D02FBE63F0B858AFABF3F98AAED1CD9DE45A2D1120D661214EF1" }

#RSAC

#RSAC
Apply What You Have Learned Today
CVE: not end, but beginning
­ Usually: patch and forget ­ Better: avoid systematically
Discuss bugs in cryptography
­ Dive into your own experience ­ Talk to your colleagues
Reach out to us!

