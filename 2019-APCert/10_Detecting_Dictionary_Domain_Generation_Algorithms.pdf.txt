Graph Based Machine Learning
Detecting Wordlist Domain Generation Algorithms
Sng Yu Feng Chester @chestersng Lam Fhong Sheng @chrispooh007

Roadmap

Malware Communication
What is a DGA?

Overview of Solution
A technical explanation of the solution

1

2

3

4

Graph Mining
Word Graph Approach to detecting
Dictionary DGA Domains

Practical Usages
Some domains which we can apply this algorithm to

Attacker's POV
Why do I need to use DGA?

Hardcoded IP Address
Hey 11.22.33.44, what do you want me do?

Hey 11.22.33.44, here is the payload... {username:..., password:...}

11.22.33.44

Author writes DGA

Author writes DGA

Step 1
Run DGA in advance with time seed of tomorrow 7p.m. Produces:
a9djc92c.com d02kd0x.net 19cjsodos.org
... Registers one of them:
19cjsodos.org

Step 2
Run DGA with time seed now Produces:
a9djc92c.com d02kd0x.net 19cjsodos.org
...

Step 3
Attempts to communicate with all of them: a9djc92c.com d02kd0x.net 19cjsodos.org ...
Successfully Established Connection with: 19cjsodos.org

Defender's POV
Can I identify DGA-generated
domains?

Which is the DGA Domain?

chrisjames.net
kyt6ea4ak4bvo35lrw.net
Rovnix Malware DGA Domain

That's easy.
It is the second one!

Which is the DGA Domain?

christinekroencke.net
christinepatterson.net
Suppobox DDGA Domain

ThErismi...s a haTrhde fpirrsotbolneem? !

Not just one type of DGA...

Types
Arithmetic (A)

Example Family
DirCrypt

Wordlist (W)

Matsnu

Hashing (H)

Bamital

Examples Domains
wejcqzbosbczzlnikyvt.com, muiccxbvkvjb.com, tqwpmpwckhidiss.com, gzredieexn.com, ghhcwldtj.com
accident-require.com paintfinance.com lawyersit-direction.com troublepace-summer.com
cd8f66549913a78c5a8004c82bcf6b01.info aa24603b0defd57ebfef34befde16370.cz.cc 5e6efdd674c134ddb2a7a2e3c603cc14.org

Permutation

"Explosive" malware from "VolatileCedar"

explorerdotnt.info dotnetexplorer.info dotntexplorere.info xploreredotnet.info

2018 Research on DDGA Detection

Observation 1
Malware generate their domains using a fixed-size dictionary. Normally, these dictionaries are small (hundreds of words) to reduce payload size.
Word will be reused, since the size of the dictionary is small.

Dictionary
john larry david jennifer james

Generated Domains

johnjames.net larrydavid.net jenniferlarry.net davidjohn.net

jamesdavid.net larryjennifer.net jenniferjames.net johnjennifer.net

Observation 2
We can make use of graph theory to form a solution for this problem.
1. Let the words in the dictionary be nodes 2. Two nodes are linked if they appear in the same domain.

john jjaomhnejsadmaveisd..nneett
larry lalarrryrjyednanvifde.rn.neet t jjeennnnijfiefedenrarjnvlaaiimfdrererys..nneett jodhanvjiednjonhifne.rn.neet t
james

John

James

Larry

David

Jennifer

Observation 3
Dictionary-generated domains cluster differently from benign domains.

Dictionary Generated Clusters

Benign Domains Clusters

Components of the Solution

Word Breaking Algorithm
doghouse.net

Graph Library

Artificial Intelligence
Clusters

dog house
Break domains up into individual words

Create a word graph and extract clusters

Malware

Benign

Implemented a new algorithm to increase efficiency

Used an additional graph library to provide clear visualisation

Used a larger dataset to detect more families of malware

ExamRpelepeoaftDedDGwAorDdosm! ains

christianasheenagh.net grenvilleshakesheave.net

catharinesheenagh.net

sebastiansheridan.net

christianasherilyn.net

clevelandsheenagh.net

clevelandsheridan.net

grenvillesherilyn.net

mastermansherilyn.net mastermansheridan.net

sebastiansherilyn.net

grenvillesheenagh.net

grenvilleshavonne.net christophershakesheave.net

clevelandshakesheave.net sebastianshakesheave.net

sebastiansheenagh.net

christianasheridan.net

christophershavonne.net catharinesherilyn.net

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack

Domains tomjack.net tomjack.net

Word

Domains

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack

Domains tomjack.net tomjack.net tomjack.net tomjack.net

Word

Domains

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane

Domains tomjack.net tomjack.net tomjack.net tomjack.net jilljane.net jilljane.net

Word

Domains

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane

Domains tomjack.net tomjack.net tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net jilljane.net

Word

Domains

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane

Domains tomjack.net tomjack.net tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net jilljane.net jilljane.net jilljane.net

Word

Domains

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane jac

Domains tomjack.net tomjack.net tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net jilljane.net jilljane.net jilljane.net jackjill.net

Word kjill

Domains jackjill.net

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane jac

Domains tomjack.net tomjack.net, jackjill.net tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net, jackjill.net jilljane.net jilljane.net jilljane.net jackjill.net

Word kjill

Domains jackjill.net

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane jac

Domains tomjack.net tomjack.net, jackjill.net tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net, jackjill.net jilljane.net jilljane.net jilljane.net jackjill.net

Word kjill jackj ill

Domains jackjill.net jackjill.net jackjill.net

k = 3
Wordbreaking Algorithm

tomjack.net jilljane.net jackjill.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane jac

Domains tomjack.net, tomjane.net tomjack.net, jackjill.net
tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net, jackjill.net jilljane.net, tomjane.net jilljane.net jilljane.net jackjill.net

Word kjill jackj ill tomj ane

Domains jackjill.net jackjill.net jackjill.net tomjane.net tomjane.net

Word tom jack tomj ack jil ljane jill jane jillj ane jac kjill jackj ill tomj ane

Graphing Algorithm

Domains tomjack.net, tomjane.net tomjack.net, jackjill.net
tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net, jackjill.net jilljane.net, tomjane.net jilljane.net jilljane.net jackjill.net jackjill.net jackjill.net jackjill.net tomjane.net tomjane.net

ljane tom
jil jillj
jane
ane jackj jill ill

ack
tomj jac
jack
jkill tomj
ane

Word tom jack tomj ack jil ljane jill jane jillj ane jac kjill jackj ill tomj ane

Graphing Algorithm

Domains tomjack.net, tomjane.net tomjack.net, jackjill.net
tomjack.net tomjack.net jilljane.net jilljane.net jilljane.net, jackjill.net jilljane.net, tomjane.net jilljane.net jilljane.net jackjill.net jackjill.net jackjill.net jackjill.net tomjane.net tomjane.net

ljane tom
jil jillj
jane
ane jackj jill ill

ack
tomj jac
jack
jkill tomj
ane

Graphing Algorithm

ljane

ack

tom

jil

tomj

jillj jane

jac jack

ane

jkill

jackj

tomj

jill

ill

ane

Artificial Intelligence

ljane

ack

tom

jil

tomj

jillj jane

jac jack

ane

jkill

jackj

tomj

jill

ill

ane

Feature Vector Average Node Degree Maximum Node Degree Minimum Node Degree Cardinality of Cycle Basis Average Cycles Per Node Average Clustering Per Node
Features that suggest clustering

Classification

Benign Dictionary

ljane

ack

jil jillj

tomj jac

ane jackj
ill

jkill tomj
ane

DGA Dictionary
tom

jane

jack

jill

Running on REAL DATA
� Ran the solution against 33 million .net domains (courtesy of SingCert) � Detected hundreds of clusters � Verified results in VirusTotal � Domains identified in the cluster are
domains used in Bayrob Malware

Application Tour

Using the Application

Analysing Results

Usages and Future Development
Threat Hunting Monitoring Domains at the National Level Improve Clustering Techniques Improve Classification Accuracy

Thank You

Thank You

