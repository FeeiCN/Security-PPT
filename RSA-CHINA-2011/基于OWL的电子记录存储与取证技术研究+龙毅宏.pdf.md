OWL 
Electronic Record Storage and Forensic Technology Research based on OWL
 


 



 OWL (Web Ontology Language)  OWL  OWL

 OWL

(Electronic Record)
·  · (digital record) · 
­ (purchasing order)(contract) (medical record)(monitor video) (operation log)


·  (evidence)
 dsdgsjdgjsdgj sdgjs


· (tampering) (forgery)(removal)(destroy)


· (originality) (integrity)(originator or creator) 




· (digital signature) (public key)
·  (non-repudiation) 
· (time stamping)  (digital notarization)


· (retrieve evidence)  
­   
­  
­  ­ (Generic)



· (adducing evidence) (validity) (originality) (integrity)(originator or creator)
­  ­ 
­    


· (fairness)
­  


·  · OWL
 · 
 · 
­  ­ 

 



 OWL (Web Ontology Language)

 OWL

 OWL

 OWL

OWL (Web Ontology Language)
· Resource Description Framework (RDF) Web(Semantic Web)  RDF
· RDF(statements)(resources) (things)(individuals) 
·  

RDF
(statement):
http://www.example.org/index.html has a creator whose value is John Smith
· http://www.example.org/index.html (subject) · (property) creator 
(predicate) ·  John Smith(object)

RDF
· RDF(Uniform Resource IdentifierURI
http://www.example.org/index.html has a creator whose value is John Smith
· http://www.example.org/index.html · http://purl.org/dc/elements/1.1/creator
 · http://www.example.org/staffid/85740
(ID)

RDF
· RDF
http://www.example.org/index.html has a creator whose value is John Smith
RDF
<http://www.example.org/index.html> <http://purl.org/dc/elements/1.1/creator> <http://www.example.org/staffid/85740>

RDF
· RDF(Graph)RDF
<http://www.example.org/index.html> <http://purl.org/dc/elements/1.1/creator> <http://www.example.org/staffid/85740>

RDF

http://www.example.org/index.html has a creator whose value is John Smith http://www.example.org/index.html has a creation-date whose value is August 16, 1999 http://www.example.org/index.html has a language whose value is English
RDF
<http://www.example.org/index.html> <http://purl.org/dc/elements/1.1/creator> <http://www.example.org/staffid/85740> .
<http://www.example.org/index.html> <http://www.example.org/terms/creation-date> "August 16, 1999" .
<http://www.example.org/index.html> <http://purl.org/dc/elements/1.1/language> "en" .

RDF
RDF

RDF
·  (class)
· (thing)(individual) (instance)
· (class)(property) RDF

RDF
· RDF(class) (inheritance hierarchy) (super classbase class)(subclass)
· RDF(property) (inheritance hierarchy) (super propertybase property) (subproperty)

RDF(class inheritance)

HumanBeing subClassOf

subClassOf

Men subClassOf

Women

subClassOf

MarriedMen

UnmarriedMen

MarriedWomen UnmarriedWomen

MarriedMen(x)

Men(x)

HumanBeing(x)

RDF(property inheritance)

A hasRelative B A hasOffspring B

hasRelative subPropertyOf
hasOffspring

A hasChild B

subPropertyOf

hasChild

subPropertyOf

A hasSon B

hasSon

hasGirl

RDF
· RDF(name space) 
· (prefix)(local name) (qualified name)
prefix ex:, namespace URI: http://www.example.org/ prefix dc:, namespace URI: http://purl.org/dc/elements/1.1/
<http://www.example.org/index.html> <http://purl.org/dc/elements/1.1/creator > <http://www.example.org/staffid/85740>
ex:index.html dc:creator ex:85740

OWL
· OWL Lite, OWL DLOWL Full · OWL LiteOWL DL OWL DLOWL Full

· OWL DL(Description LogicDL) · (DL)(Formal
Knowledge Representation) · DL(Knowledge Base)
­ Tbox (Terminology Box)() ­ Abox (Assertion Box)()
· OWL Full(Undecidible)

OWL
· Owl(class)owl(owl:Thing) (subclass)
· Owl(property) owl:DatatypePropertyowl:ObjectProperty ()
­ owl:DatatypePropety 
­ owl:ObjectProperty()
· 
­ ex:Person1 ex:hasSon ex:Person2

OWL
· () 
·  ·  ·  · 
() ""
­ 

OWL
· 
­  ­ 

·  
·  · 


 



 OWL(Web Ontology Language)  OWL

 OWL

 OWL

OWL
· OWL(class)
­  
· OWL
­   
­ OWL
· OWL

(type)
· (class) 
· (type) (content)(organization) (representation)(storage)
· (type)  (Form)(File)+ (Form+File)

 (Form)
· (Form)(field) ()
· (Form)() 
­  
­ name1=value1& name2=value2... ""(name-value pair)name (ID)value
­ ""(Form)/  Form

 (File)
· File WordPDF

+ (Form+File)
· Form 
· 
­  ­ (
Uniform Resource LocatorURL)


· (http://example.com.cn) (MedicalRecord)
MedicalRecord
patientName patientID doctorName doctorID recContent ... doctorSignature



http://www.itrus.com.cn/RecordBaseClass



http://www.w3.org/2000/01/rdf-schema#subClassOf

http://www.w3.org/2000/01/rdf-schema#subClassOf

http://www.w3.org/2000/01/rdf-schema#subClassOf



http://www.itrus.com.cn/FormClass

http://www.itrus.com.cn/FileClass



http://www.itrus.com.cn/Form_FileClass

+

(class)
· (URIID) 
· FormFileForm+File 
http://www.itrus.com.cn/FormClass
http://www.w3.org/2000/01/rdf-schema#subClassOf
http://example.com.cn/MedicalRecord

(property)
·  
· ID · 
­ (record class property) ­ (instanceindividual)
(information property) ­ (instanceindividual)
(metadata property)


·  (record class metadata)
­  
­  ­ 


·  MedicalRecordpatientID
· FormForm+File (record field) (database table)
·  
·  



http://www.w3.org/2002/07/owl#DatatypeProperty

http://www.w3.org/2000/01/rdf-schema#subPropertyOf

http://www.itrus.com.cn/recordInfoProperty

http://www.w3.org/2000/01/rdf-schema#subPropertyOf

http://www.itrus.com.cn/signatureProperty


· ID(URI) 
· ()ID ID ID (IDlocal ID)
­ FormForm+File  IDID





http://www.itrus.com.cn/recordInfoProperty

http://www.w3.org/2000/01/rdf-schema#subPropertyOf
MedicalRecordID(patientID)

http://example.com.cn/MedicalRecord/patientID

http://www.w3.org/2000/01/rdf-schema#range

http://www.w3.org/2001/XMLSchema#string



ID

http://www.w3.org/2000/01/rdf-schema#domain

MedicalRecord

http://example.com.cn/MedicalRecord

+

http://www.itrus.com.cn/signatureProperty



http://www.w3.org/2000/01/rdf-schema#subPropertyOf

MedicalRecord

http://example.com.cn/MedicalRecord/doctorSignature

(doctorSignature)

http://www.itrus.com.cn/propertySigningList

http://example.com.cn/MedicalRecord/patientID
http://www.w3.org/1999/02/22-rdf-syntax-ns#first http://www.w3.org/1999/02/22-rdf-syntax-ns#rest
http://example.com.cn/MedicalRecord/doctorID
http://www.w3.org/1999/02/22-rdf-syntax-ns#first http://www.w3.org/1999/02/22-rdf-syntax-ns#rest
http://example.com.cn/MedicalRecord/recContent
http://www.w3.org/1999/02/22-rdf-syntax-ns#first


· (instanceindividual) 
· 
­  
­ ( )
·  
­  ­ ID




http://www.itrus.com.cn/metaDataProperty



http://www.w3.org/2000/01/rdf-schema#subPropertyOf

http://www.itrus.com.cn/recordOriginator

http://www.w3.org/2000/01/rdf-schema#subPropertyOf
MedicalRecord
http://example.com.cn/MedicalRecord/doctorID

http://www.w3.org/2000/01/rdf-schema#range

http://www.w3.org/2001/XMLSchema#string



ID

http://www.w3.org/2000/01/rdf-schema#domain

MedicalRecord

http://example.com.cn/MedicalRecord

OWL
· OWL 
· OWL (owl:ObjectProperty)  http://www.itrus.com.cn/recordRelation 
· 
RecClass1::?x hasSubRec RecClass2::?y
IF x.PatientID == y.PatientID


   OWL(Web Ontology Language)  OWL  OWL
 OWL

OWL
· OWL · OWL
 · OWL
()

OWL
·  
·  
· 
­  
­  


· OWL OWLRDF
·  
­ RecClass1::?x hasSubRec RecClass2::?y
IF x.PatientID == y.PatientID · SWRL (A
Semantic Web Rule Language Combining OWL and RuleML)


RecClassA::?X R RecClassB::?Y

RecClassC::?W

R1 RecClassA::?X
R2

R3

R5

R4 R6
RecClassE::?V

RecClassB::?Y

RecClassD::?U

 



 OWL(Web Ontology Language)  OWL  OWL

 OWL


·  
· 
­  ­  ­ 
()
·  · 
­  ­ (present a record in its original view as it
was first seen)



  




   

  

   







     

    


· 
­ OWL
· 
­ 
· 
­  ­ 
· 
­  ­ (FormForm+File
)





OWL







 

OWL 



 

       

       

       







()









