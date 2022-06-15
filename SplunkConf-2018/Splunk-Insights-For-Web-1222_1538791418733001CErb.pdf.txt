© 2018 SPLUNK INC.
Splunk Insights for Web and Mobile Apps (BETA)
DEV1222: Make Your App Stand Out
Sam Gazitt, Product Management Director Hemendra Choudhary, Principal Software Engineer Oct 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Hello!

© 2018 SPLUNK INC.

SAM GAZITT
Product Manager Splunk, Buttercup Games

v
HEMENDRA CHOUDHARY
Principal Software Engineer Splunk, Buttercup Games

Who are you?
And what you'll learn...

© 2018 SPLUNK INC.
1. Web or Mobile App Developer 2. Application Support Professional 3. Product Manager 4. Engineering Management 5. Other?

© 2018 SPLUNK INC.
How do you make your apps stand out
from the rest?
Improve quality, engagement, and performance

Explosion of Touchpoints!
Millions of apps across hundreds of form factors

© 2018 SPLUNK INC.

More apps

More touchpoints

What Makes a Great End-User Experience?
"Started from the bottom, now we here"

© 2018 SPLUNK INC.

Delivers business goal
Optimized design Fast and fluid interactions
Functions correctly
Doesn't crash

Good:

Empowering Your Developers
Put analytics directly in their hands!

© 2018 SPLUNK INC.

Customer finds issue
Better:

Support handles

Details in ticket

QA investigates

Dev fixes

Ops releases

App crash or event
Best:

Crashes and events in Splunk. App support team creates dashboards and alerts

QA/Dev responds to alert

Ops releases

Developers design analytics in Splunk, App support team enhances with more data sources

© 2018 SPLUNK INC.
Introducing...
Splunk Insights for Web and Mobile Apps (BETA)
Drum roll please...

What Makes a Great End-User Experience?
Move up the pyramid with Splunk insights for Web and Mobile Apps (BETA)

© 2018 SPLUNK INC.

Delivers business goal
Optimized design Fast and fluid interactions
Functions correctly
Doesn't crash

Collect critical events, transactions Collect navigation events Collect static asset load times Collect API calls and responses Collect iOS, Android, and JS crashes

© 2018 SPLUNK INC.
Using Splunk Insights for Web and Mobile Apps

1. Create Account

Developer

2.Get API Key

Splunk Account

4. Initialize Session
Initialize Session

3. Download

SDK

Application Server

© 2018 SPLUNK INC.
Using Splunk Insights for Web and Mobile Apps

Applications

Cloud Service

Monitor

Analysis

Share

What's under the covers?

You

Our service(s)

© 2018 SPLUNK INC.

Apps

Ingestion Pipeline

Splunk Index

Dashboards

Demo Time!
ButterCup Go launches their game on the Web

© 2018 SPLUNK INC.

 Setup  Instrumentation  Web UI
· Mobile App Crashes · Web Sessions · Best Users · Web Performance · Sharing Results  Getting Insights!

Setup
Get API Token and SDK
 Create an account and generate an API key for each app that you want to monitor.
 Install the Web or Mobile SDK using popular package management tools like npm or CocoaPods
 Offline install options also available such as adding SDK manually in Android Studio or embedding JS SDK in a <script>
 Get started in < 5 mins

© 2018 SPLUNK INC.

Instrumentation
Start a session
 Embed the minified script in <head>  Initialize a session to automatically
collect
· Console logs · Explicitly logged events · Console errors (handled, unhandled) · Environment information · Page load timings
 The SDK collects many things automatically

© 2018 SPLUNK INC.

Instrumentation
Specify the user
 You can optionally tag events with a user identifier (such as email)
 The SDK generates a unique uuid for you as well.
 Track behavior of each user

© 2018 SPLUNK INC.

Instrumentation
Create custom "Events" and "Transactions"
 Define custom user interactions  Events are anything you want to
capture and count  Transactions represent a sequence
of user events.
 Track a sequence of user interactions

© 2018 SPLUNK INC.

Please help us

© 2018 SPLUNK INC.

Go to http://buttercup.run

© 2018 SPLUNK INC.

Summary
Make your apps stand out

1. Experience matters 2. Empower your developers 3. Create an end-to-end view with Splunk

© 2018 SPLUNK INC.
Get Started Today splunk.com/iwma

