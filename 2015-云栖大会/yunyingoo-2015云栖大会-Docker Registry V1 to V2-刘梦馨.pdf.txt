Docker Registry  V1  to  V2
---- 
 

· Docker,  Image,  Registry,  Hub · V1  Python  Registry · V2  Golang Distribution ·  · Alauda hub

What  is  Docker?

Docker,  Image,  Registry,  Hub
· Pull  image · Run  image   · Build  image · Push  image

What  is  Image?

·  VS   ·  ·  layer

What  is  Registry?

A central place to store and distribute docker images
·  meta ·  ·  API  ·  git 

What  is  Hub?

· Git to  Github · UI · User  Auth · Public,  Private,  Organization · Webhooks,  search,  comment  ... · Dockerhub is  **Not**  open  sourced

V1  Python  Registry
**Deprecated* https://github.com/docker/docker--registry

V1  
·  ·  image  id ·  ·  layer  
·  ·  id   push · metadata->layer->metadata->layer · Python  
·  · Tag  

V2 Golang Distribution
https://github.com/docker/distribution

Digest
·  ·  · Cache   · Digest   ·  tag  

Manifest
·  layer  · Signature  · V1  · https://github.com/docker/distribution/blob/master/docs/spec/manifest--
v2--1.md


· Go  ·  pull


·  auth  ·  · Notification  ·  API


· API   · Delete,   search,  info
· Push/Pull    ·  V1  ****

V1   V2  


· >=1.6  v1,v2 <1.6  v1 · 0.9~1.8 ·  ·  docker 

V1  V2  
· Nginx  url  · Docker 1.6+   v2 v1 · Docker 1.5  v2   · https://github.com/docker/distribution/blob/master/docs/nginx.md

V1  V2  
· https://github.com/docker/migrator ·  docker 1.6 pull v1, push v2 · 
·  ·  ·  · Demo 


· V1  V2  hook p  ush    · Rabbitmq  · Worker  pull p  ush    · 


· Dockerhub  ·  pull    · Mirror    · 
· Qiniu 


·  ·  · 

Alauda hub
·  library, tutum, microsoft, sameersbn, selenium · 
· public, private, organization  ·  build · 

