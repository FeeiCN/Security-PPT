CLKscrew: Exposing the Perils of Security-Oblivious Energy Management
Adrian Tang, Simha Sethumadhavan, and Salvatore Stolfo Columbia University
Black Hat Europe 2017 Whitepaper
©2017

Executive Summary
The need for power- and energy-efficient computing has resulted in aggressive cooperative hardware-software energy management mechanisms on modern commodity devices. Most systems today, for example, allow software to control the frequency and voltage of the underlying hardware at a very fine granularity to extend battery life. Despite their benefits, these softwareexposed energy management mechanisms pose grave security implications that have not been studied before.
This work presents the CLKscrew attack, a new class of fault attacks that exploit the securityobliviousness of energy management mechanisms to break security. This new attack vector poses realizable security risks because it makes fault attacks more accessible to attackers since the attacks can now be conducted without the need for physical access to the devices or fault injection equipment. We demonstrate CLKscrew on commodity ARM/Android devices. We show that a malicious kernel driver (1) can extract secret cryptographic keys from Trustzone, and (2) can escalate its privileges by loading self-signed code into Trustzone. As the first work to show the security ramifications of energy management mechanisms, we hope to motivate security-aware energy management in existing and future designs, both in industry and academia.

Contents

1 Overview

1

2 Background

4

2.1 Dynamic Voltage & Frequency Scaling . . . . . . . . . . . . . . . . . . . . . . . . . 4

2.2 Hardware Support for DVFS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5

2.3 Software Support for DVFS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7

3 Achieving the First CLKscrew Fault

9

3.1 How Timing Faults Occur . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9

3.2 Challenges of CLKscrew Attacks . . . . . . . . . . . . . . . . . . . . . . . . . . . 11

3.3 Characterization of Regulator Limits . . . . . . . . . . . . . . . . . . . . . . . . . . 13

3.4 Containing the Fault within a Core . . . . . . . . . . . . . . . . . . . . . . . . . . 16

3.5 CLKscrew Attack Steps . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17

3.6 Isolation-Agnostic DVFS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19

4 TZ Attack #1: Inferring AES Keys

20

4.1 Trustzone AES Decryption App . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20

4.2 Timing Profiling . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21

4.3 Fault Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22

4.4 Putting it together . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23

i

5 TZ Attack #2: Loading Self-Signed Apps

25

5.1 Trustzone Signature Authentication . . . . . . . . . . . . . . . . . . . . . . . . . . 26

5.2 Attack Strategy and Cryptanalysis . . . . . . . . . . . . . . . . . . . . . . . . . . . 28

5.2.1 Where to inject the runtime fault? . . . . . . . . . . . . . . . . . . . . . . . 29

5.2.2 How to craft the attack signature SA? . . . . . . . . . . . . . . . . . . . . 30 5.3 Timing Profiling . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31

5.4 Fault Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 35

5.5 Putting it together . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36

6 Discussion and Related Works

38

6.1 Applicability to other Platforms . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38

6.2 Hardware-Level Defenses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39

6.3 Software-Level Defenses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40

6.4 Subverting Cryptography with Faults . . . . . . . . . . . . . . . . . . . . . . . . . 41

6.5 Relation to Rowhammer Faults . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 41

7 Conclusions

42

Bibliography

45

Appendix A

51

A.1 Example Glitch in RSA Modulus . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51

1
Overview
The growing cost of powering and cooling systems has made energy management an essential feature of most commodity devices today. Energy management is crucial for reducing cost, increasing battery life, and improving portability for systems, especially mobile devices. Designing effective energy management solutions, however, is a complex task that demands cross-stack design and optimizations: Hardware designers, system architects, and kernel and application developers have to coordinate their efforts across the entire hardware/software system stack to minimize energy consumption and maximize performance. Take as an example, Dynamic Voltage and Frequency Scaling (DVFS) [43], a ubiquitous energy management technique that saves energy by regulating the frequency and voltage of the processor cores according to runtime computing demands. To support DVFS, at the hardware level, vendors have to design the underlying frequency and voltage regulators to be portable across a wide range of devices while ensuring cost efficiency. At the software level, kernel developers need to track and match program demands to operating frequency and voltage settings to minimize energy consumption for those demands. Thus, to maximize the utility of DVFS, hardware and software function cooperatively and at very fine granularities.
Despite the ubiquity of energy management mechanisms on commodity systems, security is rarely a consideration in the design of these mechanisms. In the absence of known attacks, given the complexity of hardware-software interoperability needs and the pressure of cost and time-to-market concerns, the designers of these mechanisms have not given much attention to
1

the security aspects of these mechanisms; they have been focused on optimizing the functional aspects of energy management. These combination of factors along with the pervasiveness of these mechanisms makes energy management mechanisms a potential source of security vulnerabilities and an attractive target for attackers.
In this work, we present the first security review of a widely-deployed energy management technique, DVFS. Based on careful examination of the interfaces between hardware regulators and software drivers, we uncover a new class of exploitation vector, which we term as CLKscrew. In essence, a CLKscrew attack exploits unfettered software access to energy management hardware to push the operating limits of processors to the point of inducing faulty computations. This is dangerous when these faults can be induced from lower privileged software across hardwareenforced boundaries, where security sensitive computations are hosted.
We demonstrate that CLKscrew can be conducted using no more than the software control of energy management hardware regulators in the target devices. CLKscrew is more powerful than traditional physical fault attacks [12] for several reasons. Firstly, unlike physical fault attacks, CLKscrew enables fault attacks to be conducted purely from software. Remote exploitation with CLKscrew becomes possible without the need for physical access to target devices. Secondly, many equipment-related barriers, such as the need for soldering and complex equipment, to achieve physical fault attacks are removed. Lastly, since physical attacks have been known for some time, several defenses, such as special hardened epoxy and circuit chips that are hard to access, have been designed to thwart such attacks. Extensive hardware reverse engineering may be needed to determine physical pins on the devices to connect the fault injection circuits [41]. CLKscrew sidesteps all these risks of destroying the target devices permanently.
To highlight the practical security impact of our attack, we implement the CLKscrew attack on a commodity ARMv7¹ phone, Nexus 6. With only publicly available knowledge of the Nexus 6 device, we identify the operating limits of the frequency and voltage hardware mechanisms. We then devise software to enable the hardware to operate beyond the vendor-recommended
¹As of Sep 2016, ARMv7 devices capture over 86% of the worldwide market share of mobile phones [38].

limits. Our attack requires no further access beyond a malicious kernel driver. We show how the CLKscrew attack can subvert the hardware-enforced isolation in ARM Trustzone in two attack scenarios: (1) extracting secret AES keys embedded within Trustzone and (2) loading self-signed code into Trustzone. We note that the root cause for CLKscrew is neither a hardware nor a software bug: CLKscrew is achievable due to the fundamental design of energy management mechanisms.
We have responsibly disclosed the vulnerabilities identified in this work to the relevant SoC and device vendors. They have been very receptive to the disclosure. Besides acknowledging the highlighted issues, they were able to reproduce the reported fault on their internal test device within three weeks of the disclosure. They are working towards mitigations.
In summary, we make the following contributions in this work:
1. We expose the dangers of designing energy management mechanisms without security in mind by introducing the concept of the CLKscrew attack. Aggressive energy-aware computing mechanisms can be exploited to influence isolated computing.
2. We present the CLKscrew attack to demonstrate a new class of energy management-based exploitation vector that exploits software-exposed frequency and voltage hardware regulators to subvert trusted computation.
3. We introduce a methodology for examining and demonstrating the feasibility of the CLKscrew attack against commodity ARM devices running a full OS such as Android.
4. We demonstrate that the CLKscrew attack can be used to break the ARM Trustzone by extracting secret cryptographic keys and loading self-signed applications on a commodity phone.
The remainder of the paper is organized as follows. We provide background on DVFS and its associated hardware and software support in § 2. In § 3, we detail challenges and steps we take to achieving the first CLKscrew fault. Next, we present two attack case studies in § 4 and § 5. Finally, we discuss countermeasures and related work in § 6, and conclude in § 7.

2 Background

In this section, we provide the required background in energy management to understand CLKscrew. We first describe DVFS and how it relates to saving energy. We then detail key classes of supporting hardware regulators and their software-exposed interfaces.

2.1 Dynamic Voltage & Frequency Scaling

DVFS is an energy management technique that trades off processing speed for energy savings. Since its debut in 1994 [59], DVFS has become ubiquitous in almost all commodity devices. DVFS works by regulating two important runtime knobs that govern the amount of energy consumed in a system ­ frequency and voltage.
To see how managing frequency and voltage can save energy, it is useful to understand how energy consumption is affected by these two knobs. The amount of energy¹ consumed in a system is the product of power and time, since it refers to the total amount of resources utilized by a system to complete a task over time. Power², an important determinant of energy consumption, is directly proportional to the product of operating frequency and voltage. Consequently, to save

¹Formally, time T : ET =

th0TePtot tdatl.amount

of

energy

consumed,

ET

,

is

the

integral

of

instantaneous

dynamic

power,

Pt

over

²In a system with a fixed capacitative load, at any time t, the instantaneous dynamic power is proportional to both the voltage, Vt and the frequency Ft as follows: Pt  Vt2 × Ft.

4

Voltage output to cores

Voltage output to other peripherals

0 1

PMA8084

2 3

PMIC

CCoCorCeoroer0er0e00
Voltage Domain (All cores)

Input
SPM (All cores)
Voltage Control

SoC Processor (Nexus 6)

Figure 2.1: Shared voltage regulator for all Krait cores.

energy, many energy management techniques focus on efficiently optimizing both frequency and voltage.
DVFS regulates frequency and voltage according to runtime task demands. As these demands can vary drastically and quickly, DVFS needs to be able to track these demands and effect the frequency and voltage adjustments in a timely manner. To achieve this, DVFS requires components across layers in the system stack. The three primary components are (1) the voltage/frequency hardware regulators, (2) vendor-specific regulator driver, and (3) OS-level CPUfreq power governor [42]. The combined need for accurate layer-specific feedback and low voltage/frequency scaling latencies drives the prevalence of unfettered and software-level access to the frequency and voltage hardware regulators.

2.2 Hardware Support for DVFS
Voltage Regulators. Voltage regulators supply power to various components on devices, by reducing the voltage from either the battery or external power supply to a range of smaller voltages for both the cores and the peripherals within the device. To support features, such as camera and sensors that are sourced from different vendors and hence operating at different voltages, numerous voltage regulators are needed on devices. These regulators are integrated within a

PLL (fixed rate)

SoC Processor (Nexus 6)

Clock Domain (per-core)
300 MHz 0

HFPLL (variable rate)

N

*

19.2 MHz

Clock 1 MUX

Half Divider

N/2 * 19.2 MHz 2

Core

N Multiplier

Source Selector

Figure 2.2: Separate clock sources for each Krait core.
specialized circuit called Power Management Integrated Circuit (PMIC) [53]. Power to the application cores is typically supplied by the step-down regulators within the
PMIC on the System-on-Chip (SoC) processor. As an example, Figure 2.1 shows the PMIC that regulates the shared voltage supply to all the application cores (a.k.a. Krait cores) on the Nexus 6 device. The PMIC does not directly expose software interfaces for controlling the voltage supply to the cores. Instead, the core voltages are indirectly managed by a power management subsystem, called the Subsystem Power Manager (SPM) [35]. The SPM is a hardware block that maintains a set of control registers which, when configured, interfaces with the PMIC to effect voltage changes. Privileged software like a kernel driver can use these memory-mapped control registers to direct voltage changes. We highlight these software-exposed controls as yellow-shaded circles in Figure 2.1.
Frequency PLL-based Regulators. The operating frequency of application cores is derived from the frequency of the clock signal driving the underlying digital logic circuits. The frequency regulator contains a Phase Lock Loop (PLL) circuit, a frequency synthesizer built into modern processors to generate a synchronous clock signal for digital components. The PLL circuit generates an output clock signal of adjustable frequency, by receiving a fixed-rate reference

clock (typically from a crystal oscillator) and raising it based on an adjustable multiplier ratio. The output clock frequency can then be controlled by changing this PLL multiplier.
For example, each core on the Nexus 6 has a dedicated clock domain. As such, the operating frequency of each core can be individually controlled. Each core can operate on three possible clock sources. In Figure 2.2, we illustrate the clock sources as well as the controls (shaded in yellow) exposed to the software from the hardware regulators. A multiplexer (MUX ) is used to select amongst the three clock sources, namely (1) a PLL supplying a fixed-rate 300-MHz clock signal, (2) a High-Frequency PLL (HFPLL) supplying a clock signal of variable frequency based on a N multiplier, and (3) the same HFPLL supplying half the clock signal via a frequency divider for finer-grained control over the output frequency.
As shown in Figure 2.2, the variable output frequency of the HFPLL is derived from a base frequency of 19.2MHz and can be controlled by configuring the N multiplier. For instance, to achieve the highest core operating frequency of 2.65GHz advertised by the vendor, one needs to configure the N multiplier to 138 and the Source Selector to 1 to select the use of the full HFPLL. Similar to changing voltage, privileged software can initiate per-core frequency changes by writing to software-exposed memory-mapped PLL registers, shown in Figure 2.2.
2.3 Software Support for DVFS
On top of the hardware regulators, additional software support is needed to facilitate DVFS. Studying these supporting software components for DVFS enables us to better understand the interfaces provided by the hardware regulators. Software support for DVFS comprises two key components, namely vendor-specific regulator drivers and OS-level power management services.
Besides being responsible for controlling the hardware regulators, the vendor-provided PMIC drivers [45, 46] also provide a convenient means for mechanisms in the upper layers of the stack, such as the Linux CPUfreq power governor [42] to dynamically direct the voltage and frequency scaling. DVFS requires real-time feedback on the system workload profile to guide the optimiza-

tion of performance with respect to power dissipation. This feedback may rely on layer-specific information that may only be efficiently accessible from certain system layers. For example, instantaneous system utilization levels are readily available to the OS kernel layer. As such, the Linux CPUfreq power governor is well-positioned at that layer to initiate runtime changes to the operating voltage and frequency based on these whole-system measures. This also provides some intuition as to why DVFS cannot be implemented entirely in hardware.

3
Achieving the First CLKscrew Fault
In this section, we first briefly describe why erroneous computation occurs when frequency and voltage are stretched beyond the operating limits of digital circuits. Next, we outline challenges in conducting a non-physical probabilistic fault injection attack induced from software. Finally, we characterize the operating limits of regulators and detail the steps to achieving the first CLKscrew fault on a real device.
3.1 How Timing Faults Occur
To appreciate why unfettered access to hardware regulators is dangerous, it is necessary to understand in general why over-extending frequency (a.k.a. overclocking) or under-supplying voltage (a.k.a. undervolting) can cause unintended behavior in digital circuits.
Synchronous digital circuits are made up of memory elements called flip-flops (FF). These flip-flops store stateful data for digital computation. A typical flip-flop has an input D, and an output Q, and only changes the output to the value of the input upon the receipt of the rising edge of the clock (clk) signal. In Figure 3.1, we show two flip-flops, F Fsrc and F Fdst sharing a common clock signal and some intermediate combinatorial logic elements. These back-to-back flip-flops are building blocks for pipelines, which are pervasive throughout digital chips and are used to achieve higher performance.
Circuit timing constraint. For a single flip-flop to properly propagate the input to the 9

input
common colomcmk osnigcnloacl k
prosivgindaelr

FFsrc
Dsrc Qsrc clk

Intermediate combinatorial logic

...

...

...

FFdst
output Ddst Qdst
clk

Tclk

1
clock pulse
0
1
input (0 1)
0
1
Qsrc
0
1
Ddst
0
1
output (0 1)
0

Tmax_path

TFF

Tsetup

TFF

Figure 3.1: Timing constraint for error-free data propagation from input Qsrc to output Ddst for entire circuit.

output locally, there are three key timing sub-constraints. (1) The incoming data signal has to be held stable for Tsetup during the receipt of the clock signal, and (2) the input signal has to be held stable for TFF within the flip-flop after the clock signal arrives. (3) It also takes a minimum of Tmax_path for the output Qsrc of F Fsrc to propagate to the input Ddst of F Fdst. For the overall circuit to propagate input Dsrc  output Qdst, the minimum required clock cycle period¹, Tclk, is bounded by the following timing constraint (3.1) for some microarchitectural constant K:

Tclk  TFF + Tmax_path + Tsetup + K

(3.1)

Violation of timing constraint. When the timing constraint is violated during two consecutive rising edges of the clock signal, the output from the source flip-flop F Fsrc fails to latch
¹Tclk is simply the reciprocal of the clock frequency.

1
clock pulse
0
1
input (0 1)
0
1
Qsrc
0
1
Ddst
0
1
output (0 0)
0

Tclk'

Tmax_path

Tsetup

TFF

glitched output
0

Figure 3.2: Bit-level fault due to overclocking: Reducing clock period Tclk  Tclk results in a bit-flip in output 1  0.

properly in time as the input at the destination flip-flop F Fdst. As such, the F Fdst continues to operate with stale data. There are two situations where this timing constraint can be violated, namely (a) overclocking to reduce Tclk and (b) undervolting to increase the overall circuit propagation time, thereby increasing Tmax_path. Figure 3.2 illustrates how the output results in an unintended erroneous value of 0 due to overclocking.
For comparison, we show an example of a bit-level fault due to undervolting in Figure 3.3. Note that in this case, the fault occurs because the propagation time increases beyond an achievable deadline.

3.2 Challenges of CLKscrew Attacks
Mounting a fault attack purely from software on a real-world commodity device using its internal voltage/frequency hardware regulators has numerous difficulties. These challenges are non-existent or vastly different from those in traditional physical fault attacks (that commonly use laser, heat and radiation).
Regulator operating limits. Overclocking or undervolting attacks require the hardware to

1
clock pulse
0
1
input (0 1)
0
1
Qsrc
0
1
Ddst
0
1
output (0 0)
0

Tclk

Tmax_path'

glitched output
0

TFF

Tsetup

TFF

Figure 3.3: Glitch due to undervolting: Increasing propagation time of the critical path between the two consecutive flip-flops, Tmax_path  Tm ax_path results in a bit-flip in output 1  0.

be configured far beyond its vendor-suggested operating range. Do the operating limits of the regulators enable us to effect such attacks in the first place? We show that this is feasible in § 3.3.
Self-containment within same device. Since the attack code performing the fault injection and the victim code to be faulted both reside on the same device, the fault attack must be conducted in a manner that does not affect the execution of the attacking code. We present techniques to overcome this in § 3.4.
Noisy complex OS environment. On a full-fledged OS with interrupts, we need to inject a fault into the target code without causing too much perturbation to non-targeted code. We address this in § 3.4.
Precise timing. To attack the victim code, we need to be relatively precise in when the fault is induced. Using two attack scenarios that require vastly different degrees of timing precision in § 4 and § 5, we demonstrate how the timing of the fault can be fine-tuned using a range of execution profiling techniques.
Fine-grained timing resolution. The fault needs to be transient enough to occur during the intended region of victim code execution. We may need the ability to target a specific range of code execution that takes orders of magnitude fewer clock cycles within an entire operation. For

3.5
Maximum OPP
Vendor stock OPP 3.0

Nexus 6

2.5

Frequency (GHz)

2.0

1.5

1.0

0.5

0.0

0.5

0.6

0.7

0.8

0.9

1.0

1.1

1.2

1.3

Voltage (V)

Figure 3.4: Vendor-stipulated voltage/frequency Operating Performance Points (OPPs) vs. maximum OPPs achieved before computation fails.

example, in the attack scenario described in Section § 5.3, we seek to inject a fault into a memoryspecific operation that takes roughly 65,000 clock cycles within an entire RSA certificate chain verification operation spanning over 1.1 billion cycles.

3.3 Characterization of Regulator Limits
In this section, we study the capabilities and limits of the built-in hardware regulators, focusing on the Nexus 6 phone. According to documentation from the vendor, Nexus 6 features a 2.7GHz quad-core SoC processor. On this device, DVFS is configured to operate only in one of 15 possible discrete² Operating Performance Points (OPPs) at any one time, typically by a DVFS OS-level service. Each OPP represents a state that the device can be in with a voltage and frequency pair. These OPPs are readily available from the vendor-specific definition file, apq8084.dtsi, from the kernel source code [40].
²A limited number of discrete OPPs, instead of a range of continuous voltage/frequency values, is used so that the time taken to validate the configured OPPs at runtime is minimized.

To verify that the OPPs are as advertised, we need measurement readings of the operating voltage and frequency. By enabling the debugfs feature for the regulators, we can get per-core voltage³ and frequency measurements. We verify that the debugfs measurement readings indeed match the voltage and frequency pairs stipulated by each OPP. We plot these vendor-provided OPP measurements as black-star symbols in Figure 3.4.
No safeguard limits in hardware. Using the software-exposed controls described in § 2.2, while maintaining a low base frequency of 300MHz, we configure the voltage regulator to probe for the range during which the device remains functional. We find that when the device is set to any voltage outside the range 0.6V to 1.17V, it either reboots or freezes. We refer to the phone as being unstable when these behaviors are observed. Then, stepping through 5mV within the voltage range, for each operating voltage, we increase the clock frequency until the phone becomes unstable. We plot each of these maximum frequency and voltage pair (as shaded circles) together with the vendor-stipulated OPPs (as shaded stars) in Figure 3.4. It is evident that the hardware regulators can be configured past the vendor-recommended limits. This unfettered access to the regulators offers a powerful primitive to induce a software-based fault.
Attack Enabler (General) #1: There are no safeguard limits in the hardware regulators to restrict the range of frequencies and voltages that can be configured.
Large degree of freedom for attacker. Figure 3.4 illustrates the degree of freedom an attacker has in choosing the OPPs that have the potential to induce faults. The maximum frequency and voltage pairs (i.e. shaded circles in Figure 3.4) form an almost continuous upward-sloping curve. It is noteworthy that all frequency and voltage OPPs above this curve represent potential candidate values of frequency and voltage that an attacker can use to induce a fault.
This "shaded circles" curve is instructive in two ways. First, from the attacker's perspective, the upward-sloping nature of the curve means that reducing the operating voltage simultaneously lowers the minimum required frequency needed to induce a fault in an attack. For example,
³/d/regulator/kraitX /voltage /d/clk/kraitX _clk/measure

suppose an attacker wants to perform an overclocking attack, but the frequency value she needs to achieve the fault is beyond the physical limit of the frequency regulator. With the help of this frequency/voltage characteristic, she can then possibly reduce the operating voltage to the extent where the overclocking frequency required is within the physical limit of the regulator.
Attack Enabler (General) #2: Reducing the operating voltage lowers the minimum required frequency needed to induce faults.

Secondly, from the defender's perspective, the large range of instability-inducing OPPs above the curve suggests that limits of both frequency and voltage, if any, must be enforced in tandem to be effective. Combination of frequency and voltage values, while individually valid, may still cause unstable conditions when used together.
Prevalence of Regulators. The lack of safeguard limits within the regulators is not specific to Nexus 6. We observe similar behaviors in devices from other vendors. For example, the frequency/voltage regulators in the Nexus 6P and Pixel phones can also be configured beyond their vendor-stipulated limits to the extent of seeing instability on the devices. We show the comparison of the vendor-recommended and the actual observed OPPs of these devices in Figures 3.5 and 3.6.

2.5

Nexus 6P (A57 cluster core)

Maximum OPP

Vendor stock OPP

2.0

Frequency (GHz)

1.5

1.0

0.5 0.65

0.70

0.75

0.80 0.85 0.90 Voltage (V)

0.95

1.00

1.05

Figure 3.5: Vendor-stipulated vs maximum voltage/frequency OPPs for Nexus 6P.

3.0

Pixel ("Performance" cluster core)

Maximum OPP

Vendor stock OPP

2.5

2.0

Frequency (GHz)

1.5

1.0

0.5

0.0

0.3

0.4

0.5

0.6

0.7

0.8

0.9

1.0

Voltage (V)

Figure 3.6: Vendor-stipulated vs maximum voltage/frequency OPPs for Pixel.

3.4 Containing the Fault within a Core

The goal of our fault injection attack is to induce errors to specific victim code execution. The challenge is doing so without self-faulting the attack code and accidentally attacking other nontargeted code.
We create a custom kernel driver to launch separate threads for the attack and victim code and to pin each of them to separate cores. Pinning the attack and victim code in separate cores automatically allows each of them to execute in different frequency domains. This core pinning strategy is possible due to the deployment of increasingly heterogeneous processors like the ARM big.LITTLE [1] architecture, and emerging technologies such as Intel PCPS [28] and Qualcomm aSMP [48]. The prevailing industry trend of designing finer-grained energy management favors the use of separate frequency and voltage domains across different cores. In particular, the Nexus 6 SoC that we use in our attack is based on a variant of the aSMP architecture. With core pinning, the attack code can thus manipulate the frequency of the core that the victim code executes on, without affecting that of the core the attack code is running on. In addition to core pinning, we also disable interrupts during the entire victim code execution to ensure that no context switch occurs for that core. These two measures ensure that our fault injection effects are contained within the core that the target victim code is running on.

Prep Phase

Corevictim Coreattack

...
Clearing 1 residual
states
...

Attack Phase

2 Profiling

Targeted subset of entire victim execution
Victim thread

5

6

4 Pre-delay

3

Timing anchor

Fault

Attack thread

Figure 3.7: Overview of CLKscrew fault injection setup.

Attack Enabler (General) #3: The deployment of cores in different voltage/frequency domains isolates the effects of cross-core fault attack.

3.5 CLKscrew Attack Steps

Parameter Description

Fvolt Fpdelay Ffreq_hi Ffreq_lo Fdur

Base operating voltage Number of loops to delay/wait before the fault Target value to raise the frequency to for the fault Base value to raise the frequency from for the fault Duration of the fault in terms of number of loops

Table 3.1: CLKscrew fault injection parameters.

The CLKscrew attack is implemented with a kernel driver to attack code that is executing at a higher privilege than the kernel. Examples of such victim code are applications running within isolation technologies such as ARM Trustzone [2] and Intel SGX [5]. In Figure 3.7, we illustrate the key attack steps within the thread execution of the attack and victim code. The goal of the CLKscrew attack is to induce a fault in a subset of an entire victim thread execution.
(1) Clearing residual states. Before we attack the victim code, we want to ensure that there are no microarchitectural residual states remaining from prior executions. Since we are using a cache-based profiling technique in the next step, we want to make sure that the caches do not

have any residual data from non-victim code before each fault injection attempt. To do so, we invoke both the victim and attack threads in the two cores multiple times in quick succession. From experimentation, 5-10 invocations suffice in this preparation phase.
(2)/(3) Profiling for an anchor. Since the victim code execution is typically a subset of the entire victim thread execution, we need to profile the execution of the victim thread to identify a consistent point of execution just before the target code to be faulted. We refer to this point of execution as a timing anchor, Tanchor to guide when to deliver the fault injection. Several software profiling techniques can be used to identify this timing anchor. In our case, we rely on instruction or data cache profiling techniques in recent work [33].
(4) Pre-fault delaying. Even with the timing anchor, in some attack scenarios, there may still be a need to finetune the exact delivery timing of the fault. In such cases, we can configure the attack thread to spin-loop with a predetermined number of loops before inducing the actual fault. The use of these loops consisting of no-op operations is essentially a technique to induce timing delays with high precision. For this stage of the attack, we term this delay before inducing the fault as Fpdelay.
(5)/(6) Delivering the fault. Given a base operating voltage Fvolt, the attack thread will raise the frequency of the victim core (denoted as Ffreq_hi), keep that frequency for Fdur loops, and then restore the frequency to Ffreq_lo.
To summarize, for a successful CLKscrew attack, we can characterize the attacker's goal as the following sub-tasks. Given a victim code and a fault injection target point determined by Tanchor, the attacker has to find optimal values for the following parameters to maximize the odds of inducing the desired fault. We summarize the fault injection parameters required in Table 3.1.
F|Tanchor = {Fvolt, Fpdelay, Ffreq_hi, Fdur, Ffreq_lo}

Core0 Trusted mode Normal mode
(Insecure)

Trusted code

Untrusted code

voltage/frequency changes
Voltage and Frequency Regulators Shared power domain

Hardware-enforced isolation
Regulator HW-SW interface

Figure 3.8: Regulators operate across security boundaries.

3.6 Isolation-Agnostic DVFS

To support execution of trusted code isolated from untrusted one, two leading industry technologies, ARM Trustzone [2] and Intel SGX [5], are widely deployed. They share a common characteristic in that they can execute both trusted and untrusted code on the same physical core, while relying on architectural features such as specialized instructions to support isolated execution. It is noteworthy that on such architectures, the voltage and frequency regulators typically operate on domains that apply to cores as a whole (regardless of the security-sensitive processor execution modes), as depicted in Figure 3.8. With this design, any frequency or voltage change initiated by untrusted code inadvertently affects the trusted code execution, despite the hardware-enforced isolation. This, as we show in subsequent sections, poses a critical security risk.
Attack Enabler (General) #4: Hardware regulators operate across security boundaries with no physical isolation.

4
TZ Attack #1: Inferring AES Keys
In this section, we show how AES [37] keys stored within Trustzone (TZ) can be inferred by lower-privileged code from outside Trustzone, based on the faulty ciphertexts derived from the erroneous AES encryption operations. Specifically, it shows how lower-privileged code can subvert the isolation guarantee by ARM Trustzone, by influencing the computation of higherprivileged code using the energy management mechanisms. The attack shows that the confidentiality of the AES keys that should have been kept secure in Trustzone can be broken.
Threat model. In our victim setup, we assume that there is a Trustzone app that provisions AES keys and stores these keys within Trustzone, inaccessible from the non-Trustzone (nonsecure) environment. The attacker can repeatedly invoke the Trustzone app from the non-secure environment to decrypt any given ciphertext, but is restricted from reading the AES keys directly from Trustzone memory due to hardware-enforced isolation. The attacker's goal is to infer the AES keys stored.
4.1 Trustzone AES Decryption App
For this case study, since we do not have access to a real-world AES app within Trustzone, we rely on a textbook implementation of AES as the victim app. We implement a AES decryption app that can be loaded within Trustzone. Without loss of generality, we restrict the decryption to 128-bit keys, operating on 16-bit plaintext and ciphertext. A single 128-bit encryption/decryption
20

operation comprises 10 AES rounds, each of which is a composition of the four canonical suboperations, named SubBytes, ShiftRows, MixColumns and AddRoundKey [37].
To load this app into Trustzone as our victim program, we use a publicly known Trustzone vulnerability[10] to overwrite an existing Trustzone syscall handler, tzbsp_es_is_activated, on our Nexus 6 device running an old firmware¹. A non-secure app can then execute this syscall via an ARM Secure Monitor Call [18] instruction to invoke our decryption Trustzone app. This vulnerability serves the sole purpose of allowing us to load the victim app within Trustzone to simulate a AES decryption app in Trustzone. It plays no part in the attacker's task of interest ­ extracting the cryptographic keys stored within Trustzone. Having the victim app execute within Trustzone on a commodity device allows us to evaluate CLKscrew across Trustzone-enforced security boundaries in a practical and realistic manner.
4.2 Timing Profiling
As described in § 3.5, one of the crucial attack steps to ensure reliable delivery of the fault to a victim code execution is finding ideal values of Fpdelay. To guide this parameter discovery process, we need the timing profile of the Trustzone app performing a single AES encryption/decryption operation. ARM allows the use of hardware cycle counter (CCNT) to track the execution duration (in clock cycles) of Trustzone applications [3]. We enable this cycle counting feature within our custom kernel driver. With this feature, we can now measure how long it takes for our Trustzone app to decrypt a single ciphertext, even from the non-secure world.
Attack Enabler (TZ-specific) #5: Execution timing of code running in Trustzone can be profiled with hardware counters that are accessible outside Trustzone.
Using the hardware cycle counter, we track the duration of each AES decryption operation over about 13k invocations in total. Figure 4.1 (left) shows the distribution of the execution length of an AES operation. Each operation takes an average of 840k clock cycles with more than 80%
¹Firmware version is shamu MMB29Q (Feb, 2016)

Figure 4.1: Execution duration (in clock cycles) of the victim and attack threads.
of the invocations taking between 812k to 920k cycles. This shows that the victim thread does not exhibit too much variability in terms of its execution time.
Recall that we want to deliver a fault to specific region of the victim code execution and that the faulting parameter Fpdelay allows us to fine-tune this timing. Here, we evaluate the degree to which the use of no-op loops is useful in controlling the timing of the fault delivery. Using a fixed duration for the fault Fdur, we measure how long the attack thread takes in clock cycles for different values of the pre-fault delays Fpdelay. Figure 4.1 (right) illustrates a distinct linear relationship between Fpdelay and the length of the attack thread. This demonstrates that number of loops used in Fpdelay is a reasonably good proxy for controlling the execution timing of threads, and thus the timing of our fault delivery.
4.3 Fault Model
To detect if a fault is induced in the AES decryption, we add a check after the app invocation to verify that the decrypted plaintext is as expected. Moreover, to know exactly which AES round got corrupted, we add minimal code to track the intermediate states of the AES round and return this as a buffer back to the non-secure environment. A comparison of the intermediate states and their expected values will indicate the specific AES round that is faulted and the corrupted value. With these validation checks in place, we perform a grid search for the parameters for

Normalized frequency Normalized frequency

0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0 1 2 3 4 5 6 7 8
# of faulted AES rounds

0.6 0.5 0.4 0.3 0.2 0.1 0.0 1 3 5 7 9 11 13 15
# of faulted bytes within one round

Figure 4.2: Fault model: Characteristics of observed faults induced by CLKscrew on AES operation.
the faulting frequency, Ffreq_hi and the duration of the fault, Fdur that can induce erroneous AES decryption results. From our empirical trials, we found that the parameters Ffreq_hi = 3.69GHz and Fdur = 680 can most reliably induce faults to the AES operation.
For the rest of this attack, we assume the use of these two parameter values. By varying Fpdelay, we investigate the characteristics of the observed faults. A total of about 360 faults is observed. More than 60% of the faults are precise enough to affect exactly one AES round, as depicted in Figure 4.2 (left). Furthermore, out of these faults that induce corruption in one AES round, more than half are sufficiently transient to cause random corruptions of exactly one byte, shown in Figure 4.2 (right). Being able to induce a one-byte random corruption to the intermediate state of an AES round is often used as a fault model in several physical fault injection works [55, 11].

4.4 Putting it together
Removing use of time anchor. Recall from § 3.5 that CLKscrew may require profiling for a time anchor to improve faulting precision. In this attack, we choose not to do so, because (1) the

algorithm of the AES operation is fairly straightforward (one KeyExpansion round, followed by 10 AES rounds [37]) to estimate Fpdelay, and (2) the execution duration of the victim thread does not exhibit too much variability. The small degree of variability in the execution timing of both the attack and victim threads allows us to reasonably target specific AES rounds with a maximum error margin of one round.
Differential fault attack. Tunstall et al. present a differential fault attack (DFA) that infers AES keys based on pairs of correct and faulty ciphertext [55]. Since AES encryption is symmetric, we leverage their attack to infer AES keys based on pairs of correct and faulty plaintext. Assuming a fault can be injected during the seventh AES round to cause a single-byte random corruption to the intermediate state in that round, with a corrupted input to the eighth AES round, this DFA can reduce the number of AES-128 key hypotheses from the original 2128 to 212, in which case the key can be brute-forced in a trivial exhaustive search. We refer readers to Tunstall et al.'s work [55] for a full cryptanalysis for this fault model.
Degree of control of attack. To evaluate the degree of control we have over the specific round we seek to inject the fault in, we induce the faults using a range of Fpdelay and track which AES rounds the faults occur in. In Figure 4.3, each point represents a fault occurring in a specific AES round and when that fault occurs during the entire execution of the victim thread. We use the ratio of CCN Tattack/CCN Ttarget as an approximation of latter. There are ten distinct clusters of faults corresponding to each AES round. Since CCN Ttarget can be profiled beforehand and CCN Tattack is controllable via the use of Fpdelay, an attacker is able to control which AES round to deliver the fault to for this attack.
Actual attack. Given the faulting parameters, F, AES-128 = {Fvolt = 1.055V, Fpdelay = 200k, Ffreq_hi = 3.69GHz, Fdur = 680, Ffreq_lo = 2.61GHz}, it took, on average, 20 faulting attempts to induce a one-byte fault to the input to the eighth AES round. Given the pair of this faulty plaintext and the expected one, it took Tunstall et al.'s DFA algorithm about 12 minutes on a 2.7GHz quad-core CPU to generate 3650 key hypotheses, one out of which is the AES key stored within Trustzone.

Corrupted AES round

10

9

8

7

6

5

4

3

2

1

0

0.0

0.2

0.4

0.6

0.8

1.0

Cycle length ratio: CCNTattack=CCNTtarget

Figure 4.3: Controlling pre-fault delay, Fpdelay, allows us to control which AES round the fault affects.

5
TZ Attack #2: Loading Self-Signed Apps
In this case study, we show how CLKscrew can subvert the RSA signature chain verification ­ the primary public-key cryptographic method used for authenticating the loading of firmware images into Trustzone. ARM-based SoC processors use the ARM Trustzone to provide a secure and isolated environment to execute security-critical applications like DRM widevine [21] trustlet¹ and key management keymaster [19] trustlet. These vendor-specific firmware are subject to
¹Apps within Trustzone are sometimes referred to as trustlets.
25

regular updates. These firmware update files consist of the updated code, a signature protecting the hash of the code, and a certificate chain. Before loading these signed code updates into Trustzone, the Trusted Execution Environment (TEE) authenticates the certificate chain and verifies the integrity of the code updates [47].
RSA Signature Validation. In the RSA cryptosystem[50], let N denote the modulus, d denote the private exponent and e denote the public exponent. In addition, we also denote the SHA-256 hash of code C as H(C) for the rest of the section. To ensure the integrity and authenticity of a given code blob C, the code originator creates a signature Sig with its RSA private key: Sig  (H(C))d mod N . The code blob is then distributed together with the signature and a certificate containing the signing modulus N . Subsequently, the code blob C can be authenticated by verifying that the hash of the code blob matches the plaintext decrypted from the signature using the public modulus N : Sige mod N == H(C). The public exponent is typically hard-coded to 0x10001; only the modulus N is of interest here.
Threat model. The goal of the attacker is to provide an arbitrary attack app with a selfsigned signature and have the TEE successfully authenticate and load this self-signed app within Trustzone. To load apps into Trustzone, the attackers can invoke the TEE to authenticate and load a given app into Trustzone using the QSEOS_APP_START_COMMAND [44] Secure Channel Manager² command. The attacker can repeatedly invoke this operation, but only from the non-secure environment.
5.1 Trustzone Signature Authentication
To formulate a CLKscrew attack strategy, we first examine how the verification of RSA signatures is implemented within the TEE. This verification mechanism is implemented within the bootloader firmware. For the Nexus 6 in particular, we use the shamu-specific firmware image (MOB31S, dated Jan 2017 [20]), downloaded from the Google firmware update repository.
²This is a vendor-specific interface that allows the non-secure world to communicate with the Trustzone secure world.

Algorithm 1 Given public key modulus N and exponent e, decrypt a RSA signature S. Return

plaintext hash, H.

1: procedure DecryptSig(S, e, N )

2:

r  22048

3: R  r2 mod N

4: Nrev  FlipEndianness(N ) 5: r-1  ModInverse(r, Nrev) 6: f ound_f irst_one_bit  f alse

7: for i  {bitlen(e) - 1 .. 0} do

8:

if f ound_f irst_one_bit then

9:

x  MontMult(x, x, Nrev, r-1)

10:

if e[i] == 1 then

11:

x  MontMult(x, a, Nrev, r-1)

12:

end if

13:

else if e[i] == 1 then

14:

Srev  FlipEndianness(S)

15:

x  MontMult(Srev, R, Nrev, r-1)

16:

ax

17:

f ound_f irst_one_bit  true

18:

end if

19: end for

20: x  MontMult(x, 1, Nrev, r-1) 21: H  FlipEndianness(x)

22: return H

23: end procedure

The RSA decryption function used in the signature verification is the function, DecryptSig³, summarized in Algorithm 1. At a high level, DecryptSig takes, as input, a 2048-bit signature and the public key modulus, and returns the decrypted hash for verification. For efficient modular exponentiation, DecryptSig uses the function MontMult to perform Montgomery multiplication operations [39, 31]. MontMult performs Montgomery multiplication of two inputs x and y with respect to the Montgomery radix, r [31] and modulus N as follows: MontMult(x, y, N, r-1)  x · y · r-1 mod N .
In addition to the use of MontMult, DecryptSig also invokes the function, FlipEndianness, multiple times at lines 4, 14 and 21 of Algorithm 1 to reverse the contents of memory
³DecryptSig loads at memory address 0xFE8643C0. FlipEndianness loads at memory address 0xFE868B20

buffers. FlipEndianness is required in this implementation of DecryptSig because the inputs to DecryptSig are big-endian while MontMult operates on little-endian inputs. For reference, we outline the implementation of FlipEndianness in Algorithm 2.

Algorithm 2 Reverse the endianness of a memory buffer.

1: procedure FlipEndianness(src)

2: d  0

3: dst  {0}

4: for i  {0 .. len(src)/4 - 1} do

5:

for j  {0 .. 2} do

6:

d  (src[i  4 + j] | d)  8

7:

end for

8:

d  src[i  4 + 3] | d

9:

k  len(src) - i  4 - 4

10:

dst[k .. k + 3]  d

11: end for

12: return dst

13: end procedure

5.2 Attack Strategy and Cryptanalysis

Attack overview. The overall goal of the attack is to deliver a fault during the execution of DecryptSig such that the output of DecryptSig results in the desired hash H(CA) of our attack code CA. This operation can be described by Equation 5.1, where the attacker has to supply an attack signature SA, and fault the execution of DecryptSig at runtime so that DecryptSig outputs the intended hash H(CA). For comparison, we also describe the typical decryption operation of the original signature S to the hash of the original code blob, C in Equation 5.2.

Attack : DecryptSig(SA, e, N ) -f-a-ult H(CA)

(5.1)

Original : DecryptSig(S, e, N ) --- H(C)

(5.2)

For a successful attack, we need to address two questions: (a) At which portion of the runtime execution of DecryptSig(SA, e, N ) do we inject the fault? (b) How do we craft SA to be used

as an input to DecryptSig?
5.2.1 Where to inject the runtime fault?
Target code of interest. The fault should target operations that manipulate the input modulus N , and ideally before the beginning of the modular exponentiation operation. A good candidate is the use of the function FlipEndianness at Line 4 of Algorithm 1. From experimentation, we find that FlipEndianness is especially susceptible to CLKscrew faults. We observe that N can be corrupted to a predictable NA as follows:
NA,rev f-a-u-lt FlipEndianness(N )
Since NA,rev is NA in reverse byte order, for brevity, we refer to NA,rev as NA for the rest of the section.
Factorizable NA. Besides being able to fault N to NA, another requirement is that NA must be factorizable. Recall that the security of the RSA cryptosystem depends on the computational infeasibility of factorizing the modulus N into its two prime factors, p and q [14]. This means that with the factors of NA, we can derive the corresponding keypair {NA, dA, e} using the Carmichael function in the procedure that is described in Razavi et al.'s work [49]. With this keypair {NA, dA, e}, the hash of the attack code CA can then be signed to obtain the signature of the attack code, SA  (H(CA))dA mod NA.
We expect the faulted NA to be likely factorizable due to two reasons: (a) NA is likely a composite number of more than two prime factors, and (b) some of these factors are small. With sufficiently small factors of up to 60 bits, we use Pollard's  algorithm to factorize NA and find them [36]. For bigger factors, we leverage the Lenstra's Elliptic Curve factorization Method (ECM) that has been observed to factor up to 270 bits [32]. Note that all we need for the attack is to find a single NA that is factorizable and reliably reproducible by the fault.

5.2.2 How to craft the attack signature SA?
Before we begin the cryptanalysis, we note that the attack signature SA (an input to DecryptSig) is not the signed hash of the attack code, SA (private-key encryption of the H(CA)). We use SA instead of SA primarily due to the pecularities of our implementation. Specifically, this is because the operations that follow the injection of the fault also use the parameter values derived before the point of injected fault. Next, we sketch the cryptanalysis of delivering a fault to DecryptSig to show how the desired SA is derived, and demonstrate why SA is not trivially derived the same way as SA.
Cryptanalysis. The goal is to derive SA (as input to DecryptSig) given an expected corrupted modulus NA, the original vendor's modulus N , and the signature of the attack code, SA. For brevity, all line references in this section refer to Algorithm 1. The key observation is that after being derived from FlipEndianness at Line 4, Nrev is next used by MontMult at Line 15. Line 15 marks the beginning of the modular exponentiation of the input signature, and thus, we focus our analysis here.
First, since we want DecryptSig(SA, e, N ) to result in H(CA) as dictated by Equation 5.1, we begin by analyzing the invocation of DecryptSig that will lead to H(CA). If we were to run DecryptSig with inputs SA and NA, DecryptSig(SA, e, NA) should output H(CA). Based on the analysis of this invocation of DecryptSig, we can then characterize the output, xdesired, of the operation at Line 15 of DecryptSig(SA, e, NA) with Equation 5.3. We note that the modular inverse of r is computed based on NA at Line 5, and so we denote this as rA-1.

xdesired  SA · (r2 mod NA) · rA-1 mod NA

(5.3)

Next, suppose our CLKscrew fault is delivered in the operation DecryptSig(SA, e, N ) such that N is corrupted to NA at Line 4. We note that while N is faulted to NA at Line 4, subsequent instructions continue to indirectly use the original modulus N because R is derived based on the uncorrupted modulus N at Line 3. Herein lies the complication. The attack signature SA passed

into DecryptSig gets converted to the Montgomery representation at Line 15, where both moduli are used:
xfault  MontMult(SA, r2 mod N , NA, rA-1)

We can then characterize the output, xfault, of the operation at the same Line 15 of a faulted DecryptSig(SA, e, N ) as follows:

xfault  SA · (r2 mod N ) · rA-1 mod NA

(5.4)

By equating xfault = xdesired (i.e. equating results from (5.3) and (5.4)), we can reduce the problem to finding SA for constants K = (r2 mod N ) · rA-1 and xdesired, such that:
SA · K mod NA  xdesired mod NA

Finally, subject to the condition that xdesired is divisible by the greatest common divisor of K and NA, denoted as gcd(K, NA), we use the Extended Euclidean Algorithm to solve for the attack signature SA, since there exists a constant y such that SA · K + y · NA = xdesired. In summary, we show that the attack signature SA (to be used as an input to DecryptSig(SA, e, N )) can be derived from N , NA and SA.

5.3 Timing Profiling
Each trustlet app file on the Nexus 6 device comes with a certificate chain of two RSA certificates (and signatures). Before loading an app into Trustzone, the loader will validate the signatures of the two certificates and the metadata that comes with the app [47]. The DecryptSig code that
We empirically observe that gcd(K, NA) = 1 in our experiments, thus making xdesired trivially divisible by gcd(K, NA) for our purpose.
The Extended Euclidean Algorithm is commonly used to compute, besides the greatest common divisor of two integers a and b, the integers x and y where ax + by = gcd(a, b).

decrypts the RSA signature gets invoked four times in total. By incrementally corrupting each certificate and then invoking the loading of the app with the corrupted chain, we measure the operation of validating one signature to take about 270 million cycles on average. We extract the target function FlipEndianness from the binary firmware image and execute it in the non-secure environment to measure its length of execution. We profile its invocation on a 256-byte buffer (the size of the 2048-bit RSA modulus) to take on average 65k cycles.
To show the feasibility of our attack, we choose to attack the fourth invovation of the DecryptSig code during the whole app loading process. This requires a very precise fault to be induced within in a 65k-cycle-long targeted period within an entire chain validation operation that takes 270 million x 4 = 1.08 billion cycles, a duration that is four orders of magnitude longer than the targeted period. Due to the degree of precision needed, it is thus crucial to find a way to determine a reliable time anchor (see Steps 2 / 3 in § 3.5) to guide the delivery of the fault.
Cache profiling To determine approximately which region of code is being executed during the chain validation at any point in time, we leverage side-channel-based cache profiling attacks that operate across cores. Since we are profiling code execution within Trustzone in a separate core, we use recent advances in the cross-core instruction- and data-based Prime+Probe cache attack techniques [33, 24, 61]. We observe that the cross-core profiling of the instruction-cache usage of the victim thread is more reliable than that of the data-cache counterpart. As such, we adapt the instruction-based Prime+Probe cache attack for our profiling stage.
Within the victim code, we first identify the code address we want to monitor, and then compute the set of memory addresses that is congruent to the cache set of our monitored code address. Since we are doing instruction-based cache profiling, we need to rely on executing instructions instead of memory read operations. We implement a loop within the fault injection thread to continuously execute dynamically generated dummy instructions in the cache-set-congruent memory addresses (the P rime step) and then timing the execution of these instructions (the P robe
Another prevalent class of cross-core cache attacks is the Flush+Reload [60] cache attacks. We cannot use the Flush+Reload technique to profile Trustzone execution because Flush+Reload requires being able to map addresses that are shared between Trustzone and the non-secure environment. Trustzone, by design, prohibits that.

`Gap duration', g values

feat_cache2

feat_cache1

k1 k2
Sample ID over time
Figure 5.1: Cache eviction profile snapshot with cache-based features.
step) using the clock cycle counter. We determine a threshold for the cycle count to indicate that the associated cache lines have been evicted. The eviction patterns of the monitored cache set provides an indication that the monitored code address has been executed.
Attack Enabler (TZ-specific) #6: Memory accesses from the non-secure world can evict cache lines used by Trustzone code, thereby enabling Prime+Probe-style execution profiling of Trustzone code.
While we opt to use the Prime+Probe cache profiling strategy in our attack, there are alternate side-channel-based profiling techniques that can also be used to achieve the same effect. Other microarchitectural side channels like branch predictors, pipeline contention, prefetchers, and even voltage and frequency side channels can also conceivably be leveraged to profile the victim execution state. Thus, more broadly speaking, the attack enabler #6 is the presence of microarchitectural side channels that allows us to profile code for firing faults.

Figure 5.2: Observed faults using the timing features.
App-specific timing feature. For our timing anchor, we want a technique that is more fine-grained. We devise a novel technique that uses the features derived from the eviction timing to create a proxy for profiling program phase behavior. First, we maintain a global incrementing count variable as an approximate time counter in the loop. Then, using this counter, we track the duration between consecutive cache set evictions detected by our Prime+Probe profiling. By treating this series of eviction gap duration values, g, as a time-series stream, we can approximate the execution profile of the chain validation code running within Trustzone.
We plot a snapshot of the cache profile characterizing the fourth invocation of the signature validation in Figure 5.1. We observe that the beginning of each certification validation is preceded by a large spike of up to 75,000 in the g values followed by a secondary smaller spike. From experimentation, we found that FlipEndianness runs after the second spike. Based on this observation, we change the profiling stage of the attack thread to track two hand-crafted timing features to characterize the instantaneous state of victim thread execution.
Timing anchor. We annotate the two timing features on the cache profile plot in Figure 5.1. The first feature, feat_cache1, tracks the length of the second spike minus a constant k1. The second feature, feat_cache2, tracks the cumulative total of g after the second spike, until the g > k2. We use a value of k1 = 140 and k2 = 15 for our experiments. By continuously monitoring

values of g after the second spike, the timing anchor is configured to be the point when g > k2. To evaluate the use of this timing anchor, we need a means to assess when and how the
specific invocation of the FlipEndianness is faulted. First, we observe that the memory buffer used to store Nrev is hard-coded to an address 0x0FC8952C within Trustzone, and this buffer is not zeroed out after the validation of each certificate. We downgrade the firmware version to MMB29Q (Feb, 2016), so that we can leverage a Trustzone memory safety violation vulnerability [10] to access the contents of Nrev after the fourth invocation of DecryptSig code. Note that this does not affect the normal operation of the chain validation because the relevant code sections for these operations is identical across version MMB29Q (Feb, 2016) and MOB31S (Jan, 2017).
With this timing anchor, we perform a grid search for the faulting parameters, Ffreq_hi, Fdur and Fpdelay that can best induce faults in FlipEndianness. The parameters Ffreq_hi = 3.99GHz and Fdur = 1 are observed to be able to induce faults in FlipEndianness reliably. The value of the pre-fault delay parameter Fpdelay is crucial in controlling the type of byte(s) corruption in the target memory buffer Nrev. With different values of Fpdelay, we plot the observed faults and failed attempts based on the values of feat_cache1 and feat_cache2 in Figure 5.2. Each faulting attempt is considered a success if any bytes within Nrev are corrupted during the fault.
Adaptive pre-delay. While we see faults within the target buffer, there is some variability in the position of the fault induced within the buffer. In Figure 5.3, each value of Fpdelay is observed to induce faults across all parts of the buffer. To increase the precision in faulting, we modify the fault to be delivered based on an adaptive Fpdelay.
5.4 Fault Model
Based on the independent variables feat_cache1 and feat_cache2, we build linear regression models to predict Fpdelay that can best target a fault at an intended position within the Nrev buffer. During each faulting attempt, Fpdelay is computed only when the timing anchor is detected. To
We are solely using this vulnerability to speed up the search for the faulting parameters. They can be replaced by more accurate and precise side-channel-based profiling techniques.

Figure 5.3: Variability of faulted byte(s) position.
evaluate the efficacy of the regression models, we collect all observed faults with the goal of injecting a fault at byte position 141. Figure 5.4 shows a significant clustering of faults around positions 140 - 148.
More than 80% of the faults result in 1-3 bytes being corrupted within the Nrev buffer. Many of the faulted values suggest that instructions are skipped when the fault occurs. An example of a fault within a segment of the buffer is having corrupted the original byte sequence from 0xa777511b to 0xa7777777.
5.5 Putting it together
We use the following faulting parameters to target faults to specific positions within the buffer: F, RSA = {Fvolt = 1.055V, Fpdelay = adaptive, Ffreq_hi = 3.99GHz, Fdur = 1, Ffreq_lo = 2.61GH z }.
Factorizable modulus NA. About 20% of faulting attempts (1153 out of 6000) result in a successful fault within the target Nrev buffer. This set of faulted N values consists of 805 unique values, of which 38 (4.72%) are factorizable based on the algorithm described in § 5.2. For our attack, we select one of the factorizable NA, where two bytes at positions 141 and 142 are corrupted.

Frequency of faults

30

25

20

15

10

5

0

0

50

100

150

200

250

Position of first faulted byte in the Nrev buffer

Figure 5.4: Histogram of observed faults and where the faults occur. The intended faulted position is 141.

We show an example of this faulted and factorizable modulus in Appendix A.1. Actual attack. Using the above selected NA, we embed our attack signature SA into the
widevine trustlet. Then we conduct our CLKscrew faulting attempts while invoking the selfsigned app. On average, we observe one instance of the desired fault in 65 attempts.

6
Discussion and Related Works
6.1 Applicability to other Platforms
Several highlighted attack enablers in preceding sections apply to other leading architectures. In particular, the entire industry is increasingly moving or has moved to fine-grained energy management designs that separate voltage/frequency domains for the cores. We leave the exploration of these architectures to future research.
Intel. Intel's recent processors are designed with the base clock separated from the other clock domains for more scope of energy consumption optimization [25, 28]. This opens up possibilities of overclocking on Intel processors [62]. Given these trends in energy management design on Intel hardware and the growing prevalence of Intel's Secure Enclave SGX [27], a closer look at whether the security guarantees still hold is warranted.
ARMv8. The ARMv8 devices adopt the ARM big.LITTLE design that uses non-symmetric cores (such as the "big" Cortex-A15 cores, and the "LITTLE" Cortex-A7 cores) in same system [29]. Since these cores are of different architectures, they exhibit different energy consumption characteristics. It is thus essential that they have separate voltage/frequency domains. The use of separate domains, like in the 32-bit ARMv7 architecture explored in this work, expose the 64bit ARMv8 devices to similar potential dangers from the software-exposed energy management mechanisms.
Cloud computing providers. The need to improve energy consumption does not just apply 38

to user devices; this extends even to cloud computing providers. Since 2015, Amazon AWS offers EC2 VM instances [9] where power management controls are exposed within the virtualized environment. In particular, EC2 users can fine-tune the processor's performance using P-state and C-state controls [4]. This warrants further research to assess the security ramifications of such user-exposed energy management controls in the cloud environment.
6.2 Hardware-Level Defenses
Operating limits in hardware. CLKscrew requires the hardware regulators to be able to push voltage/frequency past the operating limits. To address this, hard limits can be enforced within the regulators in the form of additional limit-checking logic or e-fuses [51]. However, this can be complicated by three reasons. First, adding such enforcement logic in the regulators requires making these design decisions very early in the hardware design process. However, the operational limits can only be typically derived through rigorous electrical testing in the postmanufacturing process. Second, manufacturing process variations can change operational limits even for chips of the same designs fabricated on the same wafer. Third, these hardware regulators are designed to work across a wide range of SoC processors. Imposing a one-size-fits-all range of limits is challenging because SoC-specific limits hinder the portability of these regulators across multiple SoC. For example, the PMIC found on the Nexus 6 is also deployed on the Galaxy Note 4.
Separate cross-boundary regulators. Another mitigation is to maintain different power domains across security boundaries. This entails using a separate regulator when the isolated environment is active. This has two issues. First, while trusted execution technologies like Trustzone and SGX separate execution modes for security, the different modes continue to operate on the same core. Maintaining separate regulators physically when the execution mode switches can be expensive. Second, DVFS components typically span across the system stack. If the trusted execution uses dedicated regulators, this implies that a similar cross-stack power management

solution needs to be implemented within the trusted mode to optimize energy consumption. Such an implementation can impact the runtime of the trusted mode and increase the complexity of the trusted code.
Redundancy/checks/randomization. To mitigate the effects of erroneous computations due to induced faults, researchers propose redesigning the application core chip with additional logic and timing redundancy [6], as well as recovery mechanisms [26]. Also, Bar-El et al. suggest building duplicate microarchitectural units and encrypting memory bus operations for attacks that target memory operations [6]. Luo et al. present a clock glitch detection technique that monitors the system clock signal using another higher frequency clock signal [34]. While many of these works are demonstrated on FPGAs [57] and ASICs [54], it is unclear how feasible it is on commodity devices and how much chip area and runtime overhead it adds. Besides adding redundancy, recent work proposes adding randomization using reconfigurable hardware as a mitigation strategy [58].
6.3 Software-Level Defenses
Randomization. Since CLKscrew requires some degree of timing precision in delivering the faults, one mitigation strategy is to introduce randomization (via no-op loops) to the runtime execution of the code to be protected. However, we note that while this mitigates against attacks without a timing anchor (AES attack in § 4), it may have limited protection against attacks that use forms of runtime profiling for the timing guidance (RSA attack in § 5).
Redundancy and checks. Several software-only defenses propose compiling code with checksum integrity verification and execution redundancy (executing sensitive code multiple times) [6, 7]. While these defenses may be deployed on systems requiring high dependability, they are not typically deployed on commodity devices like phones because they impact energy efficiency.

6.4 Subverting Cryptography with Faults
Boneh et al. offer the first DFA theoretical model to breaking various cryptographic schemes using injected hardware faults [15]. Subsequently, many researchers demonstrate physical fault attacks using a range of sophisticated fault injection equipment like laser [16, 17] and heat [22]. Compared to these attacks including all known undervolting [8, 41] and overclocking [13] ones, CLKscrew does not need physical access to the target devices, since it is initiated entirely from software. CLKscrew is also the first to demonstrate such attacks on a commodity device. We emphasize that while CLKscrew shows how faults can break cryptographic schemes, it does so to highlight the dangers of hardware regulators exposing software-access interfaces, especially across security trust boundaries.
6.5 Relation to Rowhammer Faults
Kim et al. first present reliability issues with DRAM memory [30] (dubbed the "Rowhammer" problem). Since then, many works use the Rowhammer issue to demonstrate the dangers of such software-induced hardware-based transient bit-flips in practical scenarios ranging from browsers [23], virtualized environments [49], privilege escalation on Linux kernel [52] and from Android apps [56]. Like Rowhammer, CLKscrew is equally pervasive. However, CLKscrew is the manifestation of a different attack vector relying on software-exposed energy management mechanisms. The complexity of these cross-stack mechanisms makes any potential mitigation against CLKscrew more complicated and challenging. Furthermore, unlike Rowhammer that corrupts DRAM memory, CLKscrew targets microarchitectural operations. While we use CLKscrew to induce faults in memory contents, CLKscrew can conceivably affect a wider range of computation in microarchitectural units other than memory (such as caches, branch prediction units, arithmetic logic units and floating point units).

7
Conclusions
As researchers and practitioners embark upon increasingly aggressive cooperative hardwaresoftware mechanisms with the aim of improving energy efficiency, this work shows, for the first time, that doing so may create serious security vulnerabilities. With only publicly available information, we have shown that the sophisticated energy management mechanisms used in state-of-the-art mobile SoCs are vulnerable to confidentiality, integrity and availability attacks. Our CLKscrew attack is able to subvert even hardware-enforced security isolation and does not require physical access, further increasing the risk and danger of this attack vector.
While we offer proof of attackability in this paper, the attack can be improved, extended and combined with other attacks in a number of ways. For instance, using faults to induce specific values at exact times (as opposed to random values at approximate times) can substantially increase the power of this technique. Furthermore, CLKscrew is the tip of the iceberg: more security vulnerabilities are likely to surface in emerging energy optimization techniques, such as finergrained controls, distributed control of voltage and frequency islands, and near/sub-threshold optimizations.
Our analysis suggests that there is unlikely to be a single, simple fix, or even a piecemeal fix, that can entirely prevent CLKscrew style attacks. Many of the design decisions that contribute to the success of the attack are supported by practical engineering concerns. In other words, the root cause is not a specific hardware or software bug but rather a series of well-thought-out, nevertheless security-oblivious, design decisions. To prevent these problems, a coordinated full
42

system response is likely needed, along with accepting the fact that some modest cost increases may be necessary to harden energy management systems. This demands research in a number of areas such as better Computer Aided Design (CAD) tools for analyzing timing violations, better validation and verification methodology in the presence of DVFS, architectural approaches for DVFS isolation, and authenticated mechanisms for accessing voltage and frequency regulators. As system designers work to invent and implement these protections, security researchers can complement these efforts by creating newer and exciting attacks on these protections.

Bibliography
[1] ARM. Power Management with big.LITTLE: A technical overview. https://community. arm.com/processors/b/blog/posts/power-management-with-big-l ittle-a-technical-overview. 2013.
[2] ARM. "Security Technology - Building a Secure System using TrustZone Technology". In: ARM Technical White Paper (2009).
[3] ARM. c9, Performance Monitor Control Register. http://infocenter.arm.com/help/ index.jsp?topic=/com.arm.doc.ddi0344b/Bgbdeggf.html. Cortex-A8 Technical Reference Manual.
[4] Amazon. Processor State Control for Your EC2 Instance. http://docs.aws.amazon.com/ AWSEC2/latest/UserGuide/processor_state_control.html. Amazon AWS.
[5] Ittai Anati, Shay Gueron, Simon Johnson, and Vincent Scarlata. "Innovative technology for CPU based attestation and sealing". In: Proceedings of the 2nd international workshop on hardware and architectural support for security and privacy (HASP). Vol. 13. 2013.
[6] Hagai Bar-El, Hamid Choukri, David Naccache, Michael Tunstall, and Claire Whelan. "The sorcerer's apprentice guide to fault attacks". In: Proceedings of the IEEE 94.2 (2006), pp. 370­ 382.
[7] Alessandro Barenghi, Luca Breveglieri, Israel Koren, Gerardo Pelosi, and Francesco Regazzoni. "Countermeasures against fault attacks on software implemented AES: effectiveness and cost". In: Proceedings of the 5th Workshop on Embedded Systems Security. ACM. 2010, p. 7.
[8] Alessandro Barenghi, Guido Bertoni, Emanuele Parrinello, and Gerardo Pelosi. "Low voltage fault attacks on the RSA cryptosystem". In: Fault Diagnosis and Tolerance in Cryptography (FDTC), 2009 Workshop on. IEEE. 2009, pp. 23­31.
45

[9] Jeff Barr. Now Available - New C4 Instances. https://aws.amazon.com/blogs/aws/nowavailable-new-c4-instances/. Jan. 2015.
[10] Sean Beaupre. TRUSTNONE - Signed comparison on unsigned user input. http://theroot. ninja/disclosures/TRUSTNONE_1.0-11282015.pdf.
[11] Alexandre Berzati, Cécile Canovas, and Louis Goubin. "Perturbating RSA public keys: An improved attack". In: International Workshop on Cryptographic Hardware and Embedded Systems (CHES). Springer. 2008, pp. 380­395.
[12] Eli Biham, Yaniv Carmeli, and Adi Shamir. "Bug attacks". In: Annual International Cryptology Conference. Springer. 2008, pp. 221­240.
[13] Johannes Blömer, Ricardo Gomes Da Silva, Peter Günther, Juliane Krämer, and Jean-Pierre Seifert. "A practical second-order fault attack against a real-world pairing implementation". In: Fault Diagnosis and Tolerance in Cryptography (FDTC), 2014 Workshop on. IEEE. 2014, pp. 123­136.
[14] Dan Boneh. "Twenty years of attacks on the RSA cryptosystem". In: Notices of the American Mathematical Society (AMS) 46.2 (1999), pp. 203­213.
[15] Dan Boneh, Richard A. DeMillo, and Richard J. Lipton. "On the Importance of Checking Cryptographic Protocols for Faults". In: Proceedings of the 16th Annual International Conference on Theory and Application of Cryptographic Techniques. EUROCRYPT'97. SpringerVerlag, 1997, pp. 37­51. isbn: 3-540-62975-0. url: http://dl.acm.org/citation.cfm? id=1754542.1754548.
[16] G. Canivet, P. Maistri, R. Leveugle, J. Clédière, F. Valette, and M. Renaudin. "Glitch and Laser Fault Attacks onto a Secure AES Implementation on a SRAM-Based FPGA". In: Journal of Cryptology 24.2 (2011), pp. 247­268. issn: 1432-1378. doi: 10.1007/s00145-010-9083-9. url: http://dx.doi.org/10.1007/s00145-010-9083-9.
[17] Christoph Dobraunig, Maria Eichlseder, Thomas Korak, Victor Lomné, and Florian Mendel. "Statistical Fault Attacks on Nonce-Based Authenticated Encryption Schemes". In: Advances in Cryptology ­ ASIACRYPT 2016: 22nd International Conference on the Theory and Application of Cryptology and Information Security, Hanoi, Vietnam, December 4-8, 2016, Proceedings, Part I. Ed. by Jung Hee Cheon and Tsuyoshi Takagi. Berlin, Heidelberg: Springer Berlin Heidelberg, 2016, pp. 369­395. isbn: 978-3-662-53887-6. doi: 10.1007/978-3-66253887-6_14. url: http://dx.doi.org/10.1007/978-3-662-53887-6_14.
[18] Jake Edge. KS2012: ARM: Secure monitor API. https://lwn.net/Articles/513756/. Aug. 2012.

[19] Jan-Erik Ekberg and Kari Kostiainen. Trusted Execution Environments on Mobile Devices. https://www.cs.helsinki.fi/group/secures/CCS-tutorial/tutorial-slides. pdf. ACM CCS 2013 tutorial. Nov. 2013.
[20] Firmware update for Nexus 6 (shamu). https://dl.google.com/dl/android/aosp/ shamu-mob31s-factory-c73a35ef.zip. Factory Images for Nexus and Pixel Devices.
[21] Google. Multiplatform Content Protection for Internet Video Delivery. https : / / www . widevine.com/wv_drm.html. Widevine DRM.
[22] Sudhakar Govindavajhala and Andrew W. Appel. "Using Memory Errors to Attack a Virtual Machine". In: Proceedings of the 2003 IEEE Symposium on Security and Privacy (S&P), pp. 154­165.
[23] Daniel Gruss, Clémentine Maurice, and Stefan Mangard. "Rowhammer. js: A remote software-induced fault attack in javascript". In: Detection of Intrusions and Malware, and Vulnerability Assessment. Springer, 2016, pp. 300­321.
[24] Daniel Gruss, Raphael Spreitzer, and Stefan Mangard. "Cache Template Attacks: Automating Attacks on Inclusive Last-Level Caches". In: 24th USENIX Security Symposium (USENIX Security 15). Washington, D.C.: USENIX Association, 2015, pp. 897­912.
[25] Per Hammarlund, Rajesh Kumar, Randy B Osborne, Ravi Rajwar, Ronak Singhal, Reynold D'Sa, Robert Chappell, Shiv Kaushik, Srinivas Chennupaty, Stephan Jourdan, et al. "Haswell: The fourth-generation Intel core processor". In: IEEE Micro 2 (2014), pp. 6­20.
[26] Nguyen Minh Huu, Bruno Robisson, Michel Agoyan, and Nathalie Drach. "Low-cost recovery for the code integrity protection in secure embedded processors". In: HardwareOriented Security and Trust (HOST), 2011 IEEE International Symposium on. IEEE. 2011, pp. 99­104.
[27] Intel. Intel Software Guard Extensions (Intel SGX). https://software.intel.com/enus/sgx.
[28] Intel. The Engine for Digital Transformation in the Data Center. http : / / www . intel . com / content / dam / www / public / us / en / documents / product - briefs / xeon - e5 brief.pdf. Intel Product Brief.
[29] Brian Jeff. "big.LITTLE system architecture from arm: Saving power through heterogeneous multiprocessing and task context migration". In: Proceedings of the 49th Annual Design Automation Conference (DAC). ACM. 2012, pp. 1143­1146.
[30] Y. Kim, R. Daly, J. Kim, C. Fallin, J. H. Lee, D. Lee, C. Wilkerson, K. Lai, and O. Mutlu. "Flipping bits in memory without accessing them: An experimental study of DRAM disturbance

errors". In: 2014 ACM/IEEE 41st International Symposium on Computer Architecture (ISCA). June 2014, pp. 361­372.
[31] Cetin Kaya Koc. High-speed RSA implementation. Tech. rep. Technical Report, RSA Laboratories, 1994.
[32] Hendrik W Lenstra Jr. "Factoring integers with elliptic curves". In: Annals of mathematics (1987), pp. 649­673.
[33] Moritz Lipp, Daniel Gruss, Raphael Spreitzer, Clementine Maurice, and Stefan Mangard. "ARMageddon: Cache Attacks on Mobile Devices". In: 25th USENIX Security Symposium (USENIX Security 16). Austin, TX, 2016, pp. 549­564.
[34] Pei Luo, Chao Luo, and Yunsi Fei. System Clock and Power Supply Cross-Checking for Glitch Detection. Cryptology ePrint Archive, Report 2016/968. http : / / eprint . iacr . org / 2016/968. 2016.
[35] MSM Subsystem Power Manager (spm-v2). https : / / android . googlesource . com / kernel/msm.git/+/android- msm- shamu- 3.10- lollipop- mr1/Documentation/ devicetree/bindings/arm/msm/spm-v2.txt. Git at Google.
[36] Alfred J. Menezes, Scott A. Vanstone, and Paul C. Van Oorschot. Handbook of Applied Cryptography. 1st. Boca Raton, FL, USA: CRC Press, Inc., 1996. isbn: 0849385237.
[37] Frederic P. Miller, Agnes F. Vandome, and John McBrewster. Advanced Encryption Standard. Alpha Press, 2009. isbn: 6130268297, 9786130268299.
[38] Mobile Hardware Stats 2016-09. http : / / hwstats . unity3d . com / mobile / cpu . html. Unity. Sept. 2016.
[39] Peter L Montgomery. "Modular multiplication without trial division". In: Mathematics of computation 44.170 (1985), pp. 519­521.
[40] Nexus 6 Qualcomm-stipulated OPP. https : / / android . googlesource . com / kernel / msm / + / android - msm - shamu - 3 . 10 - lollipop - mr1 / arch / arm / boot / dts / qcom / apq8084.dtsi. Git at Google.
[41] Colin O'Flynn. Fault Injection using Crowbars on Embedded Systems. Tech. rep. IACR Cryptology ePrint Archive, 2016.
[42] Venkatesh Pallipadi and Alexey Starikovskiy. "The ondemand governor". In: Proceedings of the Linux Symposium. Vol. 2. 00216. sn. 2006, pp. 215­230.
[43] David A. Patterson and John L. Hennessy. Computer Architecture: A Quantitative Approach. San Francisco, CA, USA: Morgan Kaufmann Publishers Inc., 1990. isbn: 1-55880-069-8.

[44] QSEECOM source code. https : / / android . googlesource . com / kernel / msm / + / android-msm-shamu-3.10-lollipop-mr1/drivers/misc/qseecom.c. Git at Google.
[45] Qualcomm Krait PMIC frequency driver source code. https://android.googlesource. com/kernel/msm/+/android-msm-shamu-3.10-lollipop-mr1/drivers/clk/qcom/ clock-krait.c. Git at Google.
[46] Qualcomm Krait PMIC voltage regulator driver source code. https : / / android . googlesource.com/kernel/msm/+/android- msm- shamu- 3.10- lollipop- mr1/ arch/arm/mach-msm/krait-regulator.c. Git at Google.
[47] Qualcomm. Secure Boot and Image Authentication - Technical Overview. https: / / www . qualcomm.com/documents/secure-boot-and-image-authentication-technicaloverview. Oct. 2016.
[48] Qualcomm. Snapdragon S4 Processors: System on Chip Solutions for a New Mobile Age. https://www.qualcomm.com/documents/snapdragon- s4- processors- systemchip-soluti ons-new-mobile-age. July 2013.
[49] Kaveh Razavi, Ben Gras, Erik Bosman, Bart Preneel, Cristiano Giuffrida, and Herbert Bos. "Flip Feng Shui: Hammering a Needle in the Software Stack". In: 25th USENIX Security Symposium (USENIX Security 16). Austin, TX, 2016, pp. 1­18.
[50] Ronald L Rivest, Adi Shamir, and Leonard Adleman. "A method for obtaining digital signatures and public-key cryptosystems". In: Communications of the ACM 21.2 (1978), pp. 120­ 126.
[51] STMicroelectronics. E-fuses. http://www.st.com/en/power-management/e-fuses. html?querycriteria=productId=SC1532. How-swap power management.
[52] Mark Seaborn and Thomas Dullien. "Exploiting the DRAM rowhammer bug to gain kernel privileges". In: Black Hat (2015).
[53] Findlay Shearer. Power Management in Mobile Devices. Newnes, 2011.
[54] Z Stamenkovi, V Petrovi, and G Schoof. "Fault-tolerant ASIC: Design and implementation". In: Facta universitatis-series: Electronics and Energetics 26.3 (2013), pp. 175­186.
[55] Michael Tunstall, Debdeep Mukhopadhyay, and Subidh Ali. "Differential Fault Analysis of the Advanced Encryption Standard using a Single Fault". In: IFIP International Workshop on Information Security Theory and Practices. Springer. 2011, pp. 224­233.
[56] Victor van der Veen, Yanick Fratantonio, Martina Lindorfer, Daniel Gruss, Clementine Maurice, Giovanni Vigna, Herbert Bos, Kaveh Razavi, and Cristiano Giuffrida. "Drammer:

Deterministic Rowhammer Attacks on Mobile Platforms". In: Proceedings of the 2016 ACM SIGSAC Conference on Computer and Communications Security (CCS). 2016. url: https: //vvdveen.com/publications/drammer.pdf.
[57] Rajesh Velegalati, Kinjal Shah, and Jens-Peter Kaps. "Glitch Detection in Hardware Implementations on FPGAs Using Delay Based Sampling Techniques". In: Proceedings of the 2013 Euromicro Conference on Digital System Design. DSD '13. Washington, DC, USA: IEEE Computer Society, 2013, pp. 947­954. isbn: 978-1-4799-2978-8. doi: 10.1109/DSD.2013.107. url: http://dx.doi.org/10.1109/DSD.2013.107.
[58] Bo Wang, Leibo Liu, Chenchen Deng, Min Zhu, Shouyi Yin, and Shaojun Wei. "Against Double Fault Attacks: Injection Effort Model, Space and Time Randomization Based Countermeasures for Reconfigurable Array Architecture". In: IEEE Transactions on Information Forensics and Security 11.6 (2016), pp. 1151­1164.
[59] Mark Weiser, Brent Welch, Alan Demers, and Scott Shenker. "Scheduling for Reduced CPU Energy". In: Proceedings of the 1st USENIX Conference on Operating Systems Design and Implementation (OSDI). 1994.
[60] Yuval Yarom and Katrina Falkner. "FLUSH+RELOAD: A High Resolution, Low Noise, L3 Cache Side-Channel Attack". In: 23rd USENIX Security Symposium (USENIX Security 14). 2014, pp. 719­732. isbn: 978-1-931971-15-7.
[61] Xiaokuan Zhang, Yuan Xiao, and Yinqian Zhang. "Return-Oriented Flush-Reload Side Channels on ARM and Their Implications for Android Devices". In: Proceedings of the 2016 ACM SIGSAC Conference on Computer and Communications Security (CCS). 2016.
[62] btarunr. Rejoice! Base Clock Overclocking to Make a Comeback with Skylake. https://www. techpowerup . com / 218315 / rejoice - base - clock - overclocking - to - make - a comeback-with-skylake. TechPowerup. 2015.

Appendix A
A.1 Example Glitch in RSA Modulus
Original Modulus N :
...f35a...
Corrupted Modulus NA:
c44dc735f6682a261a0b8545a62dd13df4c646a5ede482cef85892 5baa1811fa0284766b3d1d2b4d6893df4d9c045efe3e84d8c5d036 31b25420f1231d8211e2322eb7eb524da6c1e8fb4c3ae4a8f5ca13 d1e0591f5c64e8e711b3726215cec59ed0ebc6bb042b917d445288 87915fdf764df691d183e16f31ba1ed94c84b476e74b488463e855 51022021763a3a3a64ddf105c1530ef3fcf7e54233e5d3a4747bbb 17328a63e6e3384ac25ee80054bd566855e2eb59a2fd168d3643e4 4851acf0d118fb03c73ebc099b4add59c39367d6c91f498d8d607a f2e57cc73e3b5718435a81123f080267726a2a9c1cc94b9c6bb681 7427b85d8c670f9a53a777511b
Factors of NA:
0x3, 0x11b, 0xcb9, 0x4a70807d6567959438227805b12a19a73 4365bd998c6a6f7dfd595360ed3bae4d765170d5afb7f425fddb21 91c3f902c5d049dc745b339e884a601e17e081f2faca0b2ea70e64 8b09176143a9ff745a46497b1b30fc8b378ac7d05f46eaceb41b99 47ffca9a810d4e80baf2f3b03236ab6f243de50976d91eaeb25cc3 9b083c796bd34b66e6c3a0c65c26a30e447cda7b51c556b1842ea6 86e148dfa521bbd1fea2357ad7d151511979fea097c92e4a75b707 f6525a020eca181b1976f31f408547c9557f6b7cd74334147a5b41 ee70a8abf377dd5ba6d85cefa9edaf9af2052f403669675464ed3d 1cff75000d2f33ef0d31124b88f83b5690ae3a3883
Public Exponent e:
0x10001
Private Exponent dA:
04160eecc648a3da19abdc42af4cfb41a798e5eb8b1b49c2c29...
51

