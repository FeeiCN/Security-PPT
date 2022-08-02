© 2018 SPLUNK INC.
Zipkin & Splunk: Tracing Transactions Across Your ecosystem
Tom Martin | Staff Practitioner, Splunk tomm@splunk.com
October 2018

Zipkin & Splunk: Tracing Transactions Across Your Ecosystem

© 2018 SPLUNK INC.

 Session ID: 1256
 Title: Zipkin & Splunk: Tracing Transactions across your ecosystem
 Abstract:
Containers, microservices and serverless computing are here to stay, but how do you track performance across these complex, short-lived ecosystems? Zipkin is an open source, open tracing library that enables you to trace transactions from system to system in a standard way. Those traces can be collected and visualized in Splunk! Come see how to use Zipkin and Splunk together to see how transactions navigate your systems and services.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda

1. App Dev Flashback & Future 2. Observability vs. Monitoring 3. Distributed Tracing 4. Open Tracing 5. Zipkin + Splunk 6. Demo

© 2018 SPLUNK INC.

Let's Start at the Beginning
Containers, Microservices and Serverless...Oh my!

© 2018 SPLUNK INC.

 Monolith apps  Distributed apps  Microservices  Serverless  Transactions  External Systems?
 How do I monitor this?

Docker Containers, Kubernetes Pods

But Wait, There's More Complexity
 Dockerless Containers (OCI), Kubernetes or Mesos?  AWS, GCP, Azure or all together?  IaaS, PaaS  DevOps, CI/CD (what version?)

© 2018 SPLUNK INC.

 How Do I monitor this? Logs, Metrics & Tracing
"Observability"

Monitoring or Observability?
Both!

Monitoring
 Logs & Metrics  Passive (poll)
· `I observe you'  Measure machines, networks, apps  Overall Health  Use Cases
· Monitoring · Alerting · Troubleshooting · Capacity Planning

Observability
 Logs, Metrics & Traces  Active (push/code)
· `Make yourself observable'  Measure interactions  Granular Insights  Use Cases ++:
· Debugging · Distributed Tracing · Performance Analysis · Behavioral Analytics

© 2018 SPLUNK INC.

Distributed Tracing
 A long history... · Tag-and-Follow · Application Tracing · Transaction Tracing · Cross Process Tracing
 Conceptually easy, but difficult to implement
· GUID? SessionID? UserID? · Wait...I can't change that system · Multiple Vendors · No consistency

© 2018 SPLUNK INC.

Enter Open Tracing
 In the beginning... · There was Dapper (2010)
 Great if you're Google L · Consistent hardware · Application templates · Zero involvement to instrument
 Enter OpenTracing · Consistent, vendor-neutral APIs · Multiple implementations · Plug-n-Play
 Zipkin, Jaeger, Lightstep

© 2018 SPLUNK INC.

ZipZWiphkaint?
An OpenTracing Implementaion

© 2018 SPLUNK INC.

Zipkin OpenTracing with Splunk!
Topology

© 2018 SPLUNK INC.

Performance Metrics Traces

OK, But How?
 HTTP Event Collector  Zipkin `Recorder'  Application Code
// Create an instance of the Splunk recorder const {recorder} = require('./recorder'); // initialize tracer const tracer = new Tracer({ctxImpl, recorder}); // instrument the client const zipkinRest = rest.wrap(restInterceptor,{tracer, serviceName: 'frontend'});

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo!
Splunk + Zipkin

More Visualizations...
 More on this tomorrow 

© 2018 SPLUNK INC.

Helpful Links

© 2018 SPLUNK INC.

 Dapper Paper  OpenTracing - http://opentracing.io/
 Open Source Implementations · Zipkin - https://zipkin.io/ · Jaeger - https://www.jaegertracing.io/
 Commercial Implementations · LightStep - https://lightstep.com/ · Instana - https://www.instana.com/

 This Demo: · Zipkin-Demo Github Repository · Docker image (Splunk with Zipkin App)
 Jaeger Demos & Tutorials · Distributed Tracing with NGINX · Jaeger Implementations · HotRod Tutorial · MicroDonuts · Case Study: Distributed Tracing @ Uber

Thank You!
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

