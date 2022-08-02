MISP and ATT&CK
How matrix-like models are changing MISP
Team CIRCL

th October

- attack-community.org
Threat Sharing

W

?

ATT&CK has been steadily on the rise We have observerd it becoming a baseline for contextualisation in several communities Relatively simple to understand Makes the ingestion of data based on context much easier Its use boosts analytical use-cases (risk assessment, threat intelligence)
This made us think about how we could further capitalise on its success

N ATT&CK
Result of discussions with MITRE MISP server hosts can now decide to export an enumeration of the patterns used based on the data-set Subject to all regular restSearch ltering methods (time, organisation, context, etc) Export returns the data-set in MITRE's owns ATT&CK sighting format

S

-

ATT&CK-

new standard restSearch return format Returns HTML navigator-like heatmap Easy integration into existing web applications Make use of all the MISP API ltering options Interested in how the rest of your sector shapes up? Or perhaps di erent time frames? Why not both and compare them?

S

-

ATT&CK-

The full dataset for a given time in an instance

S

-

ATT&CK-

The full dataset for a given time in an instance

ATT&CK
The advent of ATT&CK had a secondary e ect that was somewhat anticipated Francesco Bigarella from ING showcased attack fraud
ATT&CK like matrix Makes use of kill-chain phases Enables all of the advantages provided by the framework (such as technique frequency analysis) This inspired us to allow for other matrix-like galaxies to be added

ATT&CK
Several ATT&CK like matrices added since in MISP galaxy attck fraud Election guidelines O ce exchange techniques AM!TT Tactic (Adversarial Misinformation and In uence Tactics and Techniques) framework for describing disinformation incidents
https://github.com/misinfosecproject/amitt_framework

E

O

AM!TT T (A

M

I-

T

T

)

C
The matrix-like enhancement from the MISP galaxy format will be added in the default MISP galaxy standard format MITRE ATT&CK sighting export in MISP was a rst step to automate sharing of sightings ( public/private repository of sightings) ATT&CK like matrices become more and more common, thanks the continuous work of the community
https://www.misp-standard.org/ /

