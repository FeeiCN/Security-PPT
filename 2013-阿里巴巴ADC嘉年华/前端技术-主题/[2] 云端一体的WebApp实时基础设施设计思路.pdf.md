WEB APP

 
13724

LETS START WITH VIDEOS
13724

WEB

13724

WEB

Web
13724


· (CC Unifiy)
·  · Node.js
13724



· 

· 

·Ignore Interface

Person'Object' '
· 'Name' ·''''Birth'

13724

Client

Person'Object'
' · 'Name' ·''''Birth'

/get/person Query,'join'and'traverse''

serializaBon

URLh6p://some.host/person?name=someone&birth=1999

Before

Server
deserializaBon' &'mulBEtable'manipulaBon'

Person'Object'
' · 'Name' ·''''Birth'

AMer

Person'Object'
' · 'Name' ·''''Birth'

13724

CLIENT SIDE

before
//Person( $.get(`/get/person',(func5on(row){( ((((var(personObj(=(new(Person();( ((((personObj.name(=(row.name;( ((((personObj.birth(=(new( Date(row.birthday)( })( ( //Person( var(url(=(`hHp://somehost/person? name='(+(personObj.name(+(`&birth= `(+(personObj.birth.getTime();( ( $.post(url,(func5on(){( (((alert(`done');( })

aNer
//Person( var(person(=(subscribe(`person');( ( ( ( ( ( ( //Person( person.save();

13724

before
! ! ! ! ! ! ! ! ! ! ! ! ! 
13724

SERVER SIDE
a>er
publish(`channel',!func4on(param,cb){! ! !!!!!db.find(param).then(cb);! })! ! ! ! !

BENEFITS
·Ignore Server & Interface ·  · tradeoff  · 
13724

A TO DO LIST
13724

A TO DO LIST
13724

 TOP DOWN
· -- Choose whatever you want ·MVC / MVVM -- Spine, Knockout, Backbone, AngularJS ... ·Compile to JS -- batman, Dart ·Component -- polymer
13724

 TOP DOWN
· - key part ·ORM - bookshelf ·dual side legacy db Interface - redis, mongo
13724

 TOP DOWN

Client

RPC

RPC

Server

Local Collection
!
DB Simulator

Service proxy

Client Service 

InstData Connection Stream

InstData Connection Stream

Collection Cloud*DB

Service 

InstData Server Stream

13724

MODEL

fieldA.:.string. fieldB.:.modelB

modelB
fieldC.:.integer. fieldD.:.modelC
modelC
fieldE.:.string.

Deserializa(on.
Serializa(on

modelB fieldC.:.integer. fieldD.:.ref:modelC:*row_id
modelA
fieldA.:.string. fieldB.:.ref:modelB:*row_id

13724

 TOP DOWN
· - performance ·optimized db read or well-controlled memory cache ·diff & path enabled data protocal ·existence of data version
13724

 TOP DOWN
·  ·Javascript template engine - handlebars, mustache, icanhaz
13724

 TOP DOWN
·  · Websocket · XHR-Streaming · Commet · JSONP
13724

-
· 
13724

-
· --30%-40% 
13724

REMIND
· Performance ·Always design for Offline · Batter y
13724


· APP · MIT · SumeruClouda · 2013
13724

 
13724

Q & A
Thanks
Illustration source
http://coding.smashingmagazine.com/2012/07/27/journey-through-the-javascript-mvc-jungle/ http://www.agilemodeling.com/images/models/ormDiagramLarger.JPG http://skillcrush.com/wp-content/uploads/2012/07/term-nodejs.jpg http://bellite.io/index/backends_cloud.png http://pusher.com/images/ws_logo.png http://oregonstate.edu/career/sites/default/files/tips.jpg

