Smartfuzzing the Web
Carpe Vestra Foramina
Friday, June 24, 2011

Out of Date
· This presentation is out of date.
­ Grab an updated copy from our Google Code Page
· http://code.google.com/p/raft
2
Friday, June 24, 2011

Who are we?
· Nathan "Nate Dawg" Hamiel · Gregory "G-Fresh" Fleischer · Seth "The Law" Law · Justin "J-Roc" Engler
Friday, June 24, 2011

Presentation Overview
· Problems with current tools · Current workarounds · Proposed solutions · RAFT
Friday, June 24, 2011

Testing Tools Are Lacking
· Semi-automated web testing tools can be pretty dumb o Pick your poison, each one falls down at some point o Session data stays stale o State maintenance sucks or non-existent o Can't handle things beyond simple applications o Don't allow the import of externally-collected data
· What about modern technologies? o CSRF Tokens o Randomized DOM variables o RIA apps o Web services o JS/AJAX
Friday, June 24, 2011

The Problems Continue
· Typically no analysis is performed o Testing responses alone may contain a treasure trove of vulnerabilities that are not currently identified o Analysis only runs on current request, what about all the old data? o Just because HTTP is stateless, doesn't mean our analysis has to be. o No vulnerability or sensitive data identification
· Testers don't need abstraction o APIs and difficult formats
· Missing simple features o Request time
Friday, June 24, 2011

And Continue Again
· Difficult cases o Risk based logins o Login confirmation on next step o In-session detection
Friday, June 24, 2011

And Continue Yet Again
· External tools and custom scripts o Can be painful o No analysis o Request/response diffs o Syntax highlighting (duh)? o Full request/response logging
· Data in multiple tools o No cross-tool analysis o Archiving problems with collected data o Limited ability to find "new" bugs in old data
Friday, June 24, 2011

What Do People Do?
· Test manually o First of all, Yuck! o Modify other tools for purposes which they weren't intended o Write custom tools and scripts for one-off purposes
· Can end up missing quite a bit o Reinventing the wheel can be hard! o Typically one offs o No in-depth analysis o Even common vulnerabilities can slip through the cracks o Results are stored in custom formats in multiple files
Friday, June 24, 2011

Adapt Or...
· Some tools have to adapt or they become useless
Friday, June 24, 2011

A Web Smart Fuzzer?
Friday, June 24, 2011

A Web Smart Fuzzer
· Session management o Without complex user interaction o Shared cookie jar
· Sequence building and running o Login sequences o Multi-stepped operations o Grabbing data from previous page for request
· Finding content to fuzz o Intelligent spidering and form submission o Content discovery based on contextual information
· Support for modern features o HTML5
Friday, June 24, 2011

Web Smart Fuzzer Components
· CSRF and other random data handling o Ability to handle CSRF tokens per page o Ability to handle randomized data on the DOM
· Payload choices based on context awareness
Friday, June 24, 2011

Web Smart Fuzzer Components
· Tight integration of various components · Ability to easily experiment with new features
Friday, June 24, 2011

RAFT
Friday, June 24, 2011

RAFT
· Response Analysis and Further Testing · RAFT is different
o Not an inspection proxy o Focus on workflow o Analysis for your own tools and scripts o Import data from other tools · Open source (written in Python and QT) · Target Platforms o Windows XP / Windows 7 o Mac OS X 10.5 / 10.6 o Linux Ubuntu 10.4 LTS
Friday, June 24, 2011

RAFT Dependencies
· PyQT4 · QtWebKit · QScintilla · lxml · pyamf · pydns
Friday, June 24, 2011

RAFT Download
· Check out source from SVN · Download packages for
o OS X o Windows · http://code.google.com/p/raft
Friday, June 24, 2011

Analysis
· Don't be caught without an analyzer
Friday, June 24, 2011

Analysis
· Analysis Anywhere! o Our concept for better tools o Any analysis on any data source o Analyzers fully integrated with other tools in RAFT
· Modular Analyzers o New analyzers easy to add o Config, execution, and reporting all customizable o Analyzers can call each other
· Find the stuff that others ignore o Timing analysis o Same request, different response (no no, this /never happens) o Possibilities are pretty much endless
Friday, June 24, 2011

Smart testing components
· Fuzzing, just smarter o Handling of CSRF tokens o Browser object handling o Sequence handling
Friday, June 24, 2011

Documentation
· Who needs documentation... really ;) o Available on the wiki of the project page
Friday, June 24, 2011

RAFT Data Formatting
· Other language integration o XML Capture Format o Python o Ruby o Perl o Java
Friday, June 24, 2011

RAFT Future Features
· More Analysis · Integrated Scanner Functionality · Reporting Output · Command Line Interface
Friday, June 24, 2011

Call to Action
· We need help! o Contribute with code o Test and report bugs o Provide integration with other tools
· Future features o Request new features o Code new features yourself
· Demand better tools from commercial vendors as well
Friday, June 24, 2011

Questions?
Friday, June 24, 2011

Contact
Nathan Hamiel http://twitter.com/nathanhamiel Justin Engler http://twitter.com/justinengler Gregory Fleischer gfleischer@gmail.com twitter.com/%00<script>alert(0xL0L) Seth Law http://twitter.com/sethlaw
Friday, June 24, 2011

