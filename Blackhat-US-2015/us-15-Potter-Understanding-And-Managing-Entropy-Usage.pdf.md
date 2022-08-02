Managing  and   Understanding   Entropy  Usage
Bruce  Potter bpotter@keywcorp.com ||   gdead@shmoo.com Sasha W  ood swood@keywcorp.com

· Bruce  ­ CTO  KEYW  Corporation,   Founder o  f  The  Shmoo Group
· Sasha ­  Senior  Software E  ngineer,   KEYW  Corporation

· Our  research
­ Funded b  y  Whitewood E  ncryption   Systems i  n  support o  f e  nsuring   the  quality o  f e  ntropy t  hroughout   the  enterprise
­ Supported b  y o  ur i  nterns:   Katherine C  leland, J  eremy   Rennicks, J  eff  Acquaviva
­ Whitewood i  s c  oming o  ut  of   stealth a  t B  lackHat.  Stop b  y  the   booth a  nd p  lay o  ur e  ntropy   generation g  ame

Take the Entropy Challenge! Stop ByBooth 967

· Goal:  Better  understand  and  manage  entropy a  nd   randomness  in  the  enterprise
· Determine  rates  of  Entropy P  roduction  on  various   systems
· Determine  rates  of  Entropy C  onsumption o  f   common  operations
· Determine  correlation  between  entropy d  emand   and  supply o  f  random  data
If  there's  one t  heme  in  the  work  we  did  it's "  no  one r  eally   understands w  hat's  happening w  ith  respect  to  entropy a  nd  
randomness  in  the  enterprise"

# /bin/ls

# openssl genrsa 1024

# /bin/ls

# openssl genrsa 1024

# openssl genrsa 4096 # openssl genrsa 1024

SAME! # openssl genrsa 4096 # openssl genrsa 1024

# openssl genrsa 4096 4096 bit TLS with PFS

# openssl genrsa 4096 4096 bit TLS with PFS

1024 bit TLS (no PFS) 4096 bit TLS with PFS

SAME! 1024 bit TLS (no PFS) 4096 bit TLS with PFS

# /bin/ls

4096 bit TLS with PFS

# /bin/ls

4096 bit TLS with PFS

# /bin/cat

4096 bit TLS with PFS

# /bin/$ANYTHING

4096 bit TLS with PFS

More  on  this  later...

· It's  a  bit  of  a  state o  f  mind...  there  are  several  ways  to   think  about  it
· Entropy is  the  uncertainty  of  an  outcome.   Randomness is  about  the  quality  of  that  uncertainty   from  a  historical  perspective.
· Full  entropy is  100%  random.   · There  are  tests t  hat  measure  entropy.  Randomness  
either   is  or  is  not.   · Entropy has  a  quantity.  Randomness  has  a  quality.

· Random N  umber G  enerators  
are  non--deterministic... o  ften   based o  n  specialized   hardware a  nd p  hysical   processes
· Pseudo R  andom N  umber   Generators A  RE  
deterministic.. B  ut t  hat   doesn't m  ean t  hey  are  bad
­ Tons  of  research  in  this   space,  and  won't  bore   you   with  it  here  (and  either  you   agree  with  the  public   research  or  you  don't)
­ In  a  nutshell,   good   PRNG's   with  good   seeding,   such  as   those  based  on  SHA  hashes   using   a  hardware  RNG,  are   good   for  ~2^48  BLOCKS   without   reseeding

Source:  NIST 8  00--90A

· An  analogy  is  helpful  to  understand  how  entropy   relates  to  PRNG's.    We're  in  Vegas,  so  think  of  a   deck  of  cards...  a  REALLY  big  deck  of  cards
­ Entropy g  eneration  is  the  act  of  shuffling  cards ­ The  PRNG  is  the  act  of  dealing  the  deck ­ The  deal  is  clearly  deterministic,  however... ­ The  better  the  shuffling,  the  more  random  the  deal  
will  be
· In  summary,  the  better t  he  entropy,  the  better   the  PRNG  will  perform

Entropy Sources Interrupts Disk I/O
Mouse/Keyboard Hardware RNG's Userland Entropy
Other

Update entropy estimate

Kernel Pool

Entropy "cleanup" and tracking

PRNG PRNG

/dev/random /dev/urandom

Application
OpenSSL PRNG

Application

Update entropy estimate

· Time/Date  (VERY  low  entropy) · Disk  IO · Interrupts   · LSB  from  network  activity  /  inter  arrival  time · Keyboard  input · Mouse  movements

Sources of E  ntropy Thermal Noise   Atmospheric Noise A/D conversion  Noise Beam  Splitting Quantum Shot  Noise Lava L  amps

Implementations
Ivy Bridge  (Thermal  Noise)  ­ Intel  integrated  hardware  into  Ivy   Bridge  Chipsets  (access v  ia   RDRAND)  
Entropy K  ey (  Shot Noise)  ­ Simtec's USB c  onnected  entropy   generator
BitBabbler et  al  (Shot Noise)
Whitewood  et  al  (Quantum)
Lavarand (Lava L  amp) ­ Developed   by  SGI.  Uses  images   of  Lava L  amp  to  find   entropy

· Entropy  production  rates  for  various  use  cases  in   virtual  machine
­ 5  runs  @  300  seconds e  ach

Use  Case Unloaded Apache  with  10  reqs/s Apache  with 50  reqs/s Pinged every  .1s Pinged   every  .001s Heavy Disk  IO Unloaded with  HAVEGED Pinged every  .1s  with  HAVEGED Pinged every  .0001s  with  HAVEGED Heavy  Disk IO w  ith  HAVEGED

Entropy P  roduction Rate 1.94  bits/s 3.85  bits/s 5.56  bits/s 2.2  bits/s 3.77  bits/s 3.26  bits/s 9.08 bits/s 9.17  bits/s 12.6  bits/s 9.09  bits/s

· Linux m  aintains a  n e  ntropy p  ool w  here e  ntropy i  s   stored f  or u  se  by /dev/random and   /dev/urandom
· Data f  rom  entropy s  ources m  ay  have b  ias t  hat's   removed v  ia  whitening
· Note o  n  entropy e  stimation... t  here i  s n  o   absolutely c  orrect m  easure o  f  entropy i  n t  he p  ool   so  the  kernel  makes  an  estimation
­ A  polynomial   analysis  is  done   on  incoming   events   to  see  how  "surprising"  the  event  is. I  f  it's  REALLY   surprising,   you  get  a  good   bump   in  entropy.  If  it's   not,   you  don't   get  much.
· The /dev/random and /  dev/urandom pools a  re g  enerally c  lose  to  zero. E  ntropy i  s f  ed   from  the  main p  ool w  hen n  ecessary.
· Pool c  an  be  queried f  or a  n  approximation o  f h  ow   much  entropy i  s a  vailable   (/proc/sys/kernel/random/entropy_a vail).  Value r  eturned i  s  from t  he  main p  ool.
· Pool i  s  normally 4  096  bits.  Can b  e  increased (  but   unlikely t  o b  e  needed)

Whitening

PRNG (Main pool)
entropy est.

PRNG (/dev/ urandom)
entropy est.

PRNG (/dev/ random) entropy est.

· /dev/random
­ Provides   output   that  is  roughly   1:1  bits  of  entropy   to  bits  of  random   number
­ Access  depletes  kernel  entropy   estimation
­ Blocks  if  entropy  pool   is  depleted   and  waits
· /dev/urandom
­ Never  blocks
­ Will  reduce  entropy   estimation  IF  sizeof($request)   <  (Entropy  estimation  ­ 128   bits)...   and  only   will  reduce  estimation  down  to  128  bits
­ Will  not  reduce  entropy   estimation  from  the  pool   if  the  pool   is  less  than  192   bits  (64bits  is  minimum   amount  of   entropy  to  be  provided)
­ Each r  ead  produces  a  hash  which  is  immediately  fed  back  in  to  the  pool ­ For  most  (all)  purposes   /dev/urandom is  fine  (if   used  correctly...  ie:  you  
check  to  see  if  you  actually  got  entropy)
· get_random_bytes()
­ Call  for  the  kernel   to  access t  he  entropy  pool   without   going   through   the   character d  evices
­ Just  a  wrapper  to  access t  he  non--blocking   pool   just  like  /dev/urandom

· C  rand() ­ A  Linear  Congruential Generator.  The  same   seed  results  in  the  same  output.    And  if  you  know  two   consecutive  outputs,  you  know  all  outputs
­ https://jazzy.id.au/2010/09/20/cracking_random_number_gen erators_part_1.html
· Python  random.py ­ Implements  a  Mersenne Twister.   Better  than  rand() but  still  not  suitable  for  crypto   (624  consecutive  outputs  gives  up  everything)
­ https://jazzy.id.au/2010/09/22/cracking_random_number_gen erators_part_3.html

# cat /proc/sys/kernel/random/entropy_avail 882 # cat /proc/sys/kernel/random/entropy_avail 777 # cat /proc/sys/kernel/random/entropy_avail 672 # cat /proc/sys/kernel/random/entropy_avail 567
This  is  an  unloaded s  erver...  almost  no  activity.   What's  going  on h  ere?

· ...including  at  process  start  time.  For  ASLR,  KCMP,  and  other   aspects  of  fork/copy_process(),  the  kernel  can   consume  up  to  256  bits  of  entropy  each  time  you  start  a   process
· Not  consistent,  still d  oing  research.  
· In  our  observation,  the  pool  was  never  maxed  out,  and  in   general  was  never  above  25%  full
· Calls  to  /dev/urandom were  often  close  enough  to  the   192  bit  cutoff  that  even  though  data  was  returned,  no   entropy  was  removed  from  the  pool
· Even  without  doing  "crypto"  there  is  constant  pressure  on   the  entropy  pool  due  to  OS  activities
­ Makes  it  even  harder t  o  get  good  seeds  for  cryptographic   operations.

· OpenSSL maintains  its  OWN  PRNG  that  is  seeded   by  data  from  the  kernel
· This  PRNG  is  pulled  from  for  all  cryptographic   operations  including
­ Generating  long  term  keys ­ Generating  ephemeral/session  keys ­ Generating  nonces
· Draws  against  this  PRNG  are  not  known  about  by   kernel  and  are  not  tracked  outside  of  OpenSSL

· OpenSSL only   seeds  its  internal   PRNG  once  per  runtime
· No  problem   for  things   like   openssl genrsa 1024
· Different  situation  for  long   running   daemons   that  link  to   openssl...   like  webservers
· Our  data s  hows  that  an  Apache   PFS  connection  requires   ~300-- 800  bytes  of  random   numbers
­ Nonce  for S  SL  handshake  (28   bytes)
­ EDH  key  generation   (the  rest)
· If  your  Apache  config doesn't   set   limits  on  #  of  connections   per   child,   these  nonces and  keys  will   be  derived  from   the  same  PRNG   that  is  never  reseeded

md_rand.c (openssl): if (!initialized) { RAND_poll(); initialized = 1; }
[[initialized is set back to 0 at exit]]
ssl_engine_init.c (mod_SSL): ssl_rand_seed(base_server, ptemp,
SSL_RSCTX_STARTUP, "Init: ");

· OpenSSL pulls  seed  from  /dev/urandom by  default   (and  stirs  in  other  data  that  is  basically  knowable)
· OpenSSL does  NOT  check  to  see  the  quality  of  the   entropy  when  it  polls  /dev/urandom
­ It  asks  for  32bytes  of  random d  ata  at  init. /dev/urandom will h  appily p  rovide i  t
­ If  entropy e  stimate  is  <384,  only a    limited a  mount  of   entropy i  s  removed f  rom  the  pool
­ If  entropy e  stimate  is  <192,  no e  ntropy i  s  removed  from   the  pool
· This  affects  both  command  line  use  and  library  use  of   OpenSSL.   It  does  not  discriminate.

· mod_SSL is  the  de  facto  mechanism  to  implement   SSL/TLS   in  Apache
· Given  that  SSL  does  not  reseed  in  long  running   processes,  mod_SSL should periodically   reseed
­ Best  practice  according t  o   https://wiki.openssl.org/index.php/Random_Numbers
­ Programs  can  defensively c  all  RAND_poll (somewhat   dangerous  on s  ome  platforms),  RAND_add or   RAND_seed (requires  you t  o  get  a  new  seed  yourself)
· Does  NOT  call  RAND_poll() or  RAND_add()
­ Rather,  mod_SSL attempts  to a  dd  entropy i  tself  to  the   OpenSSL PRNG

· mod_SSL's attempt t  o  generate  entropy  is  not   very  sophisticated. O  n  every  request, i  t  stirs  in
­ Date/time  (4  bytes) ­ PID ­ 256  bytes  off  the  stack
· Date/Time  is  low  resolution  and  guessable · PID  is  a  limited  search  space · 256  bytes  off  the  stack d  oes  not  vary  from  call  
to  call

· Analysis  of  the  256  bytes  from  the  stack
­ mod_SSL is  declaring  an  unsigned c  har[256],  not   zeroizing it,  and  then  reading  the  data  in  that  array  as   part  of  the  attempt t  o  gather  entropy
­ Of  our  ~600k  observations o  f  this  process,  the  array   yielded  4568  unique v  alues  (<8%  of  the  time)
­ Combined w  ith  PID  (which f  or  server  processes  will   always  be  the  same)  and  date  (with o  nly  1  second   resolution),  there i  s  very  little e  ntropy a  dded  through   mod_SSL
· In  summary,  mod_SSL tries  really  hard  but   doesn't  do  much  better t  han  doing  nothing  at  all

· Let's  not  let  nginx off  the  hook...
· nginx does  does  nothing  to  attempt t  o  stir  in   more  entropy
­ Relies  solely  on  OpenSSL's built  in  entropy   decisions

· How  much  entropy  goes  in  to  each  random  byte  you  need?
­ It  depends o  n  what  you're d  oing
· Tested  various  common  actions  in  OpenSSL
­ These  are  averages. P  ublic k  ey  generation c  an  vary  wildly  based   on  how  "lucky"  you  are  when g  enerating  pseudo p  rimes.
­ Assume O  penSSL was  seeded  with  32  bytes  of  entropy. I  n   practice,  the  amount o  f  entropy i  s  likely  lower

Activity RSA  1024  bit  key  gen RSA  2048 bit  key  gen RSA  4096  bit  key  gen Apache  TLS 1024  (no   PFS) Apache TLS  1024  (PFS)

Average R  andom Bytes r  equired 5721  bytes 14694  bytes 139315  bytes 498  bytes 635  bytes

· How  much  entropy  do  you  _really_  need  in   order  to  be  secure
­ Depends  on  your r  isk  threshold  and  types  of   attacks  you  care  about
· Attacks a  gainst  PRNG's  come  in  three  major   forms
­ Control/Knowledge o  f  "enough"  entropy s  ources ­ Knowledge  of  the  internal  state  of  the  PRNG ­ Analysis  of  the  PRNG  through  observed  traffic

· Controlling i  nputs
­ By  default,  kernel   pulls  from   a v  ariety  of   sources  to  create e  ntropy  pool
­ Difficult   to  control  all  of  them,   and  ~256bits   of  entropy  from   any  one  source  CAN   result  in  cryptographically  strong  numbers
· Knowledge o  f  state
­ Internal  state i  s  very  complex,  but  not  impossible   to  understand
­ Amount   of  entropy   in  pool  and  amount   of  entropy  in  the  seed  pulled   from  pool   is  a   good   surrogate  to  know  the  "guessability"  of  the  pool
­ If  you're  pulling   data w  ithout   appreciable  entropy,  you're   putting   yourself  at  risk
· Observing  output
­ According   to  NIST,  you  need  at  least 2  ^48  blocks  of  output
­ Apache  needs  1,000,000   million   bits  of  randomness   per  minute  on  a  fully  loaded   core
­ That's  10,000  years  (give  or  take)  before   NIST t  hinks  you  need  to  reseed
· BUT....
­ NIST's  guidance  assumes  correctness.  What  we've  described   isn't  correct.   Successful  crypto  requires  attention  to  detail.  While  we  don't   know  if  the  issues   we've  talked  about  today  are  exploitable,   they're  certainly  not  good
­ All  things   being  equal,   we'd  be  skeptical  of  the  current  system

· We  created  the  WES  Entropy  Client  as  a  solution  to   the  wild  west  of  entropy g  eneration  and  distribution.
­ Initial r  elease  is  for  OpenSSL
· The  client  allows  users  to:
­ Select  which e  ntropy s  ources  are  used, ­ How  to  use  each  source;  seed  or  stream, ­ Which  PRNG  to  use  and  at  what  security  strength, ­ Provide o  ur  own  PRNG  for  use, ­ How  often  to  re--seed  the  PRNG, ­ Whether  or  not t  o  use  prediction r  esistance,  and ­ View  generation a  nd  consumption s  tatistics.

· Status  quo
­ Does  not  allow  insight   into  the  production   or  consumption   of  entropy. ­ Cannot  block  OpenSSL from  reading   from  /dev/urandom if  no  entropy  has  
been  produced   (startup  on   VM  clone,   etc)
· EGD  
­ Simply   puts  entropy  into  the  kernel  pool,   therefore  all  the  issues  above  apply
· WES  Entropy C  lient  
­ Provides   it's  own  entropy  pool   and  distribution   within  OpenSSL.   ­ Allows  users  to  pick  which  entropy   sources  are  used  and  how  they  are u  sed ­ Will  not  distribute  entropy   until  properly   seeded  if  using   PRNG.

· 2011-- Matt  Mackall,  maintainer o  f r  andom s  ubsystem c  ommitted   code  that  said "  if  you've  got  RDRAND,  use  that  as  sole  source  of   entropy"
· 2012  ­ Theodore T  s'o (re)took c  ontrol o  f  that  part  of  the  kernel  and   added o  ther  sources o  f  entropy b  ack  in
· Spring  2013  ­ Snowden · Fall  2013  ­ A  call  to  remove A  LL  support f  or R  DRAND  from  Linux  
random s  ubsystem (  including o  nline p  etitions a  nd  the  like) · Fall  2013  ­ Linus s  ays  "Where d  o  I  start  a  petition  to  raise t  he  IQ  
and  kernel  knowledge o  f  people?  Guys,  go  read   drivers/char/random.c. T  hen,  learn a  bout  cryptography. F  inally,   come  back  here a  nd  admit  to  the  world t  hat  you  were  wrong.
· "Short  answer: w  e  actually  know  what  we  are  doing. Y  ou  don't."
Given o  ur  findings  on p  rocess  forking v  s.  OpenSSL use,  we're  not  
sure  anyone k  nows  what  they're  doing. S  o, w  e  did  it o  urselves.

· libWesEntropy ­ Replaces   OpenSSL random e  ngine
· WES  Entropy D  aemon ­  Interfaces w  ith  external   entropy s  ources a  nd f  eeds   entropy i  n t  o O  penSSL directly
­ Entropy  sources  can  even   be  network  based.  Entropy   can  be  provided   as a     service  to  libWES clients
· Must  configure O  penSSL to   use  libWES
· Most  software d  oesn't l  ook   at  OpenSSL configuration   and j  ust u  ses  "stock"
­ To  get  mod_SSL integration   with  libWES,  you  have  to   recompile  mod_SSL to  call   OpenSSL so  it  reads   configuration

Generating  a  server  key  and  certificate:

· Currently  available  through  
­ http://whitewoodencryption.com/
· Client  is  under  active  development,  so  please   provide  feedback  and  bug  reports
· Future  plans
­ Integration  with  nginx,  OpenSSH,  and  other  large-- scale  OpenSSL consumers
­ Integration  with  Whitewood's  QRNG  and  Entropy   as  a  Service  offering
­ Focus  on  stability  and  scalability  

· Entropy  use  is  not  well  understood a  nd   managed;  Developers  and  administrators   don't  have  complete o  wnership  so  issues   persist
· OpenSSL has  several  weaknesses i  n  how  it   handles  entropy,  particularly  when  linked  in  to   long  running  processes l  ike  servers
· Need  to  think  about  entropy  lifecycle,  just  like   we  think  about  other  crypto  lifecycles

