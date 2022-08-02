 Martin Holst Swende
 @mhswende
 Patrik Karlsson
 @nevdull77

 Is very diverse: from a low-level infrastructure point-of-view to high-level application flow
 There are many tools, but a central component is an intercepting proxy
 Usually complex beasts

Feature Sitemapping

Requirement Must be in proxy?
Traffic data No

Content analysis Traffic data No

Fuzzing Spidering

Traffic data No Traffic data No

Interception

Live traffic Yes

Manual request Traffic data + No sockets

Manual inspect Traffic data No

Sess. id analysis Traffic data No

Search

Traffic data No

Possible alternatives
Http-level: trivial. Based on html inspection : e.g. in browser DOM­ javascript. W3af, ratproxy, proxmon, webscarab, burp etc JBroFuzz Browser-based spiders with DOMaccess. Many choices. None An http/html/json/xml editor + sockets
An http/html/json/xml editor Stompy Wide range: grep to lucene

 It hogs my machine
 Oh noes: OS updates itself through the proxy  They usually don't perform well after a few thousand
requests
 It is not flexible
 Ok, I see the GET-params in the overview.
 ...but now I want to see the POST ­ params  ... and now I want to see which of my browsers sent it  ... and now I want to see all Server-headers. Ordered by path.  ... and now I only want to see responses with content type
application/json and the value of the json parameter "foobar".
 And what's with all these cookies eating my screen real estate?
 It is not open
 I wonder if <tool> would've detected that internal ip address?  "Let's chain it: Webscarab, Burp, Paros and Ratproxy"
 The road to madness...

 Write an intercepting proxy
 Lightweight
 Memory-consumption does not grow with traffic  Streams all non-captured traffic to destination asap
 Recording
 Saves to database - MongoDB
 Document store where parsed data is stored as JSON documents  Platform independent, Open Source and fast
 Write an analysis engine
 Flexible
 Using MongoDB advanced querying facilities  Using dynamic views for data
 And open
 With several different ways to analyse, export and utilise existing applications.

 Based on Owasp Proxy (by Rogan Dawes)  Records traffic to DB, both in parsed object
form and the raw binary data.  TCP interception (still in alpha)  Syntax highlightning  FQ/NFQ intercept mode (think freedom as in
telnet)  Proxy chaining  Reverse proxy mode  ...This is definitely not your all-in-one proxy!

 What is it?  What does it do?  Why use it?  How do I get it?  What does it run on, prerequisites?

 What is it?
 A MongoDB browser, with additional functionality to extract and display information geared towards web application testing.
 A platform for utilising existing tools on prerecorded data.

 What does it do?
 Displays traffic data as defined by the user  Traffic and pattern aggregation  Traffic analysis via w3af and ratproxy  Export recorded traffic to other proxies  Filter and sort data  And more...

 It is simple to write the kind of view you need for the particular purpose at hand.
 Example scenarios:
 Analysing user interaction using several accounts with different browsers, you are interested in cookies, user-agent
 Analysing server infrastructure
 Server headers,Banner-values, File extensions,Cookie names
 Searching for potential XSS
 Use filters to see only the requests where content is reflected
 Analyzing brute-force attempt
 Request parameter username, password, Response delay, body size, status code and body hash

The v0 parameter is the object id. This column uses 'Coloring', which means that the value is not displayed, instead a color is calculated from the hash of the value.

 Aggregation (grouping) is a feature of MongoDB.
 It is like a specialized Map/Reduce
 You provide the framework with a couple of directives and the database will return the results, which are different kinds of sums.
 Pass JS right into the DB
 Example scenarios:
 Generate sitemap
 Show all http response codes, sorted by host/path
 Show all unique http header keys, sorted by extension
 Show all request parameter names, grouped by host
 Show all unique request parameter values, in grouped by host

 Datafiddler has a mechanism to run selected traffic through third-party plugins. Currently implemented*:
 Ratproxy plugin. Starts ratproxy process, feeds traffic through it, and collects output.
 Generic proxy plugin. Feeds data to a proxy (e.g Burp) which in turn uses a Datafiddler as forward proxy.
 Webscarab export. Writes traffic data to webscarab save-format. Useful e.g. to do manual requests edit or use fuzzer.
 * Defcon19-release

 Why use it?
 To better be able to make sense of large bodies of complex information
 To maintain control of your data by not tying it to one single application

 How do I get it?
 Download the source
 https://bitbucket.org/holiman/hatkit-proxy/  https://bitbucket.org/holiman/hatkit-datafiddler/
 Or the released binaries
 https://bitbucket.org/holiman/hatkit-proxy/downloads  https://bitbucket.org/holiman/hatkit-datafiddler/downloads
 And check out the documentation
 https://www.owasp.org/index.php/OWASP_Hatkit_Proxy_Pr oject
 https://www.owasp.org/index.php/OWASP_Hatkit_Datafiddl er_Project

 What does it run on, prerequisites?
 Python  Qt4  PyQt4 bindings  Python MongoDB driver  MongoDB  (optional: w3af)  (optional: ratproxy)
Tested on Linux and MacOSX

 Upcoming features
 Cache proxy
 Datafiddler can act as forwarding proxy and use collected traffic as cache. On cache miss, it can either contact remote host or issue 403. This enables:
 Resume aborted Nikto-scan  Gather e.g. screenshots post mortem without access to target
 Fuzzer integration
 Send requests directly to a fuzzer.
 New release at Defcon19!

For web application testers, the Hatkit combo is very useful for analyzing remote servers and applications, from a low-level infrastructure point-of-view to high-level application flow.
For server administrators, The Hatkit Proxy can be set as a reverse proxy, logging all incoming traffic. The combo can then be used as a tool to analyze user interaction, e.g. to detect malicious activity and perform post mortem analysis. The back-end can scale to handle massive amounts of data.

 To learn more or join the project, join the mailing lists
 Owasp-hatkit-datafiddlerproject@lists.owasp.org
 Owasp-hatkit-proxy-project@lists.owasp.org

 Questions?

