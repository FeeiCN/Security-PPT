© 2018 SPLUNK INC.
Multi-tenancy Management
Andre Tucker Solutions Architect - ReliaQuest
atucker@reliaquest.com

About Me
· ReliaQuest Solutions Architect
· IT Experience: o System Administrator o Web Development / Database administration o SIEM Content Development o Software Development
· 3 year Splunk developer / enthusiast / evangelist

© 2018 SPLUNK INC.

What is Multi-tenancy
Multi-tenancy - an architecture
in which a single instance of a software application serves multiple customers.
· Child Companies · Business Units · Any Sub-Entity

© 2018 SPLUNK INC.

Multi-tenancy Goals
Well executed multi-tenancy should:
· Provide complete autonomy for each unit/entity
o Data Visibility o Content (reports, dashboards, alerts)
· Minimize content duplication
o Granular changes per entity
· Allow for overall program visibility and conformation
o Reporting on groupings of entities. o All entities have the conform to enterprise program

© 2018 SPLUNK INC.

The Approach · Data Indexing · Data Classification · Data Manipulation

© 2018 SPLUNK INC.

The Approach

© 2018 SPLUNK INC.

Order of Operations

© 2018 SPLUNK INC.

http://docs.splunk.com/Documentation/Splunk/7.0.3/Knowledge/Searchtimeoperationssequence

Data Indexing
Naming Conventions
· Prefix indices based on entity · Follow prefix by categorical name
<entity>_<category> = pod1_firewall
Routing
· Route based on host or source
Permissions
· Align indexes with necessary roles

© 2018 SPLUNK INC.

Data Classification Transforms ­ First get the entity prefix from the index name
pod1_firewall
Lookups ­ Enrich Splunk data by adding field-value combinations
found in the lookup. · Match index patterns to entity names

© 2018 SPLUNK INC.

Data Classification
Eventtypes ­ Next we search for all events that should belong to
the entity. Index=* bunit=abc
Tags ­ And group them
together.

© 2018 SPLUNK INC.

Data Manipulation

© 2018 SPLUNK INC.

· Control production / development entities using lookups, tags,
and incident review states
· Craft emails based on entity using eval
· Control logic using a mixture of lookups and macros.
o (Wanna go crazy? Try the "map" command)
· Change dashboard views / panels using tokens

Thank You
atucker@reliaquest.com

© 2018 SPLUNK INC.

