Copyright*©*2015*Splunk*Inc.*
Real*World*Big*Data* Architecture*B*Splunk,* Hadoop,*RDBMS*
Raanan*Dagan* Rohit*Pujari*

Disclaimer*
During*the*course*of*this*presentaIon,*we*may*make*forward*looking*statements*regarding*future* events*or*the*expected*performance*of*the*company.*We*cauIon*you*that*such*statements*reflect*our* current*expectaIons*and*esImates*based*on*factors*currently*known*to*us*and*that*actual*events*or* results*could*differ*materially.*For*important*factors*that*may*cause*actual*results*to*differ*from*those*
contained*in*our*forwardBlooking*statements,*please*review*our*filings*with*the*SEC.*The*forwardB looking*statements*made*in*the*this*presentaIon*are*being*made*as*of*the*Ime*and*date*of*its*live* presentaIon.*If*reviewed*aTer*its*live*presentaIon,*this*presentaIon*may*not*contain*current*or* accurate*informaIon.*We*do*not*assume*any*obligaIon*to*update*any*forward*looking*statements*we*
may*make.** *
In*addiIon,*any*informaIon*about*our*roadmap*outlines*our*general*product*direcIon*and*is*subject*to* change*at*any*Ime*without*noIce.*It*is*for*informaIonal*purposes*only*and*shall*not,*be*incorporated* into*any*contract*or*other*commitment.*Splunk*undertakes*no*obligaIon*either*to*develop*the*features*
or*funcIonality*described*or*to*include*any*such*feature*or*funcIonality*in*a*future*release.*
2*

Agenda*
!  Splunk*Big*Data*Architecture* !  AlternaIve*Open*Source*Approach* !  RealBWorld*Customer*Architecture* !  EndBtoBend*DemonstraIon*
3*

Who*are*you?*
· Raanan*Dagan*B*Sr.*SE,*Big*Data*specialist* · Rohit*Pujari*­*Sr.*SE,*Big*Data*SME*
4*

Big*Data*Technologies*

Rela%onal(Database( Structured(
Schema(at(Write(

NoSQL( Semi<Structured(
Schema(at(Read(

Hadoop( Semi<Structured(
Schema(at(Read(

SQL(

Key<Value,(

MapReduce(

Column,(

Document(&(

ETL(

Other(Stores(

HDFS(Storage(

Splunk(
Schema(at(Read(
Search( Real<Time( Indexing(

RDBMS( Oracle,(MySQL,(IBM(
DB2,(Teradata(

Cassandra,(Accumulo,(

MongoDB(

5*

MapReduce(
Distributed(File( System(

Time<Series,(Unstructured,( Heterogenous(

Splunk*Big*Data*Technologies*

DB(Connect(

Hunk(

Splunk(

Schema(at(Write(

Schema(at(Read(

Schema(at(Read(

Schema(at(Read(

SQL(

Key<Value,(

MapReduce(

Search(

Column,(

ETL(

Document(&( Other(Stores(

HDFS(Storage(

Real<Time( Indexing(

RDBMS( Oracle,(MySQL,(IBM(
DB2,(Teradata(

Cassandra,(Accumulo,(

MongoDB(

6*

MapReduce(
Distributed(File( System(

Time<Series,(Unstructured,( Heterogenous(

! AutomaIc*load* balancing*linearly** scales*indexing*
! Distributed*search* and*MapReduce* linearly*scales* search*and*reporIng*

Splunk*Scalability*
Enterprise<class(Availability(and(Scale(
Offload*search*load*to*Splunk*Search*Heads*

Auto*loadBbalanced*forwarding*to*Splunk*Indexers*

Send*data*from*thousands*of*servers*using*any*combinaIon*of*Splunk*forwarders***
7*

Splunk*RealBTime*AnalyIcs**

Data*
Monitor(Input( TCP/UDP(Input(
Scripted(Input(

Parsing*Queue* Index*Queue*

Parsing*Pipeline*
· Source,*event*typing* · Character*set*
normalizaIon* · Line*breaking* · Timestamp*idenIficaIon*
· Regex*transforms*
8*

RealBIme* Buffer*

RealBIme* Search*
Process*

Indexing* Pipeline*

Raw(data( Index(Files(

Splunk( Index(

Hunk*B*AnalyIcs*Plaborm*for*Hadoop*

Full<featured,( Integrated(
Product*
Insights(for(
Everyone*
Works(with( What(You(
Have(Today*

Explore* Analyze* Visualize* Dashboard Share* s*

Hadoop*Client*Libraries*

Hadoop(Clusters(

NoSQL,(EMR,(S3(Buckets(

9*

Hunk*Unique*Features*

Virtual(Index(
· Enables*seamless*use* of*the*Splunk* technology*stack*on* data*wherever*it*rests*
· NaIvely*handles* MapReduce*

Schema<on<the<fly(
· Structure*applied*at* search*Ime*
· No*brifle*schema** · AutomaIcally*find*
paferns*and*trends*

Flexibility(and(( Fast(Time(to(Value(
· InteracIve*search* · Preview*results*while*
MapReduce*jobs*run* · DragBandBdrop*analyIcs*

Security:*Access*Control,*Pass*Through*AuthenIcaIon,*Kerberos**
10*

Hunk*Provides*SelfBService*AnalyIcs*for*Hadoop*

Explore* Analyze* Visualize*

Dashboards*

Share*

Hadoop( Storage(
11*

What*About*Structured*Data?*

Customer( Product( Employee( Pricing(and(( Asset(

profile( aYributes( details(

Rate(plans( info(

12*

Use*cases*for*structured*data*in*Splunk*
Index*machine*data*from*databases,*such*as*logs*or* sales*records*
Enrich*machine*data*with*highBlevel*data,*such*as* customer*records*
Update*structured*databases*with*Splunk*info,*such*as* risk*scores*
InteracIvely*browse*structured*and*unstructured*data* from*Splunk*reports*

Machine*Data*­*Delivers*RealBIme*Insights*

Media(server( logs((
(machine(data)(

Phone*Number**
Mar 01 19:18:50:000

aaa2

IP*Address*
radiusd[12548]:[ID

959576

local1.info]

INFOTRrAaDcOkP(*I1D3)*

acct

start

for

2172618992@splunktel.com 10.164.232.181 from 12.130.60.5 recorded OK.!

2013-03-01 19:18:50:150 10.2.1.34 GET /sync/addtolibrary/01011207201000005652000000000053 - 80 -

10.164.232.181 "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML,

like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3" 503 0 0 825 1680!

Mar 01 19:18:50:163 aaa2 radiusd[12548]:[ID 959576 local1.info] INFO RADOP(13) acct stop for

2172618992@splunktel.com 10.164.232.181 from 12.130.60.5 recorded OK.!

14*

Structured*Data*­*Contains*Business*Context*

Media(server( logs((
(machine(data)(

Phone*number** Mar 01 19:18:50:000

aaa2

IP*address*
radiusd[12548]:[ID

959576

local1.info]

INFO TRrADaOcPk(*1I3D)*acct

start

for

2172618992@splunktel.com 10.164.232.181 from 12.130.60.5 recorded OK.!

2013-03-01 19:18:50:150 10.2.1.34 GET /sync/addtolibrary/01011207201000005652000000000053 - 80 -

10.164.232.181 "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML,

like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3" 503 0 0 825 1680!

Mar 01 19:18:50:163 aaa2 radiusd[12548]:[ID 959576 local1.info] INFO RADOP(13) acct stop for

2172618992@splunktel.com 10.164.232.181 from 12.130.60.5 recorded OK.!

Customer,( product( databases(

Track(ID( 01011207201000005652000000000053*

ArIst* Maroon*5*

Title* Moves*like*Jagger*

Format*ID* MP3*

Run*Ime* 4:30*

Phone(#(

Subscriber(ID(

2172618992* 53546*

Subscriber( First*Name* Last*Name* Age* ID(

****53546*

Jim*

Morrison*

25*

State* CA*

Customer* Score*
93*

15*

Splunk*DB*Connect*

Reliable,(scalable,(real<%me( integra%on(between(Splunk(and( tradi%onal(rela%onal(databases(
!  Enrich*search*results*with*addiIonal* business*context*
!  Easily*import*data*into*Splunk*for* deeper*analysis*
!  Integrate*mulIple*DBs*concurrently* !  Simple*setBup,*nonBevasive*and*secure*
16*

Java*Bridge*Server*

Database** ConnecIon** Database**

lookup*

pooling*

query*

JDBC*

Oracle** MicrosoT*SQL* Other**

database*

server*

databases*

Customer*Open* Source*AlternaIve*

Hadoop*Ecosystem*OpIons*

Hadoop*Advantage*/*Disadvantage**

Advantage(
Cheap*Storage*
Batch*Distributed* Processing*

Disadvantage( Requires*Coding*for*most*
AnalyIcs*
No*VisualizaIon*Tools*
No*OOTB*Apps*/*SoluIons*

19*

RealBWorld* Customer* Architecture*

***Summary*Architecture*

3 instances Splunk / Hunk / DB Connect Search Heads

Real Time Data 25 Indexers
...(

Historical data (VIX) 60 Hortonworks nodes
...(

Enrichment data (lookup) MySQL DB

2000 Forwarders

Splunk*Deployment*Architecture*

indexer*

~2TB*per*day* Web*server* 2,000* forwarders*

indexer* 25*indexers*

Web*server* forwarder*

3*search*head*
~250*Users* ~30*Concurrent*Users*

22*

WebLogic* app*server*
WebLogic* app*server*

Hadoop*Architecture*

~30*Flume*Agents* ~60*Data*Nodes* ~1.2*PB*of*storage* ~2*years*data*retenIon*

data*node*

data*node* data*node*

data*node* 23*

Splunk*+*Hunk*=*All*the*Data*

Web*server* app*server*

indexer*

· Real*Time* · AnalyIcs* · Alerts* · Apps*

indexer*

· Batch* · Compliment*Splunk* data*node*
AnalyIcs* · Historical*searches*

data*node*

data*node*

24*

DB*Connect*Architecture*

· Install*DB*Connect*on*a*Search*Head*
· Use*DB*Connect*for*Lookup*
· Several*Lookups*coming*from*two* different*MySQL*Databases*
· Lookup*Enrich*log*data*with*business* insight*

Search*Head*
MySQL* JDBC* Driver**
DBB1* DBB2*

25*

DB*B*Architecture*Performance*Impact*

Command(

Connec%on((

Architecture(

Indexing(
Inputs*B*dbmonBtail* **(Recommended((
Inputs*­*dbmonBdump*
Outputs*
Not(Indexing(
Search*­*DBXQuery* Lookups***(Selected(this(op%on( *

Medium*number*of*connecIons* (Small*amount*of*data*B*only* delta)* Small*amount*of*connecIons* (Lots*of*data*per*connecIon)* Lots*of*DB*ConnecIons*(Small* amount*of*data)*
Lots*of*DB*ConnecIons* Lots*of*DB*ConnecIons*

DB*to*Index**(connecIon*pooling)*
DB*to*Index*(connecIon*pooling)* Search*Head*to*DB*(connecIon* pooling)*
DB*to*Search*Head* DB*to*Search*Head*

***Summary*Architecture*

3 instances Splunk / Hunk / DB Connect Search Heads

Real Time Data 25 Indexers
...(

Historical data (VIX) 60 Hortonworks nodes
...(

Enrichment data (lookup) MySQL DB

2000 Forwarders

Customer*Chosen* Architecture*Demo*

THANK*YOU*

