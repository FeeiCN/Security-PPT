SESSION ID: CRYP-W03
Lossy Trapdoor Permutations with Improved Lossiness
Benedikt Auerbach
Ruhr University Bochum
#RSAC

#RSAC
Agenda
· Index-dependent and index-independent lossy trapdoor permutations
­ Lossy trapdoor permutations ­ From index-dependence to index-independence ­ Instantiations in the RSA setting
· An all-but-one lossy trapdoor permutations from Phi-hiding
­ All-but-one lossy trapdoor permutations ­ Prime family generators ­ Instantiation from Phi-hiding
2

Lossy Trapdoor Permutations

#RSAC
Lossy Trapdoor Permutations (LTP)
Index-independent Domains [PeiWat08]
Syntax
· Instance Generation
­ Injective mode: (id,td)  Gen(1) ­ Lossy mode: (id,)  Gen(0)
· Domain D · Function Evaluation
­ F(id,·): D  D
· Function Inversion
­ F -1(td,·): D  D
4

#RSAC
Lossy Trapdoor Permutations (LTP)
Index-dependent Domains [FGKRS13]
Syntax
· Instance Generation
­ Injective mode: (id,td)  Gen(1) ­ Lossy mode: (id,)  Gen(0)
· Domains D(id)D · Function Evaluation
­ F(id,·): D(id)  D(id)
· Function Inversion
­ F -1(td,·): D(id)  D(id)
5

#RSAC
Lossy Trapdoor Permutations (LTP)
Index-dependent Domains [FGKRS13]
Example: LTP from Phi-Hiding
· Instance Generation
­ RSA modulus id=(N,e), td=(N,d)
o Injective mode: gcd((N),e)=1 o Lossy mode: e | (N)
· Domains D(id)=/N, D=[2k]
· Function Evaluation
­ F(id,x)=xe mod N
· Function Inversion
­ F -1(td,y)=yd mod N
6

#RSAC
Lossy Trapdoor Permutations
Security Properties

I) Lossiness

II) Lossy Mode c Injective Mode

· LTP is lossy with lossiness factor L if for all (id,)  Gen(0)
|F(id,D(id))|  |D(id)| / L

· id and id' computationally
indistinguishable for
­ (id,td)  Gen(1) ­ (id',)  Gen(0)

· Example
­ e | (N) ­ Then x  xe mod N is roughly e-
to-1

· Example
­ Equivalent to Phi-hiding assumption
­ (N,e)c(N,e') where gcd((N),e)=1 , e' | (N)

7

#RSAC
Applications
· Applications of LTPs
­ One-way functions ­ CPA-secure encryption ­ CCA-secure encryption ­ Hedged encryption ­...
· Some of the constructions require index-independence
8

From Index-dependence to Indexindependence

#RSAC
From Index-dependence to Index-independence
· Give transformation from index-dep. LTP to index-indep. LTP
­ Generalization of construction from [HOT04] for extending range of RSA one-way permutation
· Transformation
­ In:
o LTP (Gen,F,F-1) with index-dependent domains D(id)D o Permutation family id: D  D with id(D\D(id))D(id)
­ Out:
o LTP (Gen',F',F'-1) with index-independent domain D
­ Instance Generation: Gen'=Gen
10

#RSAC
From Index-dependence to Index-independence
Working principle of function evaluation
11

#RSAC
From Index-dependence to Index-independence
Security of the construction
· Correctness:  · Lossy mode c injective mode:  · Lossiness:
­ Theorem: If (Gen,F,F -1) is L-lossy then (Gen',F',F -1') is L/2-lossy ­ Idea behind construction: Every element of D is permuted with F(id,·)
at least once
12

#RSAC
From Index-dependence to Index-independence
Example: Index-independent LTP from Phi-hiding
13

#RSAC
Instantiations

· Comparison to the index-indep. LTPs from [FGKRS13]:

Assumption
Phi-hiding
Quadratic Residuosity
Composite Residuosity

D [2k] [2k]
[2k(s+1)]

D(id) (index-dep.) /N /N
/Ns+1

L [FGKRS13] L (our transform)

2

2k/4

4/3

2

2(k-1)s-k/2-1

2(k-1)s-2

14

An All-but-one Lossy Trapdoor Permutation from Phi-hiding

#RSAC
All-but-one Lossy Trapdoor Permutations
Index-independent Domains [PeiWat08]
Syntax
· Branch set Br · Instance generation
­ Pick branch br*Br ­ Instance (id,td)  Gen(br*)
· Domain D · Function evaluation
­ F(br,id,·): D  D
· Function inversion (for brbr*)
­ F -1(br,td,·): D  D
16

#RSAC
All-but-one Lossy Trapdoor Permutations
Index-dependent Domains
Syntax
· Branch set Br · Instance generation
­ Pick branch br*Br ­ Instance (id,td)  Gen(br*)
· Domains D(id)D · Function evaluation
­ F(br,id,·): D(id)  D(id)
· Function inversion (for brbr*)
­ F -1(br,td,·): D(id)  D(id)
17

#RSAC
All-but-one Lossy Trapdoor Permutations
Security

I) Lossy on br*

II) Hidden Lossy Branch

· ABO is lossy with lossiness factor L: For all br* and (id,td)  Gen(br*)
|F(br*,id,D(id))|  |D(id)| / L

· id and id' are computationally
indistinguishable for
­ (id,td)  Gen(br0) ­ (id',td')  Gen(br1)

18

#RSAC
An ABO from Phi-hiding
Idea of our construction

· Branches Br{p1,...,pm} set of primes · Instance generation
­ For branch p* sample N s.t.
o p*|(N) o gcd((N),pi)=1 for pip*
· Domains D(id)=/N

· Function evaluation
­ F(p,N,x) = xp mod N
· Function inversion
­ d=p-1 mod (N) ­ F-1(p,N,x)=xd mod N

19

#RSAC
Prime Family Generators
· Problem: Cannot directly use {p1,...,pm}
­ Inefficient ­ Restricts admissible RSA moduli N
· Solution: Prime Family Generator (PFG)
­ Maps [m] to set of primes {p1,...,pm} ­ Particular choice of pi depends on seed sd ­ Recover i-th prime with algorithm pi  PGet(sd,i)
· Instantiation via d-wise independent hash functions
­ similar to construction from [CMS99] ­ different security properties
20

#RSAC
An ABO from Phi-hiding
Our construction

· Branches Br=[m]
· Instance generation for branch br*
­ Sample sd for PFG ­ p*  PGet(sd,br*) ­ Sample N such that
o p*|(N) o gcd((N),pbr)=1 for pbrp*
­ id=(sd,N), td=(sd,N,(N))
· Domains D(id)=/N

· Function evaluation F(br,id,x)
­ p  PGet(sd,br) ­ Return xp mod N
· Function inversion F-1(br,td,y)
­ p  PGet(sd,br) ­ d=p-1 mod (N) ­ Return yd mod N

21

#RSAC
An ABO from Phi-hiding
Security of the construction
· Hidden lossy branch under a variant of Phi-hiding · Lossiness factor L=2k/4 · Index-independent variant via our transform
22

Summary

#RSAC
Summary
· From index-dependence to index-independence
­ We give a transform from index-dep. LTPs to index-indep. LTPs
o Preserves indistinguishability o Preserves lossiness up to factor of 2
­ Applicable to several instantiations in the RSA setting
· An all-but-one lossy trapdoor permutation from Phi-hiding
­ First known construction from Phi-hiding ­ Builds on prime family generators
24

