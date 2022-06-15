Jinbao Zhu , CA Technologies RDBMS & NoSQL 


2007CA TechnologiesERwin (   NoSQL 

Contents of this presentation are confidential and are being provided

pursuant to the NDA signed between CA and Buyer as well as the terms and conditions set forth in the Confidential Information Memorandum issued by

3

CA.

Big Data Technical Mature


­ The Wild West 

Contents of this presentation are confidential and are being provided

pursuant to the NDA signed between CA and Buyer as well as the terms and conditions set forth in the Confidential Information Memorandum issued by

7

CA.

8


· : 3NF · ACID
­ Atomicity ­ Consistency ­ Isolation ­ Durability

CAP
11/18/2015 12

Development Agility through flexible schema

Data Manageability

Schemaless

Schema at read

The lack of schema on write in the NoSQL world makes it inherently difficult to manage

Code

Analy ze

Extract

Clean se

Norm alize

Aggre gate

Load

Data Warehouse Utilize

Data Model

Load

Hadoop / Code NoSQL

Analyze Utilize

Cleanse

Summary : NoSQL 
·  
· NoSQL schema(i.e Map-Reduce). · (i.e.Map-Reduce) · NoSQL · NoSQL.

Contents of this presentation are confidential and are being provided

pursuant to the NDA signed between CA and Buyer as well as the terms and conditions set forth in the Confidential Information Memorandum issued by

21

CA.

Unified Data Model & ERwin NoSQL Modeler

RDBMS

Enterprise Data Architecture
Bi-direction, round trip (Reverse Engineering & Forward Engineering)
Data modeling

NoSQL DB

Schema

Schema

Data Model

Data Model design

Data Modeler

NoSQL

RDBMS
ER (Entity
Relationship)

NoSQL

Four main types: document, column-oriented, key-value, and graph

Schema predefined

Schema at read

Vertical Scaling ACID

Horizontal Scaling
Performance Prioritized based on CAP principal

RDBMS/NoSQL



RDBMSNoSQL 

 (Entity)

 (Table)





 (Row)

Collection / Row

(Attribute)

Column Name

Key

 (Attribute Column Value Value)

Field Value

(Domain)

Data type

Data type

(Relationship) Constraint

Reference, Embedded, Additional table,

(Key Group)

(Index)

Index, Additional table, Reference

Primary Key (Primary Key) Row Key
25

Example of NoSQL four types ­ ER Diagram
· Document oriented · Column oriented · Key-value pair · Graphic

Example of NoSQL four types ­ Document
· ER Diagram · Column oriented · Key-value pair · Graphic
27

Example of NoSQL four types ­ Column oriented
· ER Diagram · Document oriented
· Key-value pair · Graphic

Example of NoSQL four types ­ Key-Value

· ER Diagram · Document oriented · Column oriented
· Graphic

Key "Film_id:1:title" "Film_id:1:description" "Film_id:1:release_year" "Actor:27:First_name" "Actor:27:Last_name" "Film_id:1:actor"

Value
"ACADEMY DINOSAUR"
"A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies" "2005-12-31"
"JULIA"
"MCQUEEN"
"27,31,66"

Example of NoSQL four types ­ Graphic
· ER Diagram · Document oriented · Column oriented · Key-value pair

Schema Inference

Unified Data Model & ERwin NoSQL Modeler

RDBMS

Enterprise Data Architecture
Bi-direction, round trip (Reverse Engineering & Forward Engineering)
Data modeling

NoSQL DB

Schema

Physical model Unified model

Schema

Data Model design

Data Modeler

NoSQL 
· ? · ?
­  (composite) ­  ­ 
· 

NoSQL 
·  ·  ·  · 

NoSQL  - Aggregate
· 

NoSQL  ­ 

·  · 
­ ­ ·  ­ ­ ­

 · 
 · 
·  · 

· DS ·  ·  · 

Semantic

Unified Data Model & ERwin NoSQL Modeler

RDBMS

Enterprise Data Architecture
Bi-direction, round trip (Reverse Engineering & Forward Engineering)
Data modeling

NoSQL DB

Schema

Schema

Physical model Unified model

Business

Production Query Semantic

Concept Model Data Character Pattern Context

Data Model design

Data Modeler

ERwin NoSQL Modeler 
·  UDBC 
· SQL · 

Unified Data Model & ERwin NoSQL Modeler

RDBMS

Enterprise Data Architecture
Bi-direction, round trip (Reverse Engineering & Forward Engineering)
Data modeling

NoSQL DB

Schema Extraction
Physical model

Schema Inference

Unified model

Business

Production Query Semantic

Domain Model Data Character Pattern Context

UDBC

Data Model design

Data Modeler

Data Visualization
Data Discovery
Data Governance
Application Application Application

1 NoSQL  NoSQL 
2 NoSQL  NoSQL / ETL /  NoSQL
3 (UDBC)  

Contents of this presentation are confidential and are being provided

pursuant to the NDA signed between CA and Buyer as well as the terms and conditions set forth in the Confidential Information Memorandum issued by

41

CA.


·  is the wild west. · Schema at read · NoSQL, ·  · UDBC ­ SQL · ERwin NoSQL Modeler

 






Oracle

z3 ­ SQL

zData ­ 

BayMax 

 

