Defeating a Secure Element with Multiple Laser Fault Injecti
ons


Olivier Hériveaux

Plan

Introduction 
 Microchip ATECC circuit family 
 Context: Coldcard Hardware Wallet

 Sample preparation 

 First observations

EEPROM fault model characterization

Wake Up mechanism evaluation

 
 Construction of a powerful attack primitive




Testing the Read command
Multiple testing campaigns, with 1, 2 and finally 4 faults

 Progressive chip internals discovery 
 Final working attack with 2 faults

Study in complete black box approach!

Previous, current and future work

ATECC508A

ATECC608A

ATECC608B

Evaluated in 2019

Evaluated in 2020

Stay tuned...

Coldcard Wallet

Bitcoin Hardware Wallet 
 Evaluation of the new Mk3 version

STM32L496 Microcontroller

Main firmware

 
 Encrypts/decrypts the Seed




 ATECC6
 08A


 
 Securely stores the Seed (private key)
Unlock through authentification (PIN code)

Desoldering and depackaging

Sample setup for Laser Fault Injection

New study

Optical imaging of the die 

 Infrared camera mounted on microscope
Circuit looks exactly the same as previous generation!

Same circuit, locked functionnalities?

Multiple commercial grades

 Larger market coverage 
 No additional cost

 Industry common practice




Same circuit, new firmware?

Firmware stored in ROM

 Only one mask to modify, limited cost 
 Cannot patch hardware issues 
 
 Update limited to ROM size




New study
ATECC508A attack trial 
 ROM Fault Injection

 CPU instruction modification 
 Did not work

 
 No secret extracted with this attack path

New study

ATECC508A attack trial 
 ROM Fault Injection

 CPU instruction modification 
 Did not work

 No secret extracted with this attack path Search for a new attack path...

Wake Up mechanism investigation

Low power functionality, exits the sleep mode

 Suspicious CPU activity observed 
 
 Guess: access rights caching for later use?




Wake Up power trace

 Circuit wakes up

What's happening there?

Wake Up power trace
5 µs

Fault Injection during Wake Up

Wake Up: some faults obtained
104814 tests
SELF_TEST_ERROR for 1567 trials:
Faults when shooting the EEPROM Works only for specific shooting times

EEPROM characterization

characterization

Wake Up triggers a Self-Test procedure

CRC-16 calculated over configuration data

 Initial guess was wrong 
 Faulting self-test won't unlock access to secrets




EEPROM fault model identified

Configuration in EEPROM is not encrypted

 Transient stuck at zero of fetched data 
 Success probability is 97%




Powerful and reliable attack primitive for next attempts!

Attack plan

1 void read_command(int slot){

2 uint16_t config;

3 eeprom_read(get_config_address(slot), &config, 2);

4

5 if (config & IS_SECRET){

6

// Access denied

7

i2c_transmit(EXECUTION_ERROR);

8

return;

9 }

10

11 // Access granted, fetch the data from EEPROM

12 uint8_t buf[32];

13 eeprom_read(get_data_address(slot), buf, 32);

14 // Send response

15 i2c_transmit(OK, buf);

16 }

Read OK

 Processing begins

Processing ends 

Read OK (averaged)

 Processing begins

Processing ends 

Read EXECUTION_ERROR

 Processing begins

Processing ends 

Read EXECUTION_ERROR (averaged)

 Processing begins

Processing ends 

Power traces comparison

Power traces comparison
EEPROM read 8 x 4 bytes  Diverge
 nce

1 fault

1 fault (averaged)
F1

1 fault (averaged)
F1

Laser effect 

EEPROM read 8 x 4 bytes 
New dive
rgence

Attack plan

1 void read_command(int slot){

2 uint16_t config;

3

4 // First check

5 eeprom_read(get_config_address(slot), &config, 2);

6 if (config & IS_SECRET){

7

i2c_transmit(EXECUTION_ERROR);

8

return;

9 }

10

11 uint8_t buf[32];

12 eeprom_read(get_data_address(slot), buf, 32);

13

14 // Second check

15 eeprom_read(get_config_address(slot), &config, 2);

16 if (config & IS_SECRET){

17

i2c_transmit(EXECUTION_ERROR);

18

return;

19 }

20

21 // Send response

22 i2c_transmit(OK, buf);

23 }

2 faults (averaged)
F1 F2

F1

F2

2 faults (averaged)
F1 F2
EEPROM read?  Diverge
 nce

4 faults (averaged)

F1 F2

F3 F4

F3

F4

Success?
4 faults injected during execution of the Read command OK status and 32 data bytes returned by the chip! Data is incorrect and looks encrypted
...

AES command
ATECC608A new command to encrypt or decrypt using AES Hardware AES-128 Let's have a look...

AES command power trace (averaged)
10 rounds loop

Faulted Read power trace (averaged)
F1 AES is executed

Ah! New hypothesis

Secret files are stored encrypted in EEPROM

Public files are not...




Execution path MUST NOT be the same as for public files

The firmware checks the IS_SECRET flag in EEPROM

to apply decryption or not




Faults F2 and F4 prevents decryption

Attack plan

1 void internal_get_slot_data(int slot, uint8_t* dest){

2 eeprom_read(get_data_address(slot), dest, 32);

3 uint16_t config;

4 eeprom_read(get_config_address(slot), &config, 2); // Don't fault here!

5 if (config & IS_SECRET){

6

aes_decrypt(dest, SOME_INTERNAL_KEY);

7}

8 }

9

10 void read_command(int slot){

11 uint16_t config;

12 // First check

13 eeprom_read(get_config_address(slot), &config, 2);

14 if (config & IS_SECRET){

15

i2c_transmit(EXECUTION_ERROR);

16

return;

17 }

18 // First data fetch

19 uint8_t buf_a[32];

20 internal_get_slot_data(slot, buf_a);

21

22 // Second check

23 eeprom_read(get_config_address(slot), &config, 2);

24 if (config & IS_SECRET){

25

i2c_transmit(EXECUTION_ERROR);

26

return;

27 }

28 // Second data fetch

29 uint8_t buf_b[32];

30 internal_get_slot_data(slot, buf_b);

31

bl

d h ki

Attack plan

}

18 v}oid internal_get_slot_data(int slot, uint8_t* dest){

29 eeprom_read(get_data_address(slot), dest, 32);

130 vouiidnrte1a6d__tcocmomnafnidg(;int slot){

141 ueienptr1o6m_trecaodn(fgiegt;_config_address(slot), &config, 2); // Don't fault here!

152 i/f/ (Fciornsftigch&ecIkS_SECRET){

163 eeaperso_md_erceraydp(tg(edte_scto,nfSiOgM_Ea_dIdNrTeEsRsN(AsLl_oKtE)Y,);&config, 2);

174 i}f (config & IS_SECRET){

185 } i2c_transmit(EXECUTION_ERROR);

196

return;

170 vo}id read_command(int slot){

181 /u/inFti1r6s_t cdoantfaigf;etch

192 u/i/ntF8i_rtstbucfh_eac[k32];

2103 ienetperronma_lr_egaedt(_gselto_tc_odnaftiag(_saldodtr,esbsu(fs_lao)t;), &config, 2);

2114 if (config & IS_SECRET){

2125 //iS2ecc_otnrdancshmeictk(EXECUTION_ERROR);

2136 eerpertoumr_nr;ead(get_config_address(slot), &config, 2);

2147 i}f (config & IS_SECRET){

2158 //iF2icr_sttradnastmaitf(eEtXcEhCUTION_ERROR);

2169 uirnett8u_rtn;buf_a[32];

270 }internal_get_slot_data(slot, buf_a);

281 // Second data fetch

292 u/i/ntS8e_ctonbdufc_hbe[c3k2];

3203 ienetperronma_lr_egaedt(_gselto_tc_odnaftiag(_saldodtr,esbsu(fs_lbo)t;), &config, 2);

3214 if (config & IS_SECRET){

3225 //iD2ocu_btlreanrsemaidt(cEhXeEcCkUiTnIgON_ERROR);

3236 ifr(emteumrcn;mp(buf_a, buf_b, 32)){

3247 } i2c_transmit(EXECUTION_ERROR);

3258 /}/elSseeco{nd data fetch

3269 uinit28c_trbaunfs_mbi[t3(2O]K;, buf_a);

370 }internal_get_slot_data(slot, buf_b);

3381 }

bl

d h ki

Attack plan

}

1111111111222222222233333333311111112222222233112222222332222222311111111112233111111111122222222223323456718989123456789123456789345678901234567890123456789012345678234567890234567890234018901234567890120112345678901012345678901120123456789012345678901

vv}vv}oooouiu/uiuiuieeieiieeieee}ifi/ifififeededdeedeeennnnnppapppappapariii((((ttFtttrrerrrerrereennncccc11i111oosooosoososatttoooo66r666mm_mmm_mm_m_deeennnn__s____d__d__d_d_rrrffffttttttrrerrrerrerecnnniiiieeceeeceececoaaaggggccccccaaraaaraararmlllooooohddydddyddydym___&&&&nnnnne((p(((p((p(pagggfffffcggtgggtggtgtneeeIIIIiiiiikee(eee(ee(e(dtttSSSSgggggttdtttdttdtd(_______;;;;;__e___e__e_eisssSSSSdcscdcsdcscsnlllEEEEaotoaotaotottoooCCCCtn,ntn,tn,n,tttRRRRaffafaffs___EEEE_iSi_iS_iSiSldddTTTTagOgagOagOgOoaaa))))d_M_d_Md_M_Mtttt{{{{daEadaEdaEaE)aaard_drd_rd_d_{(((edIdedIedIdIiiisrNrsrNsrNrNnnnseTeseTseTeTttt(sEs(sE(sEsEssRsssRssRsRsssl(N(l(Nl(N(NlllosAsosAosAsAoootlLltlLtlLlLttt)o_o)o_)o_o_,,,,tKt,tK,tKtK)E))E)E)Euuud,Y,d,Yd,Y,Yiiie)e)e))nnns&;&s&;s&;&;ttttcctctcc888,oo,o,oo___nnnnnttt333fffff***222iiiii)))gggggddd;;;,,,,,eeesss22222ttt))))))));;;;;{{{////////

}}}voiu}}}ifidnir(t2ec1cao6_dn_t_ftrciaogcnmosm&nmafinIitdSg((_;EiSXnEEtCCRUsETlTIo)Ot{N)_{ERROR);

return;

vvvooo/u/i/i/u/uu/i//i/u}iee}iiie}e}i/i/f/f/i/ii/f//f/ineedddeenrrrnnnnntpipipipitrrr((e(e(eFtSFFtFttFFFFter2r2r2r2eeeecctctcti8eii1i11iiii8rococococraaaoououour_crr6r66rrrr_nm_m_m_m_ndddnnrnrnrstoss_s__ssssta_t_t_t_ta___ffnfnfntnttttttttlrrrrrrrrl;;;bbccciiiid_eaeaeaea_uuoooggggcccdcddcdcdganananangffmmmoooachaahahaedsdsdsdse__mmm&&&&nnnthettetett(m(m(m(mtaaaaafffaecaacaca_gigigigi_[[nnnIIIIiiickkksetetetets33dddSSSSgggfkfffflt(t(t(t(l22(((____;;;eeeeeo_E_E_E_Eo]]iiiSSSSttttttcXcXcXcXt;;nnnEEEEccccc_oEoEoEoE_tttCCCChhhhhdnCnCnCnCdRRRRafUfUfUfUasssEEEEtiTiTiTiTtlllTTTTagIgIgIgIaooo))))(_O_O_O_O(ttt{{{{saNaNaNaNs)))ld_d_d_d_l{{{odEdEdEdEotrRrRrRrRt,eReReReR,sOsOsOsObsRsRsRsRbu()()()()ufs;s;s;s;f_llll_aooooa)tttt);))));,,,,

&config, &&ccoonnffiigg,, &config,

2); 22));; 2);

uuu/}iiieiii/nnnernnntttpetttSeeert888errrou___cnnnmrtttoaaa_nnlllr;bbbd___euuugggafffceeed___httt(aaae___g[[[cssse333klllt222ooo_]]]tttc;;;___odddnaaaftttiaaag(((_sssallldooodtttr,,,esbbbsuuu(fffs___laaao)))t;;;), &config, 2);

/u/i/i/u/i/i/u/i/ui/ui}}e}ie}ie}i}i/i/f/f/i/f/f/i/f/if/inenenennerrrrnnnnntiipitpitpitit(l(e((e(e(eStDSStDSStSStSte22r2er2er2e2emmsctctctcte8oee8oee8ee8e8rccocrocrocrcreeeououououc_ucc_ucc_cc_c_n_m_nm_nm_n_nmmnrnrnrnrotbootbootoototat_ta_ta_tata{ccfnfnfnfnnlnnlnnnnnlrrrrrrlrrllrl;;;;bbbbbmmiiiideddeddddd_aaea_ea_ea_a_uuuuuppgggggnnangangangng((fffffdrcdrcdcddessdsedsedsesebb_____&&&&aehaehahaatmm(mt(mt(mtmtuubbbbbtaetaetett_iigi_gi_gi_i_ff[[[[[IIIIadcadcacaasttetsetsetsts33333__SSSSkkkl((t(lt(lt(l(l22222aa____fcfcfffoEO_Eo_Eo_EoEo]]]]],,SSSSeheheeetXKcXtcXtcXtXt;;;;;EEEEtetettt_E,oE_oE_oE_E_bbCCCCcccccccdCnCdnCdnCdCduuRRRRhkhkhhhaUbfUafUafUaUaffEEEEiitTuiTtiTtiTtTt__TTTTnnaIfgIagIagIaIabb))))gg(O__O(_O(_O(O(,,{{{{sNaaNsaNsaNsNsl_)d_ld_ld_l_l33oE;dEodEodEoEo22tRrRtrRtrRtRt)),ReR,eR,eR,R,))OsOsOsOO{{bRsRbsRbsRbRbu)()u()u()u)uf;s;fs;fs;f;f_l_l_l__bobobobb)t)t)t)););););;,,, &&&cccooonnnfffiiiggg,,, 222)));;;

} ////iDD2oocuubbbtlllreeanrrseemaaidddt(ccEhhhXeeEccCkkkUiiiTnnIggON ERROR);

Don't DDDooonnn'''ttt

fault fffaaauuulllttt

here! hhheeerrreee!!!

2 faults OK (averaged)

F1

F3

 Fi
rst access check

2 faults OK (averaged)

F1

F3

 32
 bytes of the file read in EEPROM

2 faults OK (averaged)

F1

F3

 AES first
 block

2 faults OK (averaged)

F1

F3

 AES secon
 d block

2 faults OK (averaged)

F1

F3

 Second acce
 ss check

2 faults OK (averaged)

F1

F3

 32 bytes of the file rea
d in EEPROM (again)

2 faults OK (averaged)

F1

F3

 AES


2 faults OK (averaged)

F1

F3

 Plaintexts comparison


Success!
2 faults injected during Read command Returned data is now correct! Attack is reproducible
Tested on a real Coldcard Mk3 device: Seed recovered successfully 


Difficulties
Averaging traces is not always possible Multiple Fault Injection is difficult With 4 faults: Psuccess = P(F1).P(F2).P(
F3).P(F4) If P(Fi) = 5% Then Psuccess = 1/16
0000 

Parameters of each fault injection must be optimized

Our success rates
P(F1) = 95.8% P(F2) = 91.1% P(F3) = 97.8% P(F4) = 93.5% P(F1).P(F2).P(F3).P(F4) = 79.8%
P(F1).P(F3) = 93.7%

Possible counter-measures
Light sensors Clock jitter, random delays Memory protection with Error Detection Codes
Killcard

Conclusion
ATECC608A vulnerable against Double Laser Fault Injection Old Coldcard Mk3 are vulnerable
Check for you SE version in the devi
ce! Secure Element
JIL High security le
vel Equivalent to EAL6/7 according to
 Microchip Much more resistant than the previous ATECC508A generation But should include more hardware counter-measures 


Thank you!

