Revolting Radios
Get it? It's a pun!

Thanks
Mike Walters Ang Cui Schuyler St. Leger

Taylor Streetman Sergey Bratus Travis Goodspeed

A little background
"One of the things that makes Orwell's '1984' scary is the way it uses technology. In Orwell's dystopia, tech is a one-sided means of control. The powers that be use machines for pervasive surveillance, to weaken your sense of self and to make real change feel impossible. Humans deprived of any private space are uniquely vulnerable, and Big Brother knows it."
- DEF CON 26 theme
"Let's over-commit to that theme."
- Mike & Dominic

Who are we?
Michael Ossmann Founder and CEO of Great Scott Gadgets

Dominic Spill Security Researcher at Great Scott Gadgets

Breadboard SDR

Scenario
We've found that we can reprogram one of Big Brother's telescreens and stream samples from the auxiliary Analog to Digital Converter (ADC) in its microcontroller.
Can we build a radio receiver out of this microcontroller?

Breadboard SDR

When you build a radio in software, you don't need much hardware

Clock Signal Transmitters

Scenario
We need to exfiltrate data from one of Big Brother's air-gapped networks. We have an ally but no radio transmitter inside. Can our ally reprogram a microcontroller on the inside to transmit data over the air?

Toggling IO Pins
Miek's OOK transmitter https://gfycat.com/gifs/detail/cloudyinfamouscapybara
Ang Cui's Funtenna http://www.funtenna.org/CuiBH2015.pdf
Raspberry Pi FM https://github.com/PNPtutorials/FM_Transmitter_RPi3

GreatFET One PLL Transmitter

Real World Radios
Our demonstration target used a frequency deviation of +/-25 kHz and a center frequency of 315.005 MHz.
We transmitted with a frequency deviation of +/-50 kHz at a center frequency of 315.050 MHz, and it worked!

If it oscillates like a radio and emits like a radio
It's a radio

GPIO Pin Receiver

Scenario
Big Brother has updated telescreens to a new version without an Analog to Digital Converter (ADC) and has restricted distribution of ADCs in an effort to prevent improvised radio receivers.
Can we use a General-Purpose I/O (GPIO) pin on a microcontroller to implement a receiver without an ADC?

1 bit ought to be enough for anybody

Direction finder to PSK transmitter

Scenario
Big Brother has deployed pseudo-Doppler direction finders to track down illegal radio transmitters. Can we steal a direction finder and use it as a direction finding countermeasure?

Pseudo-Doppler Direction Finding
Using an antenna switching board, we rapidly change antenna
Pseudo-Doppler Redux, Shmoocon 2018 -
https://archive.org/details/Shmoocon2018/Shmoocon2018-Pseudo-dopplerRedux.mp4

Opera Cake antenna switch

Phase shifting
Switching from one antenna to another that is closer or farther from the other end of the link introduces a phase shift.
Switching from one cable to another that is longer or shorter introduces a phase shift.

Adding phase shifts circumvents pseudo-Doppler

Scenario
Since we can affect the phase, can we use a direction finder to implement a Phase Shift-Keying (PSK) transmitter?

Opera Cake with delay lines for adding phase shifts

An external modulator can add a covert channel

References
https://github.com/greatscottgadgets/greatfet/tree/rfhax https://github.com/mossmann/hackrf
Find us on Twitter: @michaelossmann / @dominicgs

