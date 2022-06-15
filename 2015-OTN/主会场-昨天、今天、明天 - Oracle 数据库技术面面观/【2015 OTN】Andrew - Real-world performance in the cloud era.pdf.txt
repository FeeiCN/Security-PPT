Real  World  Performance  2015
Getting  the  best  out  your O  racle  Investment
Andrew  Holdsworth Real--World  Performance Server  Technologies November  20th,  2015
Copyright  ©  2015,  Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Introductions
Andrew  Holdsworth · 26  Years  at  Oracle · Vice  President  Real  World  Performance
­ Good p  erformance  is  rarely  an  accident ­ Most  people g  et  the  systems  they  deserve ­ Good e  nough  rarely  is,  aspire  for  excellence n  ot  good e  nough.
Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Real--World  Performance  Root  Causes

The  database  is  not  being  used   as  it  was  designed  to  be  used

The  application   architecture/code d  esign  is  sub-- optimal

There  is  a  sub--optimal a  lgorithm   in  the  database

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Where  is  the  Performance  Problem  ?
Perception
DB  Usage  and   Application   Code DB  Internals

Reality

DB  Usage  and   Application   Code
DB  Internals

Focus  is  on  exploring  what  is  going  on  inside t  he   database

Focus  should  be  spent  on  how  the  database i  s   being  used  

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

To  Fix  Root  Causes  Requires  CHANGE
11/24/15 Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

CHANGE   is  scary  and  somebody  will  always  get  upset
11/24/15 Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Are  you  willing  to  be  an  agent  of  CHANGE  ?  
11/24/15 Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Query  Performance

We  got  the  Plan  Wrong

Performance  Excellence

Going   Beyond  Excellence

11/24/15 Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Fundamentals:  Oracle's  Methods  to  Tackle  Star  Query

B*Tree  Indexes  with  Nested  Loop  Joins

Full  Scans  with  Intelligent  Filtering

Bitmap  Indexes   and  the  Star  Transformation

Database I  n-- Memory

Bloom F  ilters

Exadata

Full  Scans  and  In--Memory  Aggregation

Star   Transformation

Database I  n-- Memory

In--Memory   Aggregation

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

10

Bloom  Filters

· Efficient  way  to  filter  data
· Bloom  Filters  created  from   dimension  tables  and  applied   to  fact  table  during  scan
· Utilizes  swap  join   optimization  and  yields  right-- deep  plans
· Filtered  data  is  pipelined  to   hash  joins

Conceived b  y B  urton H  oward B  loom i  n 1  970

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

11

Bloom  Filters
Creating  the  Bloom  Filter

For  dimension   tables,  create a  n   array o  f  bits

00000000000000000000000000000000
Size  estimated  by  NDV  of  join   column   in  dimension   table

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

12

Bloom  Filters
Build
This  example u  ses  3  hash  functions  

As  we s  can  dimension   table,   apply  hash  function(s)   and  turn  
bits  on  (0-->1)

00000100001000000000000001000000

10

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

13

Bloom  Filters
Build

00000100001000010000100001000000

10      20

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

14

Bloom  Filters
Build

00000101001001010010100001000000

10      20      30  

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

15

Bloom  Filters
Build

00000101001011010010100001000000

10      20      30      40

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

16

Bloom  Filters
Bloom  Filter  pushed/passed d  own  

Bits  set  =  number   of   entries  in   bit  array s  et  to  1

00000101001011010010100001000000
Think  of  this  as  a  bit  signature  of   the  join

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

17

Bloom  Filters
Test

Probable   Match

10  

For  each  row  in  fact t  able,  apply   hash  function   to  determine   match

00000101001011010010100001000000

10      20      30      40

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

18

Bloom  Filters
Test

Probable   Match

30    

00000101001011010010100001000000

10      20      30      40

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

19

Bloom  Filters
Test

Definite  No  Match

60

00000101001011010010100001000000

10      20      30      40

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

20

Bloom  Filters
Test

Probable   Match

70

00000101001011010010100001000000

10      20      30      40 In  this  case,  the  match  is  in  fact  a f  alse  positive

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

21

Bloom  Filters

· Goal  is  to  scan  fact  table  and   quickly e  liminate r  ows
· Effective  because  computers a  re   good a  t  bitwise  operations
· More  efficient t  han  hash  joins   alone  because  building a  nd  testing   Bloom F  ilters  is  fast  -->  working   with  bits,  not b  ytes
· Bloom P  runing  uses  same   concepts  and  used  to  quickly   prune  partitions

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

22

Bloom  Filters
Identifying  in  Plans
Bloom  Filter  create Bloom  Filter  use

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

23

Bloom  Filters  and  Swap J  oin  Optimization
Left  Deep  Tree

3

HASH  JOIN

2

HASH  JOIN

SUPPLIER

4

1

HASH  JOIN

DATEDIM

3

1 PART

LINEORDER

2

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

24

Bloom  Filters  and  Swap J  oin  Optimization
...  becomes  a  Right  Deep  Tree

HASH  JOIN

3

1

SUPPLIER

HASH  JOIN

2

2

DATE_DIM

HASH  JOIN

1

3

PART

LINEORDER

4

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

25

Programming  Models  (  How  do  you  buy  TP  )

Column   by  Column   Processing

Row  by  Row P  rocessing

Set  Processing

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Performance  Challenges  in  Component  or  Object  Oriented   Programming  
· Lots  of  Black  boxes  and  Abstractions
­ Unaware  of  Process  Scheduling ­ Unaware  of  Data  Conversion ­ Unaware  of  Stack  traversal  costs
· Inappropriate  Code  Reuse
­ Performance  problems i  n  Batch ­ Unable  to  Scale  with  increased  Data ­ Unable  to  Utilize  extra  Hardware  resources

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

27

SQL  is  Simple! Application

INSERT  /  UPDATE  /  DELETE Put

SELECT Get

Database

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Model  the  Use  Case

Customer

creates views

Order() ValidateOrder() ProcessOrder() FormatOrder()

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Map  the  Objects
Order() ValidateOrder() ProcessOrder() FormatOrder()

Object Relational Mapping

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Deploy  the  Application
Order() ValidateOrder() ProcessOrder() FormatOrder()

ORM

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

I/O
Network Database

Order P  rocess  Response  Time

Network

Application Time

Network

Database Time

End  User Time  Line

Total  User  Response   Time
Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Order P  rocess  Operations

Browser HTML

Network Bytes

Order() JSON

FormatOrder() ProcessOrder() ValidateOrder()

XML

String

Mixed

ORM() Mixed

Network Bytes

Database Mixed

250  ms 50 ms 100  ms

100  ms

100  ms

100  ms 150  ms 50 ms 100  ms

=  1,000  ms

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    | Oracle  Confidential  ­ Internal/Restricted/Highly  Restricted

33

Order P  rocess  Division  of  Work

Order() FormatOrder() ProcessOrder() ValidateOrder() ORM() Browser Database Network

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

34

Reuse--driven  Processing
· OLTP  code  already  implemented  and  tested
­ Business  logic  in t  he  application s  erver ­ Development i  s  expensive ­ Testing  is  expensive

$$$

· Assemble  bulk  process  using  existing  components

· What  could  possibly  go  wrong?

???

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

35

Reuse--driven  Order P  rocess  (N=1)

Batch   Program
N=1

File   I/O bytes

Order() JSON

FormatOrder() ProcessOrder() ValidateOrder ()

XML

String

Mixed

ORM() Mixed

Network Bytes

Database Mixed

40  ms 10  ms

100  ms

100  ms

100  ms

100  ms 150  ms 50  ms 100  ms

=  750  ms

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    | Oracle  Confidential  ­ Internal/Restricted/Highly  Restricted

36

Reuse--driven  Order P  rocess  Division  of  Work
Order() FormatOrder() ProcessOrder() ValidateOrder() ORM() Database File  I/O Network Batch P  rogram

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

37

Reuse--driven  Order P  rocess  (N=1000)

Batch   Program
N=1000

File   I/O bytes

Order() JSON

FormatOrder() ProcessOrder() ValidateOrder ()

XML

String

Mixed

ORM() Mixed

Network Bytes

Database Mixed

40  sec 10  sec

100  sec

100  sec

100  sec

100  sec 150  sec 50  sec 100  sec
=  12.5  minutes

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    | Oracle  Confidential  ­ Internal/Restricted/Highly  Restricted

38

Small  Numbers  and  Large  Multipliers
How  long  does i  t  take  when  processing o  ne  transaction  per  second?

Orders One Thousand Hundred   Thousand Million

Elapsed T  ime  in  Seconds .75 750
75,000 750,000

Wall  Clock T  ime 1  second
12.5  minutes 20.8  hours 8.7  days

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Performance--driven P  rocessing
· Code  using  techniques  that  deliver  performance
­ Arrays ­ Set--based  SQL ­ Database  parallelism ­ Transformation
· This  may  not  match  the  techniques  used  to  develop  other  aspects   of  the  application

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

40

Data  Growth

Victims  of  Success
What  if  growth  exceeds   all  expectations?
Hope  for p  erformance g  ains   via  Moore's L  aw  ? SLA Prepare f  or s  uccess b  y   choosing  the  right  algorithm!
2015 2016 2017 2018 2019 2020 2021 2022 2023
Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

High  Performance  Fundamentals
Choose  the  appropriate  algorithm

§ Consider  the  Problem  
Small  rows p  roblem? Large  rows  problem?

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

42

Summary:  Indications  You've  Got  Something  Wrong

§ Hardware  upgrades  don't  deliver

§ Breakthrough t  echnologies s  uch  as   Exadata  and  DBIM c  annot   breakthrough y  our  problem

§ AWR  is  dominated b  y  SQL   statements  that  run  in   milliseconds

§ The  number  of  SQL  statements   executed  is  much  larger  than  the   number  of  application   transactions

§ Program  variables  look   suspiciously l  ike r  ows

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

43

If  Your  Application  is  a  Dog  !

This  is  a  Dog

This  is  a  Dog  on  Premise

This  is  a  Dog  in  the  Cloud

11/24/15 Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

Top  Real  World  Performance  Issues  seen  Today
· OLTP
­ Poor  Connection P  ooling ­ Resource  Leakage  
· DW/Batch
­ Row  by R  ow  Processing  on E  TL  Tasks ­ Incorrect  use  of  Partitions,  Indexes,  Parallelism
· ALL
­ Poor  Optimizer  Seeding  e.g Statistics  and  Configuration ­ Implicit D  ata  Type  Conversions

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

45

How  to  Improve  Your  Real  World  Performance
· Attend  the  Real  World  Performance  Sessions  This  Afternoon
­  -- 3 ­ Topics I  nclude
· OLTP · DW · SQL
· Download  and  View  The  Real  World  Performance  Videos  at  Work
­ http://oracle.uao--online.com
· Attend  the  Real  World  Performance  Class
­ -- Contact Y  our  Oracle  Contact

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

46

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

47

 

 z3 ­ SQL



Oracle

zData ­ 

BayMax

Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

 
Copyright  ©  2015, Oracle  and/or  its  affiliates.  All  rightsr   eserved.    |

