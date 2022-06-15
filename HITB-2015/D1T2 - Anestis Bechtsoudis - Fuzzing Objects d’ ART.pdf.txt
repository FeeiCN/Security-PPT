Fuzzing Objects d' ART
Digging%Into%the%New%Android%L%Run3me%Internals% Anes%s&Bechtsoudis&(@anes3sb)%
CENSUS%S.A.%E%anes3s@censusElabs.com%%
Amsterdam%2015%

Who am I

· Security%engineer%at%CENSUS%S.A.%
o Vulnerability%research,%reverse%engineering,%cryptography%and% network%security%
o Lately%focusing%into%researching%access%control,%exploita3on% mi3ga3on%and%integrity%protec3on%techniques%for%mobile%and% embedded%systems%
· Previous%(academic)%research%
o SideEchannel%cryptanalysis%(FPGA%/%embedded%devices)% o Network%protocols%&%implementa3on%stacks%abuse%
· Obsessed%with%vulnerability%hun3ng%challenges%
%

28/5/2015

© 2015 CENSUS S.A.

2

Outline

· Android%L%ART%Run3me%101%
o Bytecode%op3miza3on%&%execu3on%paths% o ART%components,%aZack%surface%&%security%bugs%impact%
· Developing%ART%compiler%fuzzing%toolset%
o Techniques%to%increase%DEX%fuzzer%intelligence% o Feedback%data%used%for%fuzzer%evolu3on%
·Fuzzing%results%
· Q%&%A%

28/5/2015

© 2015 CENSUS S.A.

3

Warning

· Not%aiming%to%fully%cover%
o ART%run3me%func3onality% o DEX,%OAT,%ART%file%formats%details%
· Fuzzing%techniques%not%designed%to%be%generic%
· ART%under%heavy%development%
o OAT%ver.%045%at%5.1.x,%%OAT%ver.%062%at%master%
· Work%in%progress% · No%free%bugs%!%(well,%sort%of)%

28/5/2015

© 2015 CENSUS S.A.

4

Motivation

· ART%security%maturity%
o New%code% o Compilers%hard%to%audit%

· Inves3gate%op3miza3on%techniques%
o Compiler%backends%support%crossEop3miza3ons%
· No%public%research%on%DEX%security%fuzzing%
· Case%study%to%research%Android%L%ecosystem%

28/5/2015

© 2015 CENSUS S.A.

5

Related Work

· dexFuzz%project%(Stephen%Kyle,%ARM)%
o Merged%at%ART%upstream%
· State%of%the%ART:%Exploring%the%New%Android% KitKat%Run3me%(Paul%Sabanal,%HITB2014AMS)%
·Android%Internals:%A%Confec3oner's%Cookbook% (Jonathan%Levin)%
·Introduc3on%to%Android%5%Security%(Lukas% Aron,%Petr%Hanacek)%

28/5/2015

© 2015 CENSUS S.A.

6

ART Runtime 101

28/5/2015

© 2015 CENSUS S.A.

7

Runtime Initialization

28/5/2015

© 2015 CENSUS S.A.

8

ART Components

· dex2oat:%AheadEofETime%(AOT)%compiler%
o Dalvik%bytecode%(DEX)%to%na3ve%code%(OAT)%compila3on% o Generates%ART%image%&%framework%/%userEapps%OAT%
· patchoat:%Relocate%preEop3mized%files%
o ART%image%&%OAT%files%(EEincludeEpatchEinforma3on)% o Delta%patching:%e.g.%ApplyOatPatchesTo(".text",4delta_)4
· dalvikvm:%Spawn%standalone%run3me%
· oatdump:%Image%&%OAT%files%disassembler%
o Our%oatdump++%patches%have%merged%upstream%

28/5/2015

© 2015 CENSUS S.A.

9

ART File Formats

· ART%image%file%(.art)%­%Usually%labeled%boot.art%
o Compacted%heap%of%preEini3alized%classes%&%related%objects%
o Objects%with%absolute%pointers%within%image% o Absolute%pointers%from%methods%in%the%image%to%their%code%in%oat% o Absolute%pointers%from%code%in%oat%to%methods%in%image%
o Is%mapped%before%&%links%with%matching%(boot.)oat%file% o Needs%to%know%where%OAT%will%be%loaded%
· OAT%file%%(.oat)%
o ELF%dynamic%shared%object%(pageEable)% o .rodata%(oatdata),%.text(oatexec,%oatlastword),%.oat_patches% o OAT%methods%can%be%symbolicated%(EEincludeEdebugEsymbols)%%

28/5/2015

© 2015 CENSUS S.A.

10

Bytecode Optimization

28/5/2015

© 2015 CENSUS S.A.

11

Compiler Backends

· Method%is%the%basic%compila3on%unit%
· Quick%(default)%
o MIRGraph:%1%DEX%Op%­%1%MIR%Node%(+pseudo%for%annot.)% o LIRChain:%1%instr%­%1%LIR%Node%(+pseudo%for%annot.)% o Sequence%of%nodes%(sta3c%graphs)%­%two%incompa3ble%IR%
· Op3mizing%
o Under%heavy%development%(EEdumpEcfg,%EEdumpEpasses)% o Delegates%to%Quick%if%it%fails%to%op3mize%method% o Mul3ple%passes%(SSA,%intrinsics,%dead_code,%simplifier,%etc.)% o Dynamic%graph%­%single%IR%
· LLVM%portable%is%no%longer%supported%
%

28/5/2015

© 2015 CENSUS S.A.

12

Bytecode Execution

· Run3me%can%execute%ODEX%(oat):%
o Using%compiled%(op3mized)%na3ve%methods%impl.%(default)% o Interpreter%
o LowEend%devices%(apps%compiled%with%interpretEonly%flag)% o App%debugging%(par3ally%or%fully)%&%VMSafeMode%
o JIT%(under%dev.)%­%Welcome%back%exec.%cache%&%JIT%spraying%

· Run3me%suspend%points%
o Checks%in%generated%code%to%stop%Java%threads%in%safe%way% o Consistency%at%checkpoints%for%na3veEexecu3on,%run3me%&%interpreter%

· Memory%consistency%at%suspend%points%for:%
o Garbage%Collec3on% o Sampling%profiler%(data%collected%at%suspend%points)% o Debugging%(breakpoints):%DeEop3mize%and%switch%to%inter.%thread%%
%

28/5/2015

© 2015 CENSUS S.A.

13

ART Target List

· Compila3on%chains%for%supported%backends%
o Primary%target%for%fuzz%tes3ng%PhaseE1%
· Run3me%ini3aliza3on%
o Planned%as%PhaseE2%target%
· Run3me%execu3on%modes%
o Planned%as%PhaseE3%target% o Will%mainly%focus%into%na3ve%execu3on%paths% o Big%challenge%due%to%huge%parameters%list%

28/5/2015

© 2015 CENSUS S.A.

14

Value of ART Security Bugs

· Big%aZack%surface%
o Java%system%services%&%user%applica3ons%% o system%services%running%ART%executables%(e.g.%installd)%
· Bug%consistency%across%the%board%
o Stakeholders%in%distribu3on%chain%most%probably%won't%modify% ART%components%%
o Maybe%different%exploita3on%requirements%per%system%

· Constantly%improving%Android%security%requiring% chain%of%reliable%bugs%

· Possible%arbitrary%code%exec%at%app%install%3me%

%

28/5/2015

© 2015 CENSUS S.A.

15

Exploiting ART Bugs
· Many%processes%may%link%to%vulnerable%code,% although%trigger%is%not%guaranteed%
· Exploita3on%impact%
o Privilege%escala3on% o SELinux%restric3ons%bypass%(e.g.%write%dalvikEcache)% o Android%permissions%escala3on% o Bypass%3rd%party%sandbox%containers%

28/5/2015

© 2015 CENSUS S.A.

16

Building the Fuzzing Env

28/5/2015

© 2015 CENSUS S.A.

17

Design Primitives

· Fuzzing%target%executable(s)?%

· Target%plaporm%(ARM%vs%x86)?%
o Are%x86%host%tools%a%viable%op3on?% o QEMU%emulator?%

· Fuzzing%strategy?%

o Data%genera3on%

o Corpus%selec3on%

o Monitor,%Debug%&%Triage%tools%/%techniques%

%

28/5/2015

© 2015 CENSUS S.A.

18

Target Executable(s)
· Main%target%is%libartEcompiler%
o dex2oat% o Jit::LoadCompiler%(scoped%for%next%phases)%
· Get%highest%possible%coverage%for%libart%
· Using%dex2oat%binary%as%target%
o Fuzz%test%compila3on%chain%supported%backends% o Input:%DEX%files,%compila3on%&%run3me%serngs%

28/5/2015

© 2015 CENSUS S.A.

19

Target Platform

· OAT%crossEcompile%available%from%host%tools%
o mm%buildEartEhost% o Different%memory%layout%(HAVE_ANDROID_OS)%
o ART%base%&%GC%heap%allocators%configura3on% o Emulated%"ashmem"%
· kRun3meISA%affects%compiler%&%run3me%parameters%%
o Different%instruc3onEsetEfeatures%(mainly%Op3mizing)% o ART%run3me%threads%stack%layout%&%entrypoints%
· Android%QEMU%ARM%emulator%%
o CPU_VARIANT%set%to%generic%affec3ng%compiler%op3ons%% o Very%slow...%

28/5/2015

© 2015 CENSUS S.A.

20

Target Platform

· Majority%of%Android%OS%devices%have%ARM%
o Analysis%closest%to%produc3on%line%setups%
· Nexus%family%ideal%for%onEdevice%fuzzing%%
o Less%effort%for%custom%builds%(specially%against%master)% o Small%Android%L%adop3on%from%other%vendors%
· Fuzzing%lab%with%1%x%N4,%2%x%N5,%1%x%N6%%
o ARM64%out%of%scope%for%now% %

28/5/2015

© 2015 CENSUS S.A.

21

Fuzzing Strategy

· Muta3on%based:%
o Random%(dumb)%fuzzing%(e.g.%honggfuzz,%zzuf)% o BlockEbased%(structureEaware)%fuzzing%(e.g.%SPIKE)% o RulesetEbased%(smart)%fuzzing%(e.g.%Melkor)%

· Genera3on%based:%%
o Model%interference%assisted%(e.g.%PROTOS)%

· Feedback%driven%evolu3onary%(selfElearning)%%%

o Code%coverage%(e.g.%AFL,%LLVM%LibFuzzer)%

o Symbolic%Execu3on%(e.g.%SAGE)%

o Concolic%Execu3on%(e.g.%jFuzz)%

%

28/5/2015

© 2015 CENSUS S.A.

22

The Dumb Story

· Use%codeEcoverage%as%comparison%metric:%
o AOSP%ARM%binaries%built%with%GCC%toolchain%(default)% o U3lize%GCC%coverage%instrumenta3on%(EEcoverage)% o Analyze%data%(gcov,%lcov)%&%compare%against%original%seeds%
· Code%a%quick%DEX%file%muta3on%random%fuzzer%%
o Use%honggfuzz%Android%port%as%base% o Implement%a%CRC%repair%postEmangle%rou3ne%
· Pick%a%random%pool%of%DEX%seed%files%%%
o Execute%for%various%(small)%mangle%ra3os%

28/5/2015

© 2015 CENSUS S.A.

23

The Dumb Story

28/5/2015

© 2015 CENSUS S.A.

24

The Dumb Story

All%5K%dumb%itera3ons%failed%early%

28/5/2015

© 2015 CENSUS S.A.

25

DEX Anatomy 101

· File%Format%Proper3es%
o Basic%types%+%LEB128%(DWARF3Elike)%encoding% o Rela3ve%indexing% o Single%file%for%all%classes%(stripped%redundant%constants)% o 18%basic%sec3ons%(more%encoded%data%types%internally)%
o Not%all%of%them%are%mandatory%(e.g.%annota3ons)% o Order%doesn't%maZer%for%data%sec3ons% o Implicit%size%requiring%items%parsing%(e.g.%codeItems)%
· Members%of%basic%sec3ons%(roughly)%categorized:%
o Index%(Idx)%references% o Rela3ve%offset%references%(usually%to%items%in%data%type%sec3ons)% o Data%placeholders%(usually%of%implicit%size)% o AZribute%metadata%from%predefined%ENUM%lists%

28/5/2015

© 2015 CENSUS S.A.

26

DEX Anatomy 101

28/5/2015

© 2015 CENSUS S.A.

27

Visualizing Challenges
· Many%strong%dependencies%/%references%between%sec3ons% · To%what%extent%&%where%DEX%valida3ons%are%taking%place?%

Systrace%of%dex2oat%with%single%DEX%input%using%QUICK%compiler%%

28/5/2015

© 2015 CENSUS S.A.

28

DEX File Verification L1
· DexFileVerifier::Verify()4­%Any%single%failure%will%abort%compila3on4
o CheckHeader():%Basic%sanity%checks%(CRC,%size,%offsets%range)% o CheckMap():%Verify%mapList%sec3on%(order,%sizes,%data%types,%etc.)% o CheckIntraSecGon():%Sec3ons%structure%(padding,%overlapping,%%size,%etc.)% o CheckInterSecGon():%CrossEsec3on%references%(values%sanity,%ordering,%etc.)%

28/5/2015

© 2015 CENSUS S.A.

29

DEX File Verification L2

· MethodVerifier::VerifyMethod()4
o VerifyInstrucGons():%Code%units%sta3c%analysis,%e.g.:%
o Execu3on%cannot%fall%off%the%end%of%the%code% o Code%does%not%end%in%the%middle%of%the%instruc3on%
o CodeFlowVerifyMethod():%Type%safety%&%codeEflow%errors,%e.g.:%
o Operand%registers%contain%the%correct%type%of%values% o Method%invoca3on%with%correct%arguments%
· Fail%types4
o Early:%Reject%en3re%class%(e.g.%no%superClass)% o Sov:%Compiler%tries,%run3me%reEverify%enforced%(e.g.%except.%handlers)% o Hard:%En3re%class%compila3on%is%aborted%(e.g.%OOR%register%index):%% o Fatal:%(SIG)Abort%compila3on%(e.g.%invalid%method%descriptor)%

28/5/2015

© 2015 CENSUS S.A.

30

Data Generation Goals

· Improve%fuzzing%intelligence%
o BeZer%codeEcoverage%
o CatchEup%with%original%seed%results% o Find%ways%to%improve%
o Increase%DEX%valida3on%success%ra3o%
o Successfully%pass%Level1% o Small%number%of%Early,%Hard%and%Fatal%errors%in%L2%
· Aim%for%good%performance%in%a%limited%env4
o Data%genera3on%should%happen%on%device%
· Keep%in%mind%the%crossEdebug%/%profile%nature%

%

28/5/2015

© 2015 CENSUS S.A.

31

DroidFuzz Framework

· Exis3ng%fuzzing%tools%not%covering%%campaign% needs%
o Lack%of%reliable%ARM%support% o Big%integra3on%effort%for%DEX%file%format% o Small%level%of%control%in%selfElearning%algos%/%config%
o Campaign%has%highly%targeted%nature%in%a%complex%ecosystem%

· DroidFuzz%framework%has%been%created4

o Smart%muta3ons%for%DEX%based%on%set%of%ruleEsets%

o Manual%finite%evolu3on%of%ruleEsets%
o CodeEcoverage%&%hit%counters%as%evalua3on%metrics% o Most%components%designed%to%run%efficiently%on%target%device%

%

28/5/2015

© 2015 CENSUS S.A.

32

Device Level Components

· Data%genera3on%
o Mutate%input%corpus%based%on%provided%ruleEset% o Evaluate%corpus%for%fitness%for%chosen%ruleEset%
· Fuzzer%core4
o Worker%processes%based%on%a%fork()%E%exec()%model% o Crashes%detected%using%POSIX%signals%(SIGSEGV,%SIGBUS,%etc.)%
· PostErunning%helper%tools4
o Crash%Verifier:%Crashes%checked%for%acceptance%ra3o%(>=60%)% o Minimizer:%Smallest%subset%of%changes%from%original%seed% o ptrace%&%capstone%to%create%crashing%frame%fingerprint%

% 28/5/2015

© 2015 CENSUS S.A.

33

ART Signal Handlers
Posix%signals%fuzzing%textbook:%strace%for%custom%handlers%
%

28/5/2015

© 2015 CENSUS S.A.

34

ART Signal Handlers

· art/run3me/fault_handler.cc%
o Special%treat%of%SIGSEGV%in%ART%generated%na3ve%code%
o Sigchain%handlers%to%support%nested%signals%
o Prevent%signal%masking%when%unwinding%generated%code%

· Compiler%fuzzing%not%affected%
o FaultManager::IsInGeneratedCode()%

· Run3me%execu3on%(OAT)%fuzzing%might%be% affected,%depending%on%fuzzing%approach%

· SIGQUIT,%SIGUSR1,%SIGPIPE,%SIGABRT%also%have%

special%handling%by%ART%

%

% 28/5/2015

© 2015 CENSUS S.A.

35

Host Level Components

· AOSP%build%server%(prod.%&%master%branches)%
o ART%gcov%coverage%builds%(learning)% o Default%ART%prod.%serngs%builds%(fuzzing)% o ASAN%debug%(master%only)%builds%(fuzzing%&%analysis)%

· Crashes%classifier4

o Remote%GDB%debugging%with%python%scrip3ng%

o Unique%crashes%signature%hash%

o Frame%fp:%Num,%func3on,%rela3veEPC%(using%ProcFS),%%lib%name% o Major:%0E4%frame%fps,%Minor:%5E9%frame%fps%

%

28/5/2015

© 2015 CENSUS S.A.

36

Major vs Minor Frame FPs

28/5/2015

© 2015 CENSUS S.A.

37

Major vs Minor Frame FPs

28/5/2015

© 2015 CENSUS S.A.

38

Learning Phase

28/5/2015

© 2015 CENSUS S.A.

39

Execution Phase

28/5/2015

© 2015 CENSUS S.A.

40

Rule-sets Evolution

28/5/2015

© 2015 CENSUS S.A.

41

Rule-sets Level-1

· Create%rule%for%every%basic%sec3on%
o 16%in%total%(header%&%mapList%are%excluded)% o Verify%that%input%seeds%contain%examined%sec3on%(fitness)% o Random%muta3ons%within%the%sec3on%range%

· Need%to%extract%(fast)%sec3on%ranges4
o Some%exist%in%header%(stringIds),%some%not%(codeItems)%

· Use%DEX%mapList4
o Entries%contain%start%Off%&%Size%in%items%
o Benefit%for%ordering%to%avoid%size%calcula3ons%(end%==%next_start)%
o PreEparse%&%store%data%for%all%input%seeds%
o Workers%fast%resolve%due%to%fork()%model%%
%

28/5/2015

© 2015 CENSUS S.A.

42

DEX mapList Entries

28/5/2015

© 2015 CENSUS S.A.

43

Learning Phase1 Results

%% Ruleset&

Quick&

Op%mizing&

Lines& Func%ons&Branches& Lines& Func%ons&Branches&

Original%Seeds%

24.80%% 28.80%% 11.30%% 32.60%% 40.30%% 14.20%%

Dumb%

5.60%% 10.60%% 2.00%% 5.60%% 10.60%% 2.00%%

stringIdItems%

23.80%% 28.50%% 10.40%% 31.20%% 39.50%% 13.10%%

typeIdItems%

23.90%% 28.50%% 10.60%% 31.50%% 39.70%% 13.40%%

protoIdItems%

24.70%% 28.80%% 11.20%% 32.30%% 40.10%% 14.00%%

fieldIdItems%

24.70%% 28.80%% 11.20%% 32.20%% 40.10%% 14.00%%

methodIdItems%

24.70%% 28.80%% 11.20%% 32.00%% 39.90%% 13.80%%

classDefItems%

24.80%% 28.80%% 11.30%% 32.40%% 40.10%% 14.10%%

typeList%

24.70%% 28.80%% 11.20%% 32.20%% 40.10%% 13.90%%

annota3onSetRefList%

24.50%% 28.70%% 11.20%% 32.30%% 40.10%% 14.00%%

annota3onSetItems%

24.50%% 28.70%% 11.10%% 31.90%% 39.90%% 13.80%%

classDataItems%

24.50%% 28.70%% 11.00%% 32.10%% 39.90%% 13.80%%

codeItems%

25.10%% 28.90%% 11.40%% 32.80%% 40.30%% 14.30%%

stringDataItems%

24.40%% 28.70%% 10.90%% 32.10%% 40.00%% 13.80%%

debugInfoItems%

24.70%% 28.80%% 11.30%% 32.50%% 40.20%% 14.20%%

annota3onItems%

24.60%% 28.70%% 11.20%% 32.40%% 40.20%% 14.10%%

encodedArrayItems%

24.90%% 28.90%% 11.40%% 32.70%% 40.30%% 14.30%%

annota3onsDirectoryItems% 24.40%% 28.70%% 11.00%% 32.30%% 40.10%% 13.90%%

Code%Coverage%for%5K%itera3ons%/%rule%

28/5/2015

© 2015 CENSUS S.A.

44

Learning Phase1 Results

&&

Quick&

Op%mizing&

Ruleset&

Level1&

Level2&

Level1&

Level2&

&&

PASSED& HARD&FAIL&SOFT&FAIL& PASSED& HARD&FAIL&SOFT&FAIL&

stringIdItems%

0.14%% 0.29%% 7.72%% 0.32%% 0.00%% 5.33%%

typeIdItems%

0.42%% 0.00%% 0.15%% 0.30%% 0.00%% 0.72%%

protoIdItems%

12.64%% 0.00%% 2.58%% 12.14%% 0.00%% 1.78%%

fieldIdItems%

8.72%% 0.06%% 1.06%% 8.60%% 0.06%% 0.72%%

methodIdItems%

6.22%% 0.32%% 1.19%% 6.34%% 0.33%% 1.01%%

classDefItems%

25.18%% 0.02%% 1.27%% 25.46%% 0.02%% 1.03%%

typeList%

4.58%% 0.00%% 1.23%% 4.14%% 0.00%% 1.81%%

annota3onSetRefList%

4.38%% 0.00%% 1.53%% 4.34%% 0.00%% 1.31%%

annota3onSetItems%

0.78%% 0.00%% 10.58%% 0.50%% 0.00%% 8.15%%

classDataItems%

3.82%% 0.12%% 0.77%% 3.76%% 0.08%% 1.91%%

codeItems%

44.02%% 1.11%% 1.32%% 42.52%% 1.08%% 1.58%%

stringDataItems%

6.88%% 0.00%% 1.18%% 7.26%% 0.01%% 0.92%%

debugInfoItems%

45.20%% 0.00%% 1.41%% 46.04%% 0.00%% 1.96%%

annota3onItems%

9.62%% 0.00%% 5.87%% 10.06%% 0.00%% 6.39%%

encodedArrayItems%

55.80%% 0.00%% 1.61%% 55.74%% 0.00%% 1.81%%

annota3onsDirectoryItems% 0.40%% 0.00%% 4.03%% 0.60%% 0.00%% 6.08%%

DEX%verifica3on%success%ra3o%for%5K%itera3ons%/%rule%

28/5/2015

© 2015 CENSUS S.A.

45

Phase1 Observations

· Best%results%from%sec3ons%with%Data%type%items%
o codeItems,%debugInfo,%encodedArray,%annota3onItems%
· Bad%results%from%sec3ons%with%Index%and/or% Offset%type%items%%
o stringIdItems,%typeIdItems,%methodIdItems%
· Avg.%results%from%sec3ons%with%mixed%type%items%%
o classDefItems%
· Failed%so%far%with%annota3on%related%sec3ons%

28/5/2015

© 2015 CENSUS S.A.

46

Phase1 Observations

· Loca3ng%less%valuable%targets%(priority%=%low)%
o debugInfo:%Are%not%parsed%by%the%OAT%compiler%
o Used%by%debugger%&%ELFWriter%if%"--includeEdebugEsymbols"%
o encodedArrayItems:%values%to%ini3alize%sta3c%fields%
o Invoked%during%class%ini3aliza3on% o CompilerDriver%ini3alize%classes,%although%not%directly%affec3ng%
compila3on%parameters%
o Strings%must%be%explicitly%sorted%
o Fuzzing%stringIds%&%stringData%items%requires%reEsor3ng% o No3ceable%performance%overhead% %

28/5/2015

© 2015 CENSUS S.A.

47

Designing Learning Phase2

· Need%to%improve%verifier%success%ra3o%
o Upgrade%rule%intelligence% o For%sec3on%items%with%members%of%type:%
o Index:%InErange%muta3on%of%IDXs%of%matching%reference%type% o Offset:%InErange%muta3on%for%referencing%data%sec3on% o Metadata:%Create%enumera3on%pools%of%valid%data%for%each%type%
· Introduce%structural%muta3ons%for%data%items%
o Instruc3ons%inside%code_items% o Class%data%encoded_method,%encoded_field,%etc.%

28/5/2015

© 2015 CENSUS S.A.

48

Designing Learning Phase2
· Focus%on%code_items%for%maximum%compiler% stressing%
· Dedicated%rules%for%code_items%fuzzing%
o Random%fuzzing%within%instruc3ons%range% o Modify%instruc3ons%opcode% o Shuffle%instruc3ons%within%code_item% o Modify%branches%offset% o Modify%register%numbers%

28/5/2015

© 2015 CENSUS S.A.

49

Designing Learning Phase2

· Accurate%ways%to%detect%verifier%L2%hard%fails%ra3o%
o Use%single%class%corpus%
o CodeEcoverage%eli3sm%(TopE500)%of%split%original%corpus% o Class%/%Method%not%found%error%treated%as%sov%
o Campaign's%L2%hard%hit%counter%will%reflect%rejec3on%%%for%rule%
· Backwards%chain%basic%rules%across%sec3ons%
o Force%mangled%Data%items%picked%always%by%some%Off% o Force%mangled%Off%items%picked%always%by%some%Idx% o AZempt%to%examine%mangled%blobs%under%more%contexts% o Less%performance%cost%in%case%of%seeds%with%small%#classes%

28/5/2015

© 2015 CENSUS S.A.

50

Off + Data Mangle Challenges
· InErange%muta3on%will%most%likely%fail%valida3on%if%not% poin3ng%at%the%beggining%of%encoded%item%
· Items%in%data%sec3ons%follow%strict%structural%rules%

28/5/2015

© 2015 CENSUS S.A.

51

Off + Data Mangle Challenges

· During%seeds%init%phase%(preEparsing):%
o Calculate%the%number%of%items%(count)%in%each%data%sec3on%
o Specially%for%code%items%extract%total%number%of%Instrs%/%file% o BeZer%random%distribu3on%when%instr%fuzzing%
o Store%at%seeds%metadata%
· When%fuzzing,%for%each%worker%process:%
o RNG%uses%target%data%sec3on%items%count%instead%of%size% o Picked%item%IDs%are%sorted%&%passed%to%mangle%rou3ne% o Mangle%rou3ne%scans%once%applying%muta3ons%for%marked%
items%

28/5/2015

© 2015 CENSUS S.A.

52

Chaining Rules

28/5/2015

© 2015 CENSUS S.A.

53

Learning Phase2 Results

· Skipped%evolu3on%for%lessEvaluable%targets% · Eli3st%evolu3on%of%top5%rules%from%phase1%

· Improved%&%chained%annota3on%rules%

&

Quick&

Op%mizing&

Ruleset&

Phase1& Phase2& Phase1& Phase2&

protoIdItems% 12.64%% 12.79%% 12.14%% 13.78%%

fieldIdItems%

8.72%% 31.47%% 8.60%% 32.06%%

methodIdItems% 6.22%% 38.72%% 6.34%% 38.78%%

classDefItems% 25.18%% 37.35%% 25.46%% 37.26%%

codeItems%

44.02%% 92.30%% 42.52%% 97.80%%

annota3ons_chain% E% 22.98%% E% 22.54%%

VFYEL1%success%ra3o%for%5K%iter.%/%ruleEgroup%(random%inner)%

28/5/2015

© 2015 CENSUS S.A.

54

Learning Phase2 Results

· Verifier%level2%hard%fails%are%more%accurately% analyzed%through%single%class%seeds%

&

Quick&

Op%mizing&

Ruleset&

Phase1&

Phase2&

Phase1&

Phase2&

Mul%Class&SingleClass&SingleClass&Mul%Class&SingleClass&SingleClass&

protoIdItems%

0.00%% 0.00%% 0.49%% 0.00%% 0.00%% 0.91%%

fieldIdItems%

0.06%% 22.74%% 38.30%% 0.06%% 17.99%% 35.90%%

methodIdItems%

0.32%% 22.85%% 47.76%% 0.33%% 24.64%% 45.12%%

classDefItems%

0.02%% 0.74%% 15.98%% 0.02%% 0.70%% 17.38%%

codeItems%

1.11%% 86.56%% 15.60%% 1.08%% 86.33%% 15.34%%

annota3ons_chain% E%

E%

1.30%% E%

E%

1.68%%

VFYEL2%hard%fail%ra3o%for%5K%single%class%iter.%/% %ruleEgroup%(random%inner)%

28/5/2015

© 2015 CENSUS S.A.

55

Fuzzing Results

28/5/2015

© 2015 CENSUS S.A.

56

OS Versions

· Android%5.1.x%Release%Build%
o Nexus4,%Nexus5,%Nexus6%
· ART%master%branch%#8e8bb8a%(April%16,%2015)%
o Nexus%5,%Nexus%6% o Coverage%&%ASAN%builds%using%same%commit%
· Device%specific%crash%triggers%
o Nexus%4%vs%Nexus%5/6%
o Different%base%libc%allocator%(dlmalloc%vs%jemalloc)%
o Nexus%5%(2GB%RAM)%vs%Nexus%6%(3GB%RAM)%
o Small%differences%in%heap%layout%affec3ng%fps%(nonEASAN%only)%

28/5/2015

© 2015 CENSUS S.A.

57

5.1.x Unique Crashes

· OPTIMIZING%crashes%not%including%QUICK%
o Compiler%failover%increases%analysis%effort% o Many%QUICK%bugs%discovered%via%OPTIMIZING%fuzzing%
· Need%reliable%way%to%avoid%backend%failover%

Device& && Nexus4% Nexus5% Nexus6%

QUICK&

OPTIMIZING&

Major& Major.Minor& Major& Major.Minor&

22%

34% 17%

24%

31%

49% 23%

28%

36%

52% 26%

32%

28/5/2015

© 2015 CENSUS S.A.

58

Master Unique Crashes

· Not%all%5.1.x%bugs%are%triggered%in%master%(possibly%fixed)%

· ASAN%crashes%addi3onal%to%nonEASAN%master%target%
· OPTIMIZING%crashes%not%including%QUICK%
o Compiler%failover%increases%analysis%effort%
· Increased%#%of%bugs%outside%"art/compiler"%

Device&

QUICK&

OPTIMIZING&

&&

Major& Major.Minor& Major& Major.Minor&

Nexus5%

27%

49% 18%

32%

Nexus5%ASAN% 9%

15% 13%

17%

Nexus6%

32%

58% 14%

23%

Nesus6%ASAN% 13%

25% 9%

13%

28/5/2015

© 2015 CENSUS S.A.

59

General Statistics

· From%instrumenta3on%&%manual%analysis% · Includes%both%5.1.x%&%master%

Bug&Types&QUICK&

2%% 7%% 6%%
41%% 44%%

OOB%Read% OOB%Write% NULLEDeref% UAF% Unknown%

Bug&Types&OPTIMIZING&

1%% 3%%
8%%

33%%

55%%

OOB%Read% OOB%Write% NULLEDeref% UAF% Unknown%

28/5/2015

© 2015 CENSUS S.A.

60

General Statistics

· Discovered%crashes%%%for%current%DEX%rules% · Other%includes%chained%rules%

Crashes&%&
2%% 1%%
3%% 8%%
86%%

codeItems% fieldIdItems% classDefItems% methodIdItems% other%

28/5/2015

© 2015 CENSUS S.A.

61

Summary

· ART%is%a%very%complex%component%
o Requires%security%tes3ng%from%many%angles% o %Large%number%of%execu3on%/%configura3on%parameters%
· Muta3on%rules%evolu3on%
o Level1:%Honor%range%of%DEX%basic%sec3ons% o Level2:%Honor%structural%dependencies%of%item%indexes% o Combine%level2%rules%into%more%complex%chains%
· Feedback%evolu3on%must%consider%DEX%verifier% success%/%fail%results%

28/5/2015

© 2015 CENSUS S.A.

62

Next Steps

· Analyze%discovered%bugs%
o NonEinteres3ng%cases%will%find%their%way%to%report%
· DEX%fuzzer%op3miza3ons%
o Improve%rule%chains%intelligence% o Annota3ons%have%been%poorly%covered%
· Cont.%with%Run3me%init%&%exec%fuzzing%phases%
o Prototype%ELF%OAT%fuzzer%using%Melkor%under%alpha%state% o ART%Image%file%format%fuzzer%under%development%

28/5/2015

© 2015 CENSUS S.A.

63

Next Steps

· Fuzzing%framework%op3miza3ons%
o libbacktrace%/%libunwind%integra3on%for%realE3me%unique% crashes%
o Performance%improvements%(e.g.%preEfork%server%with%Run3me% ini3alized).%You%know%the%cool%stuff%lcamtuf%blogs%about.%
· Examine%alterna3ve%fuzzing%techniques%­%Improve% feedback%analysis%automa3on%
· BeZer%integra3on%with%ASAN%&%other%instr.%tools%
o Hopefully%AOSP%will%start%suppor3ng%ASAN%for%ART% o Examine%clang%Sani3zerCoverage%as%a%faster%gcov%alterna3ve%

28/5/2015

© 2015 CENSUS S.A.

64

References

· MaZeo%Franchin%E%ART's%Quick%Compiler:%an%unofficial%overview%

· Tavis%Ormandy%­%Making%Sovware%Dumber%

· DEX%format%spec:%%
hZps://source.android.com/devices/tech/dalvik/dexEformat.html%

· Android%ART%official%documenta3on:%%
hZps://source.android.com/devices/tech/dalvik/configure.html%

· Michal%Zalewski%E%AFL%Fuzzer:%%
hZp://lcamtuf.coredump.cx/afl/technical_details.txt%

· LLVM%LibFuzzer:%%
hZp://llvm.org/docs/LibFuzzer.html%

· Alejandro%Hernández%E%Melkor%ELF%Fuzzer:%
hZps://github.com/IOAc3ve/Melkor_ELF_Fuzzer% %
%

28/5/2015

© 2015 CENSUS S.A.

65

Questions?

28/5/2015

© 2015 CENSUS S.A.

66

