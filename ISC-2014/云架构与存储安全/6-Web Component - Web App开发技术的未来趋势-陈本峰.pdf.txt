<Web Components />
<!­ the future of Web development --->
---HTML5--
2014.9
China Internet Security Conference 2014 2014





404





JS 





Bootstrap 


...
<my-slider> <img src="1.jpg" /> <img src="2.jpg" />
</my-slider>

WebComponents
· Template · Custom Element · Shadow DOM · HTML Imports

Template

<script id="indexTemplate" type="text/template"> <h1>Inside a template </h1> <img src="/image/xyz.png"/>
</script>

Template
<template>
<template id="indexTemplate"> <h1>Inside a template</h1> <img src="/image/xyz.png"/>
</template>
var template =document.getElementById('indexTemplate'); holder.appendChild(template.content.cloneNode(true));

Template
<template>
·  ·  · 
... 

Custom Element
<my-slider> </my-slider>

Template
Custom Element<my-slider>
<template> <!­ my slider -->
</template> <script> var tmpl = document.querySelector('template'); var ImgSliderProto = Object.create(HTMLElement.prototype); ImgSliderProto.createdCallback = function() {
var root = this.createShadowRoot(); root.appendChild(document.importNode(tmpl.content, true)); }; var ImgSlider = document.registerElement('my-slider`, { prototype: ImgSliderProto}); </script>

Shadow DOM

Shadow DOM

Shadow DOM

Shadow DOM
Shadow DOM 
· DOM · 

HTML Imports
<link rel="import" href="my-slider.html">



myslider.html  index.html 



Web Components 
http://www.polymer-project.org/
http://x-tags.org/

