Constructing TI-Friendly Substitution Boxes using Shift-Invariant Permutations
Si Gao, Arnab Roy, and Elisabeth Oswald

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

#RSAC
Block Ciphers & Side Channel Protection
Component design (Sbox, diffusion layer etc.)
­ Strength against cryptanalysis ­ Implementation cost
Side channel protection
­ Not a metric, yet draw attention
o Bit-sliced masking: reducing the number of "AND2" o Threshold implementation (TI): "TI-friendly Sboxes"
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Threshold Implementation
A countermeasure that based on the MPC concept
­ Goal: cope with hardware glitches ­ Requirements
o Correct o Assigning each term (eg. ai)
to one of the "parties" (eg. f_i)
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Threshold Implementation
A countermeasure that based on the MPC concept
­ Goal: cope with hardware glitches ­ Requirements
o Non-complete o Ensure deg(f)<s, so that every term
uses at most s-1 shares
Presenter's Company Logo ­ replace or
delete on master slide

Threshold Implementation
A countermeasure that based on the MPC concept
­ Goal: cope with hardware glitches ­ Requirements
o Uniform o Add fresh randomness o Otherwise, no general constructions

#RSAC
Should be a valid share!

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
TI-friendly Designs
Diffusion Layer
­ For an s-share scheme, simply performing linear operation on each share
Sbox
­ Lower degree functions/decomposition
o Idea: less shares (s) save time/area o All 3*3/4*4 Sboxes up to affine equivalence [CHES 12] o 5-bit/ some 6-bit quadratic permutations [FSE 17, BFA18]
­ 8-bit Sbox constructions with smaller Sboxes
o Feistel/SPN/MISTY [CHES 16] o Other structures [SITB 17]
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Implementation perspective
Hardware
­ Main target
o Glitches etc.
­ Serial TI
o If f is "intrinsically" uniform, all "parties" (f1,...,fs) share the same functionality o Implement only f1, learn others by shifting shares [COSADE 13, 18]
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Implementation perspective
Software
­ Less discussed
o "Glitches" become less dreadful o Lost its competitive advantages in a restricted architecture
­ Why software-TI?
o Obscure internal operations  unexpected leakage o 1st order leakage in global look-up tables [COSADE 18'] o Security order reduction in Boolean masking [CARDIS 14]
Presenter's Company Logo ­ replace or
delete on master slide

Goal
"Constructing TI-friendly Sbox"
­ Considering SW platforms ­ Realistic implementations &
Security Evaluation ­ Meet cryptographic requirements
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Security Evaluation

HW/SW support

Crypto property

Sbox

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

#RSAC
Design Philosophy
"Shift-Invariant"
­ Definition
o For any rotated shift , F satisfies Fo=oF
o Originally studied in Joan Daemen's thesis, Chapter 6 [JDA 95] o Cellular automaton perspective: 7*7 Sbox [CC 18] o Keccak's 2

Presenter's Company Logo ­ replace or
delete on master slide

Source: Keccak sponge function family main document, https://keccak.team/obsolete/Keccak-main-1.1.pdf
13

Design Philosophy
Why "Shift-Invariant"?
­ Software Implementation
o Suitable for bit-slicing o Fine-grained

Shift-invariant

Security Evaluation

HW/SW support

Crypto property

Presenter's Company Logo ­ replace or
delete on master slide

Source: Keccak sponge function family main document, https://keccak.team/obsolete/Keccak-main-1.1.pdf
14

Sbox

#RSAC

#RSAC
Design Philosophy

Detour

­ Efficiency in bit-slicing

Same

o Pack the same bits to one register

o Best when b>processor's bit width

Otherwise, "borrow" from other blocks

o Part of the "slicing cost"

­ Shift-invariant

o "Easier slicing"

Eg. a 32-bit shift-invariant function does not take any "slicing" on 32-bit processors

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Design Philosophy

Why "Shift-Invariant"?
­ Serial TI
o Provides more trade-off options Eg,
a1=fa(x1,y1,z1,...) b1=fb(x1,y1,z1,...)
=fa(z1,y1,...,x1)
o 1 bit of 1 share v.s. all the bits in 1 share o Hardware: smaller footprint o Software: easier for bit-slicing

Presenter's Company

Logo ­ replace or

delete on master slide

16

#RSAC
Design Philosophy
To sum up, in our constructions, we choose
­ Quadratic (deg=2) permutations
o Quadratic: 3-share TI (less shares -> lower cost) o Permutation: Sbox construction without invertible structure
­ Shift-invariant
o More trade-off options (eg. 1-bit implementation)
­ Uniform TI
o Shift-invariant on each share o Further trade-off options (eg. 1-bit of one share)
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

Sbox Constructions
Quadratic building block search
­ n=4
o Total 211 o Permutation 24 o 3-share TI uniform 24
­ n=8
o Total 237 o Permutation 520128 o 3-share TI uniform 520128
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
only for n=4 or 8!

#RSAC
Sbox Constructions
Design Architecture
­ Full range SPN
o Branches: not perfect for "slicing"
­ Permutation Layer
o Not shift-invariant
· F already covers all possible options · Security concern [FSE 10]
o AES Xtime-like operation
· Rotate with conditional XOR · Do it twice for better diffusion
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Sbox Constructions
n=4
­ Diff.=4, Lin.=8 (a.k.a. "optimal")
o 16 options, 2 rounds o One instance:
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Sbox Constructions
n=8
­ Diff.<=8, Lin.<=72
o 6 options, 3 rounds o One instance: diff=8, lin=64, deg=6
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

#RSAC
Implementations
Software
­ Target platform
o ARM M0 (Thumb)/M3 (ARM) o 32 bit data width
­ Possible trade-offs
o Size-based: same share, different bit o Moderate trade-off (x1[1] x1[2] ... y1[1]y1[2] ...z1[1] z1[2] ...) >>>1 becomes >>>b
Presenter's Company Logo ­ replace or
delete on master slide

Implementations
Software
­ Results
o No fresh-randomness o Otherwise, not "that" fast...
­ Not a fair comparison
o Effort spent on optimizing AES/PRESENT's Sbox
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Number of concurrent Sboxes

#RSAC
Implementations
Software
­ Not a fair comparison
o Possible security overhead [EUROCRYPT 17] o Could be not as trivial as it sounds .....
Practical flaws
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Implementations
Software
­ Security Evaluation
o Cortex M0: NXP LPC1114
Presenter's Company Logo ­ replace or
delete on master slide

Implementations
Hardware
­ Selected trade-off
o 1-bit implementation o 2D rotation: possible on hardware
­ Possible pitfall
o Glitches' leakage on shifting shares o Pre-charge the input to 0 o 1 extra cycle (per "shift-share")
Presenter's Company Logo ­ replace or
delete on master slide

Shift bits

#RSAC
Shift shares

#RSAC
Implementations
Hardware
­ Results
o Trade cycles for GEs o Add cost to the control logic... o Not attractive for n=8
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Implementations
Hardware
­ Security Evaluation
o SAKURA-X: Kintex-7 FPGA
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Outline

Presenter's Company Logo ­ replace or
delete on master slide

Introduction Design Philosophy Sbox Constructions Implementations Summary

#RSAC
Summary
TI-friendly Sbox designs
­ Shift-invariant permutations
o 3-share implementation o shift-invariant TI-form o Easier for bit-slicing
­ Results
o 4-bit Sbox: 2 rounds/ 8-bit Sbox: 3 rounds o HW/SW Implementation o Security evaluation with TVLA test
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Summary
Discussion
­ 8-bit Sbox constructions
o Using 4-bit Sboxes as building blocks still seems more attractive [CHES 16] o Shift-invariant for non-Sbox designs?
­ Implementation pitfalls
o Non-academic, yet not an easy task for engineers! o Better understanding of processors & leakages --- obscure & time consuming o More security margins (eg. more shares) --- higher cost!
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Reference
· [CHES 12] Bilgin, B., Nikova, S., Nikov, V., Rijmen, V., St¨utz, G.: Threshold Implementations of All 3×3 and 4×4 S-Boxes. In: Cryptographic Hardware and Embedded Systems- CHES 2012 14th International Workshop, Leuven, Belgium, September 9-12,2012. Proceedings
· [FSE 17] Bozilov, D., Bilgin, B., Sahin, H.A.: A Note on 5-bit Quadratic Permutations' Classification. IACR Trans. Symmetric Cryptol. 2017 398-404
· [BFA18] De Meyer, L., Bilgin, B.: Classification of Balanced Quadratic Functions. IACR Cryptology ePrint Archive 2018
· [CHES 16] Boss, E., Grosso, V., G¨uneysu, T., Leander, G., Moradi, A., Schneider, T.: Strong 8bit Sboxes with efficient masking in hardware extended version. J. Cryptographic Engineering 7(2) (2017) 149-165
· [SITB 17] Meyer, L.D., Varici, K.: More Constructions for strong 8-bit S-boxes with efficient masking in hardware. In: Proceedings of the 38th Symposium on Information Theory in the Benelux, Delft,NE, Werkgemeenschap voor Informatie- en Communicatietheorie (2017) 11
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Reference
· [COSADE 13] Kutzner, S., Nguyen, P.H., Poschmann, A., Wang, H.: On 3-Share Threshold Implementations for 4-Bit S-boxes. In: Constructive Side-Channel Analysis and Secure Design - 4th International Workshop, COSADE 2013, Paris, France, March 6-8, 2013, Revised Selected Papers. (2013) 99-113
· [COSADE 18] Wegener, F., Moradi, A.: A First-Order SCA Resistant AES Without Fresh Randomness. In: Constructive Side-Channel Analysis and Secure Design - 9th International Workshop, COSADE 2018, Singapore, April 23-24, 2018, Proceedings. (2018) 245-262
· [COSADE 18'] Sasdrich, P., Bock, R., Moradi, A.: Threshold Implementation in Software - Case Study of PRESENT. In: Constructive Side-Channel Analysis and Secure Design - 9th International Workshop, COSADE 2018, Singapore, April 23-24, 2018, Proceedings. (2018) 227-244
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Reference

· [CARDIS 14] Balasch, J., Gierlichs, B., Grosso, V., Reparaz, O., Standaert, F.: On the Cost of Lazy Engineering for Masked Software Implementations. In: Smart Card Research and Advanced Applications - 13th International Conference, CARDIS 2014, Paris, France, November 5-7, 2014. Revised Selected Papers. (2014) 64-81

· [JDA 95]

Daemen, J.: Cipher and hash function design, strategies based on

linear and differential cryptanalysis, PhD Thesis. K.U.Leuven (1995)

http://jda:noekeon:org/

· [CC 18]

Mariot, L., Picek, S., Leporati, A., Jakobovic, D.: Cellular automata

based s-boxes. Cryptography and Communications (May 2018)

· [COSADE 18''] Corre, Yann Le et al. "Micro-Architectural Power Simulator for Leakage Assessment of Cryptographic Software on ARM Cortex-M3 Processors." IACR Cryptology ePrint Archive 2017 (2017): 1253.

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Reference
· [EUROCRYPT 17] Goudarzi, D., Rivain, M.: How Fast Can Higher-Order Masking Be in Software? In: Advances in Cryptology - EUROCRYPT 2017 - 36th Annual International Conference on the Theory and Applications of Cryptographic Techniques, Paris, France, April 30 - May 4, 2017, Proceedings, Part I. (2017) 567-597
Presenter's Company Logo ­ replace or
delete on master slide

