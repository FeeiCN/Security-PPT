© 2018 SPLUNK INC.
Enterprise Security Biology Part 2
Asset & Identity Framework
John Stoner | Principal Security Strategist
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Disclaimer
During the course of this presentation, we may make forward looking statements regarding future events or the expected performance of the company. I often lie. Maybe this is a lie. Wik Alsø wik Alsø alsø wik Wi nøt trei a høliday in Sweden this yër? See the løveli lakes The wøndërful telephøne system And mäni interesting furry animals The characters and incidents portrayed and the names used in this Presentation are fictitious and any similarity to the names, characters, or history of any person is entirely accidental and unintentional. Signed RICHARD M. NIXON Including the majestik møøse A Møøse once bit my Marcus... No realli! He was Karving his initials on the møøse with the sharpened end of an interspace tøøthbrush given him by Svenge ­ his brother-in-law ­ a Canadian dentist and star of many Norwegian møvies: "The Høt Hands of an Canadian Dentist", "Fillings of Passion", "The Huge Mølars of Horst Nordfink"... In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. Splunk undertakës no øbligation either to develøp the features or functionality described or to include any such feature or functionality in a future release.

# whoami > John Stoner

© 2018 SPLUNK INC.

CISSP, GCIA, CISA, GCIH, GCTI

Principal Security Strategist @stonerpsu

 20+ Years kicking around databases, ISPs and cyber
 3.5 Years at Splunk  Creator of SA-Investigator  Co-editor and author Hunting with
Splunk: The Basic blog series  Assist in steering the BOTS ship  Enjoys writing workshops on
hunting and investigating with Splunk  Listening to The Smiths

Agenda
Asset & Identity Framework
 Enterprise Security Frameworks  Collection  Processing  Troubleshooting  Adding A New Field to the Asset & Identity Framework

© 2018 SPLUNK INC.

Enterprise Security Frameworks

© 2018 SPLUNK INC.

Threat Intelligence

Incident Management

Asset & Identity

Risk

Adaptive Response

© 2018 SPLUNK INC.
Why Should I Care About Asset & Identity?
Context

Why Should I Care About Asset & Identity
Practical Application of Context

© 2018 SPLUNK INC.

Why Should I Care About Asset & Identity
Practical Application of Context

© 2018 SPLUNK INC.

Our Goal Today?
 Better understand how Splunk processes assets and identities in Enterprise Security
 Better insight = Better Troubleshooting = Better Use

© 2018 SPLUNK INC.

Why Dissection?
dis·sect
/dsekt,dsekt/ verb  methodically cut up (a body, part, or
plant) in order to study its internal parts · synonyms: anatomize, cut
up/open, dismember, vivisect
 analyze (something) in minute detail · synonyms:
analyze, examine, study, scrutinize, pore over, investigate, go over with a fine-tooth comb

© 2018 SPLUNK INC.

Asset & Identity Framework
http://dev.splunk.com/view/enterprise-security/SP-CAAAFBB

© 2018 SPLUNK INC.

Why This Presentation...

© 2018 SPLUNK INC.

Asset & Identity Framework Data Flow

© 2018 SPLUNK INC.

TAs / Saved Searches

/../lookups/
Demo Assets & Identities
Administrative Identities
Static Assets & Identities Other Defined Assets &
Identity Lists category.csv and pci_domains.csv

/SA-IdentityManagement
/../default/inputs.conf /../local/inputs.conf
SplunkEnterpriseSecurityS uite/local/inputs.conf

identity_manager.py

Automatic Lookups
LOOKUP-zzasset_identity_lookup_d
efault_fields-dest

Events in Notable index

Incident Review

Saved Searches ­ Lookup Gen

asset_lookup_by_cidr asset_lookup_by_str
Asset Center

identity_lookup_expanded
Identity Center

Correlation Searches

Events in Data Models

Identity Management Data Model

© 2018 SPLUNK INC.
Collection

TAs / Saved Searches

Asset & Identity Framework - Collection

/../lookups/
Demo Assets & Identities
Administrative Identities
Static Assets & Identities Other Defined Assets &
Identity Lists category.csv and pci_domains.csv

/SA-IdentityManagement
/../default/inputs.conf /../local/inputs.conf
SplunkEnterpriseSecurityS uite/local/inputs.conf

© 2018 SPLUNK INC.

Getting Data Into A&I

© 2018 SPLUNK INC.

 Active Directory  LDAP  CMDB (DBX)  Other Technical-Add Ons

The Manual Method
Configure > Content Management

© 2018 SPLUNK INC.

The Automated Method

© 2018 SPLUNK INC.

Technology Active Directory

Asset/ Identity
Both

App SA-ldapsearch *

URL https://splunkbase.splunk.com/app/1151/

Both

SecKit Windows Add On for ES Asset and Identities

https://splunkbase.splunk.com/app/3059/

LDAP

Both

SA-ldapsearch *

https://splunkbase.splunk.com/app/1151/

CMDB

Asset

DB Connect *

https://splunkbase.splunk.com/app/2686/

SecKit Common Assets Add-on for Splunk Enterprise Security https://splunkbase.splunk.com/app/3055/

ServiceNow

Both

Splunk Add-on for ServiceNow

https://splunkbase.splunk.com/app/1928/

Asset Discovery

Asset

Splunk for Asset Discovery

https://splunkbase.splunk.com/app/662/

Bit9

Asset

Splunk Add-on for Bit9 *

https://splunkbase.splunk.com/app/2790/

Cisco ISE

Both

Splunk Add-on for Cisco ISE *

https://splunkbase.splunk.com/app/1915/

Microsoft SCOM

Asset

Splunk Add-on for Microsoft SCOM *

https://splunkbase.splunk.com/app/2729/

Okta

Identity

Splunk Add-on for Okta *

https://splunkbase.splunk.com/app/2806/

Sophos

Asset

Splunk Add-on for Sophos *

https://splunkbase.splunk.com/app/1854/

Symantec Endpoint Protection

Asset

Splunk Add-on for Symantec Endpoint Protection *

https://splunkbase.splunk.com/app/2772/

Splunk Enterprise

Asset

Add asset data from indexed events in Splunk platform

http://docs.splunk.com/Documentation/ES/5.1.0/Ad min/Examplemethodsofaddingassetandidentitydata #Add_asset_data_from_indexed_events_in_the_Sp lunk_platform

Amazon Web Services (AWS)

Asset

SecKit AWS Add On for ES Asset and Identities

https://splunkbase.splunk.com/app/3586/

http://docs.splunk.com/Documentation/ES/5.1.0/Admin/Collectandextractassetandidentitydata * = Custom Search Needed

Identity Ingest (1/2)
Requires Some Thought...
 From Enterprise Security · Configure > Data Enrichment > Identity Lookup
Configuration.
· Email - email address identifies users · Email short - username of an email address identifies users · Convention - custom convention(s) used to identify users
· Example: First 6 letters of their last name and the first 2
letters of their first name ­ last(6)first(2)
· Case Sensitive - require case sensitivity for matching

© 2018 SPLUNK INC.

Identity Ingest (2/2)

© 2018 SPLUNK INC.

Can also be edited in the identityLookup.conf $SPLUNK_HOME/etc/apps/SA-IdentityManagement/default/

 Asset Headers

Formatting for Ingest
CSV

 Identity Headers

© 2018 SPLUNK INC.

 http://docs.splunk.com/Documentation/ES/latest/Admin/Formatassetoridentitylist

The Bare Minimum for Assets
 Address ­ ip, mac, nt_host, dns · At least one
 Priority · Used to calculate Urgency in Notable Events · Combined with Correlation Search - Severity
 bunit (Business Unit) · Common filter in dashboards in ES
 Category · Common filter in dashboards in ES · Multivalue field, separated with pipes

© 2018 SPLUNK INC.

The Bare Minimum for Identity
 Identity · Multivalue field, separated with pipes
 Priority · Used to calculate Urgency in Notable Events · Combined with Correlation Search - Severity
 bunit (Business Unit) · Common filter in dashboards in ES
 Category · Common filter in dashboards in ES · Multivalue field, separated with pipes

© 2018 SPLUNK INC.

Using a Saved Search To Prep Your Data
Asset

© 2018 SPLUNK INC.

http://docs.splunk.com/Documentation/ES/latest/Admin/Examplemethodsofaddingassetandidentitydata#Collect_asset_and_identity_data_from_Active_Directory

Using a Saved Search To Prep Your Data
Identity

© 2018 SPLUNK INC.

http://docs.splunk.com/Documentation/ES/latest/Admin/Examplemethodsofaddingassetandidentitydata#Collect_asset_and_identity_data_from_Active_Directory

Adding a New List
 Enterprise: Settings > Data Inputs > Identity Management  In ES: Configure > Data Enrichment > Identity Management  Can have multiple csvs for Asset & Identity

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Pro Tip
Don't Rely On Configure > Lists and Lookups to Get Your Assets & Identities

Setting A&I Lookups for Ingest

© 2018 SPLUNK INC.

 $SPLUNK_HOME/etc/apps/SA-IdentityManagement/default/inputs.conf · Modifications get written to local but you already knew that

© 2018 SPLUNK INC.
Processing

© 2018 SPLUNK INC.
Asset & Identity Framework - Processing

TAs / Saved Searches

/../lookups/
Demo Assets & Identities
Administrative Identities
Static Assets & Identities Other Defined Assets &
Identity Lists category.csv and pci_domains.csv

/SA-IdentityManagement
/../default/inputs.conf /../local/inputs.conf
SplunkEnterpriseSecurityS uite/local/inputs.conf

identity_manager.py

Saved Searches ­ Lookup Gen

asset_lookup_by_cidr asset_lookup_by_str

identity_lookup_expanded

What Do These Words Mean?
 String-based asset correlation  CIDR subnet-based asset correlation  String-based identity correlation

© 2018 SPLUNK INC.

String-based Asset Correlation
Very Straightforward
 Found in lookup asset_lookup_by str

© 2018 SPLUNK INC.

CIDR Subnet-based Asset Correlation
Very Similar to String Matching
 Found in lookup asset_lookup_by cidr

© 2018 SPLUNK INC.

String-based Identity Correlation
 Found in lookup identities_expanded.csv

© 2018 SPLUNK INC.

How Did We Get There?

© 2018 SPLUNK INC.

 $SPLUNK_HOME/etc/apps/SA-IdentityManagement/bin/identity_manager.py  Merge process runs every 5 minutes by default
· | from savedsearch:"Identity - Asset String Matches - Lookup Gen" · | from savedsearch:"Identity - Asset CIDR Matches - Lookup Gen" · | from savedsearch:"Identity - Identity Matches - Lookup Gen"

© 2018 SPLUNK INC.
Identity - Asset String Matches - Lookup Gen
Very Straightforward
| `asset_sources` | `make_assets_str` | outputlookup output_format=splunk_mv_csv asset_lookup_by_str
`make_assets` | eval `asset_key_field`=mvfilter(!match(`asset_key_field`, `ipv4_cidr_regex`)) | where isnotnull(`asset_key_field`)
fillnull value="false" `extra_asset_fields` | `split_mv_asset_fields` | `gen_asset_id(asset_id)` | dedup asset_id | where isnotnull(asset_id) | expandiprange ip | eval `pci_category_meval(category)`, `pci_domain_meval(pci_domain, category)`, `tag_assets_meval` | `generate_asset_key` | fields `asset_key_field`,`asset_fields`
inputlookup append=t frothly_assets | inputlookup append=t simple_asset_lookup

© 2018 SPLUNK INC.
Identity - Asset CIDR Matches - Lookup Gen
Very Similar to String Matching
| `asset_sources` | `make_assets_cidr` | outputlookup output_format=splunk_mv_csv asset_lookup_by_cidr
`make_assets` | eval `asset_key_field`=mvfilter(match(`asset_key_field`, `ipv4_cidr_regex`)) | where isnotnull(`asset_key_field`)
fillnull value="false" `extra_asset_fields` | `split_mv_asset_fields` | `gen_asset_id(asset_id)` | dedup asset_id | where isnotnull(asset_id) | expandiprange ip | eval `pci_category_meval(category)`, `pci_domain_meval(pci_domain, category)`, `tag_assets_meval` | `generate_asset_key` | fields `asset_key_field`,`asset_fields`
inputlookup append=t frothly_assets | inputlookup append=t simple_asset_lookup

Identity - Identity Matches - Lookup Gen

© 2018 SPLUNK INC.

inputlookup append=t frothly_ids | inputlookup append=t simple_identity_lookup
fillnull value="false" watchlist | `str_to_bool(watchlist)` | eval category=split(category, "|"), `pci_category_meval(category)`, `tag_identities_meval` | `gen_identity_id(identity_id)` | where isnotnull(identity_id) | `generate_identities` | eval identity=mvdedup(identity) | `generate_identity_key` | fields `identity_key_field`,`identity_fields`

| `identity_sources` | `make_identities` | eval `iden_mktime_meval(startDate)`,`iden_mktime_meval(endDate)`,identity=mvsort(identity) | sort 0 +identity | outputlookup output_format=splunk_mv_csv identity_lookup_expanded

© 2018 SPLUNK INC.
Consuming

© 2018 SPLUNK INC.
Asset & Identity Framework - Consuming

TAs / Saved Searches

/../lookups/
Demo Assets & Identities
Administrative Identities
Static Assets & Identities Other Defined Assets &
Identity Lists category.csv and pci_domains.csv

/SA-IdentityManagement
/../default/inputs.conf /../local/inputs.conf
SplunkEnterpriseSecurityS uite/local/inputs.conf

identity_manager.py

Automatic Lookups
LOOKUP-zzasset_identity_lookup_d
efault_fields-dest

Events in Notable index

Incident Review

Saved Searches ­ Lookup Gen

asset_lookup_by_cidr asset_lookup_by_str
Asset Center

identity_lookup_expanded
Identity Center

Correlation Searches

Events in Data Models

Identity Management Data Model

Asset Center

© 2018 SPLUNK INC.

| inputlookup append=T asset_lookup_by_str where (dns=$asset$ OR nt_host=$asset$ OR ip=$asset$ OR mac=$asset$) $owner$ $priority$ $bunit$ $category$ $pci_domain$ | inputlookup append=t asset_lookup_by_cidr where (dns=$asset$ OR nt_host=$asset$ OR ip=$asset$ OR mac=$asset$) $owner$ $priority$ $bunit$ $category$
$pci_domain$ | dedup asset_id ...

Identity Center

© 2018 SPLUNK INC.

Merging of Data

Automatic Lookups

 Default field correlation

· LOOKUP-zz-asset_identity_lookup_default_fields-dest
LOOKUP-zz-asset_identity_lookup_default_fields-dvc LOOKUP-zz-asset_identity_lookup_default_fields-src
LOOKUP-zz-asset_identity_lookup_default_fields-src_user LOOKUP-zz-asset_identity_lookup_default_fields-user

 String-based asset correlation

· LOOKUP-zu-asset_lookup_by_str-dest
LOOKUP-zu-asset_lookup_by_str-dvc LOOKUP-zu-asset_lookup_by_str-src

 CIDR subnet-based asset correlation

· LOOKUP-zv-asset_lookup_by_cidr-dest
LOOKUP-zv-asset_lookup_by_cidr-dvc LOOKUP-zv-asset_lookup_by_cidr-src
 String-based identity correlation

Index=Notable

· LOOKUP-zy-identity_lookup_expanded-src_user
LOOKUP-zy-identity_lookup_expanded-user

© 2018 SPLUNK INC.
asset_lookup_default_fields identity_lookup_default_fields
identity_lookup_expanded asset_lookup_by_str asset_lookup_by_cidr

Default Field Correlation
 asset_lookup_default_fields.csv  identity_lookup_default_fields.csv

© 2018 SPLUNK INC.

Default Field Correlation
Automatic Lookup

© 2018 SPLUNK INC.

Asset Automatic Lookup
LOOKUP-zv-asset_lookup_by_cidr-dest

© 2018 SPLUNK INC.

Identity Automatic Lookup
LOOKUP-zy-identity_lookup_expanded-src_user

© 2018 SPLUNK INC.

Automatic Lookup with a Search
Focusing on src assets...

© 2018 SPLUNK INC.

What Else Could I Do?
Limit Correlation to Specific sourcetype

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Additional Knowledge Objects Leveraging A&I
Not Exhaustive...

 Data Model · Assets & Identities
 Correlation Searches · Activity from Expired User Identity* · Asset Ownership Unspecified* · High Volume Email Activity to Non-
corporate Domains by User
· Web Uploads to Non-corporate Sites by
Users
 Search Driven Lookups · Asset/Identity Categories · PCI Domain Lookup

 Saved Searches · Identity - Email Activity to Non-corporate
Domains by Users Per 1d - Context Gen
· Identity - Web Uploads to Non-corporate
Domains by Users Per 1d - Context Gen
 KSIs · High Risk Users · Noncorporate Email Activity
 Swimlanes · Asset Investigator · Identity Investigator · Identity - Tickets by User - Swimlane

Session Center

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
If I Can Find A UBA Sample to Show for That Tab Show It Here

© 2018 SPLUNK INC.
Troubleshooting

All Is Well

© 2018 SPLUNK INC.

Change an Asset Value (1/2)
Criticality of a Server

© 2018 SPLUNK INC.

Change an Asset Value (2/2)
Criticality of a Server

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
When I Don't Have A Lookup To Go With My Identity Management List

What's Really Happening
Asset

© 2018 SPLUNK INC.

Identity Change

© 2018 SPLUNK INC.

What's Really Happening

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Adding A New Field to the Asset & Identity Framework

Initial Setup
 Cloned csv structure for assets  Added a column called classification  Added a new asset with value of TOPSECRET in classification field  Added csv to Data Inputs > Identity Management
· Insert of Asset worked as expected but no Classification column in Asset Center

© 2018 SPLUNK INC.

Lookup Generating Searches

© 2018 SPLUNK INC.

 Asset Information view and search is straightforward · asset_lookup_by_str and asset_lookup_by_cidr are missing the new column
 Lookup Generating Saved Searches are run by the modular input to finesse the data

© 2018 SPLUNK INC.
Macro Modifications to Capture New Field
 Need to modify macros · asset_sources is updated automatically to accommodate my new csv as a data source (no
action required)
· make_assets_str relies on make_assets macro · which relies on asset_fields macros
- which relies on asset_attributes macro ­ Add our new field here

Asset Center Tweaks to View

© 2018 SPLUNK INC.

 With those changes classification is now being captured in the converged lookup · Present in asset_by_str lookup but not in Asset Center
 Add to Asset Center by modifying the asset information saved search in pane
· Optional achievement to unlock: Make it a tokenized field if desired! · In Asset Information panel, go into SimpleXML mode and add the field
· <fields>ip,mac,nt_host,dns,owner,priority,lat,long,city,country,bunit,category,pci_domain,is_e
xpected,should_timesync,should_update,requires_av,classification</fields>

Asset Center

© 2018 SPLUNK INC.

Now What?
 Build correlation searches that leverage the new column  Update dashboards and tokenize value to filter  Add to Incident Review

© 2018 SPLUNK INC.

Adding to Incident Review
 In ES, Configure > Incident Management > Incident Review Settings

© 2018 SPLUNK INC.

 Add new entry · Add label and field name both src and dest, in this case could also be dvc

Update Macros

© 2018 SPLUNK INC.

 This is not imperative for Notable Event but this is a frequently used macro to get asset values
· Adding the field here is a good idea

Automatic Lookups

© 2018 SPLUNK INC.

 At this point, if we run index=notable or any similar search, we get all metadata except our new field
 Settings > Lookups > Automatic Lookups · Select SA-IdentityManagement

Automatic Lookups
 Add the new field in all 6 auto lookups

© 2018 SPLUNK INC.

Here's How

© 2018 SPLUNK INC.

Splunk Search

© 2018 SPLUNK INC.

Notable Event

© 2018 SPLUNK INC.

A Caveat (or Two)

© 2018 SPLUNK INC.

 Depending on how far you want to go with this
· The underlying python scripts identity_correlation_rest_handler.py and
identityLookup_rest_handler.log will require some love to accommodate these additional fields
· Data model will need to be updated to accommodate additional fields

Toys To Play With
 Configure > Content Management

© 2018 SPLUNK INC.

 $SPLUNK_HOME/etc/apps/SA-IdentityManagement/lookups/demo_assets.csv  $SPLUNK_HOME/etc/apps/SA-IdentityManagement/lookups/demo_identities.csv

Asset & Identity Framework Data Flow

© 2018 SPLUNK INC.

TAs / Saved Searches

/../lookups/
Demo Assets & Identities
Administrative Identities
Static Assets & Identities Other Defined Assets &
Identity Lists category.csv and pci_domains.csv

/SA-IdentityManagement
/../default/inputs.conf /../local/inputs.conf
SplunkEnterpriseSecurityS uite/local/inputs.conf

identity_manager.py

Automatic Lookups
LOOKUP-zzasset_identity_lookup_d
efault_fields-dest

Events in Notable index

Incident Review

Saved Searches ­ Lookup Gen

asset_lookup_by_cidr asset_lookup_by_str
Asset Center

identity_lookup_expanded
Identity Center

Correlation Searches

Events in Data Models

Identity Management Data Model

Conclusion

© 2018 SPLUNK INC.

 Asset & Identity Framework Provides Much Needed Context
 Reasonably straightforward to use
 Couple of early decision points to make around correlation of sourcetypes and naming convention around identities
 Scaling across large customer bases is something that needs to be thought through and planned with professional services
 Adding additional fields is possible but not as straightforward as you might expect so plan accordingly

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

