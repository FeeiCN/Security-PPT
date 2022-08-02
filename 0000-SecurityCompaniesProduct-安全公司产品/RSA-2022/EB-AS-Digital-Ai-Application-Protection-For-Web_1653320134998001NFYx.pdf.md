Web Application Protection

ebook

Reducing web app risk
Web applications enable financial services and e-commerce companies to offer faster, better online experiences. Protecting web apps against malicious browser extensions, banking trojans, malvertisements and other attacks that result in consumer data being exfiltrated directly from web apps to fraudulent websites is critical.
To reduce risk and minimize web app and API vulnerabilities, web apps require comprehensive client code protection. Organizations need to protect the client-side of apps from being used as a vehicle to steal customer credentials, financial IDs and exfiltrate other sensitive information.
Web client code is especially vulnerable because about 98% of all websites run JavaScript. As an interpreted language, JavaScript can be easily intercepted, viewed, and compromised unless properly protected. A comprehensive web app security strategy should include clientside code and API protections, real-time monitoring and alerting, and swift responses to all phases of an attack from reconnaissance, weaponization and on through to exploitation.
Web application firewalls (WAF) are a traditional security solution often relied on to protect both the perimeter and server-side of business web applications.

But a WAF cannot protect against compromised code running in browsers. For example, sophisticated client-code compromises -- as exemplified by Magecart/formjacking attacks -- make attacks appear legitimate, by masquerading as authorized transactions in order to bypass the WAF and other forms of traditional security.

Digital.ai | Securing web apps

2

ebook

Why client-side web apps challenge business security
Modern web apps are vulnerable because they are downloaded and executed on the client-side of an app in the clear (as text files), which are easily readable by attackers. Adding to the problem, today's web apps also rely on APIs which "by nature expose application logic and sensitive data" according to OWASP. The attack surface that opens up as a result is massive.

The cybercriminal group injected 22 lines of malicious JavaScript into BA's web app. This type of attack, variously called "formjacking" or "webskimming" and originally known as "Magecart" because the filename to deliver the first attacks was mage.js, is carried out on 4,800 websites a month. JavaScript vulnerabilities and data exfiltration resulting from a compromised web app or API are -- or should be -- a nearuniversal concern in financial services, ecommerce, gaming, and beyond.

This combination results in a true bad actor's paradise. Very few organizations secure their code thoroughly to minimize these vulnerabilities with enterprise-grade obfuscation -- a process that transforms and rearranges code to make it virtually impossible to read while still retaining functionality when executed. Code obfuscation is also a critical first step to protect API URLs, keys or tokens, and other secrets.
The combination of vulnerabilities and lack of visibility leads to attacks. Perhaps the most famous attack to date occurred in the summer of 2018 when bad actors used a JavaScript exploitation to steal data from up to 380,000 British Airways customers.

Attacks can also circumvent traditional app and IT security controls. The Man-in-the-browser attack, for example, reverse-engineers web apps to tailor malware for a targeted approach. Another method is the Application Programming Interface (API) attack, which reverse-engineers web apps to discover how they interact with back-end APIs and then to subvert transactions. This information enables attackers to seem like legitimate requestors, so WAFs won't detect them.
Https://www.pcmag.com/news/you-need-to-protect-your-website-against-formjacking-right-now retrieved Sept 2021)

Digital.ai | Securing web apps

3

The anatomy of a web app attack
From an attacker's perspective, static app analysis -- the reconnaissance phase -- is the first step in finding vulnerabilities. Static app analysis reveals whether the attacker can easily read code and find useful information. In some cases, critical information is hardcoded into the app, inadvertently disclosing sensitive configuration data, API secrets, or encryption keys. Attackers can then use this information to attack an organization's back-office systems. The next step is to run the app in a debugging environment to understand how it functions. A debugger performs seemingly routine code inspection in order to discover how code operates with the goal to uncover vulnerabilities.
The attackers can then exploit these vulnerabilities by tampering with or inserting malicious code and changing the behavior of an app so it sends duplicate customer credentials -- in parallel -- to the business and to the attacker as it's entered into a web form.
Digital.ai | Securing web apps

ebook
4

ebook

The feedback problem

App Security requires App Monitoring

Most application security solutions currently available are not sufficient to detect or stop attacks before a breach occurs. They do not provide real-time, client-side threat monitoring, reporting, or response capabilities. Without a more robust and comprehensive set of protective measures in place, it is difficult to know if attackers are probing apps and APIs looking for exploitable vulnerabilities. Browsers operating on unmanaged devices running web apps are especially vulnerable to attack, and thus worthy of threat monitoring.

In order to react to attacks, organizations must first know whether or not their applications are being analyzed, run in untrusted environments, or being modified. Without this knowledge, organizations are powerless to react.
Digital.ai App Aware (formerly Arxan Threat Analytics) closes the loop, so organizations have visibility into app attacks and make informed business decisions.

When apps operate in unmanaged environments, outside of perimeter defenses such as firewalls, environment, organizations should assume that all data and functionality delivered by a web app, including the embedded API secrets, can be used as part of an attack -- via API request generation, API response interpretation, encryption and decryption routines, authentication procedures, and/or more. In this type of environment, enterprise web apps and APIs can be easily exploited by attackers. Without insight into a web app's comprehensive security posture, there's no way to react to any type of attack in a timely fashion.

Digital.ai | Securing web apps

5

Web app protection with Digital.ai Application Protection for Web
To counter the threats against web apps and client-side APIs, organizations need to secure their application code, protect API secrets embedded in the app code, be notified of an attack in realtime and automatically stop connections to unauthorized web sites. Digital.ai Application Protection for Web helps stop client-side threats before they can be used to compromise critical back-office assets with comprehensive web app protection.
Digital.ai's industry-proven code obfuscation makes it extremely difficult to analyze a protected web app and discover API-related vulnerabilities. Digital.ai Application Protection for Web can also help detect and stop malware attacks by understanding when JavaScript or HTML5 code is being modified to steal credentials, coopt transactions, or engage in other malicious activity. Digital. ai protected web apps provide ongoing threat notifications -- in realtime -- when attackers attempt to analyze or tamper with an app or API function, delivering timely intelligence and automatic defensive actions into the security posture of their applications.
Digital.ai code protection also stops unauthorized website or API access with the industry's first in-app firewall. This capability stops the exploitation phase by preventing web apps or APIs to connect and transmit data or credentials to fraudulent web sites.
Digital.ai | Securing web apps

ebook
6

ebook

The Digital.ai approach is multilayered:
Passive Protection through a range of obfuscation techniques to protect `in the clear' JavaScript code and APIs from being easily understood by attackers.
Active Protection to protect against browser data exfiltration with an in-app firewall by only allowing the app or API to connect with legitimate servers, and automatically respond with countermeasures when code analysis or tampering is detected by shutting down web app functionality or the entire browser.

Digital.ai's App Aware can help provide an understanding of the threats your web apps and APIs face from the moment they are published. App Aware provides critical alerts at the reconnaissance phase of an attack -- helping reduce time to detect and respond to attacks. Digital.ai Application Protection for Web integrates with rapid app development in the cloud.

Real-Time Threat Notification alerts the business if code tampering or analysis is attempted in order to enable an immediate operational response -- such as shutting down attacker accounts or updating web code protection to counter an attack.

Once Digital.ai protections are applied to client-side web apps, they can be automatically applied to each new revision of code -- greatly reducing the effort required when updating apps. Digital.ai delivers web protection capable of real-time alerting the business if an application's code is being attacked or analyzed -- leading indicators of future API attacks or the creation of targeted malware for man-inthe- browser attacks.

Digital.ai | Securing web apps

7

App Aware closes the feedback loop threat
Organizations can close the loop and enable informed decisions by using real-time client-side attack data. This type of feedback allows for apps to observe, decide, and adapt in order to employ effective counterattacks -- with immediate business responses, like shutting down account access or updating protections to counter newfound security vulnerabilities. Digital.ai Application Protection for Web client-side web application provides advanced reconnaissance-phase intelligence that lets you stop web app code and API attacks where they occur.
Digital.ai | Securing web apps

ebook
8

ebook

Digital.ai App Aware delivers
Global Intelligence -- Operational and anonymized app intelligence data from across Digital.ai's threat network provides a unique understanding of attack trends to understand the evolving threat landscape
Timely and Actionable Information -- Integrated analytics capabilities deliver visibility into web app security to help understand how apps are performing and when they're being attacked.
Proactive Response -- Timely insight to respond to attacks allows for a measured response to attacks before they become widespread

Digital.ai delivers the only web protection capable of real-time alerting if application or API code is being attacked or analyzed -- leading indicators of future API attacks or the creation of targeted malware for man-in-the-browser attacks, formjacking, DOM tampering, session abuse, overlay attacks, API abuse, and more.
Digital.ai added App Aware to help you understand if your web apps are being attacked, and how your business can now update protections in real time to stop these attacks before they can start. Digital.ai Application Protection for Web is straightforward to integrate with development operations by protecting web apps via on premises or cloud based solutions, integration into SIEM, BI and fraud prevention platforms.

Confidence Through Verification -- Operational reporting is available the moment apps are deployed to provide a rapid understanding of the threat environment apps are operating in.
Increased Visibility -- Convenient web-based reporting with easy integration into SIEM, BI and fraud prevention platforms.

Digital.ai | Securing web apps

9

Web application exploits are the most common form of attack.
Forrester "That State of Application Security, 2021"

Use case: financial services
A large financial services company widely deploys web apps running JavaScript to support online banking transactions.
Challenges
Banking customers download malicious browser extensions that steal their passwords and/or use their logged-in sessions to harvest information and perform unauthorized operations. App tampering leads to access to internal web apps, and theft of sensitive data.
Solutions
Digital.ai Application Protection for Web detects malicious extension activity, stops unauthorized web connections from being established providing the bank the necessary time to take action by suspending accounts and notifying customers -- all while providing the business time to neutralize the threat before it can cause a major business impact.
Results
Deployment of Digital.ai Application Protection for Web makes it extremely difficult to analyze the web app and learn the weaknesses of its code. All attempts to break through are detected and the bank is immediately notified. Integrating Digital.ai App Aware data into the bank's SIEM solution allows for the correlation of unusual event times, places, and users. These results enable the bank to take both automatic and human-oriented measures to prevent future incidents.
Digital.ai | Securing web apps

ebook
11

ebook

Use case: e-commerce
A large e-commerce company widely deploys web apps running JavaScript and APIs to support online shopping, and customer support transactions.
Challenges
Attackers scan the web with `fingerprinting' to identify off-the-shelf shopping cart implementations on e-commerce sites. Standard tools enable exploitation of shopping cart vulnerabilities for fraudulent purchases or installing malware to target web app users. Customers also download malicious browser extensions that steal their passwords, inject competitive ads, abuse affiliate programs, and/or send users to competitors' websites.
Solutions
Digital.ai Application Protection for Web obfuscates web app source code so it is harder to identify what platform is being used to run the organizations e-commerce site. App Aware also provides visibility and context to activity happening within the web application and can detect threats from the moment a debugger is connected to try to read the app code, and can take defensive actions if any sort of code tampering or injection is attempted.

Results
Deployment of Digital.ai Application Protection for Web makes it difficult to fingerprint known e-commerce tools and harder to exploit vulnerabilities. The business will be notified of any detected attacks, browser access to unauthorized websites is prevented and web app functionality can be deactivated. An understanding of any unusual events, times, places, and users enables organizations to take both automatic and human-oriented measures to prevent future incidents.

Digital.ai | Securing web apps

12

Focused on comprehensive app security
Protecting web apps and APIs requires a comprehensive approach that addresses vulnerabilities in code on servers and on clients. Many banks and e-commerce companies have already invested in server- side app security. Protecting the client side of the app -- and the APIs they rely on -- is also essential.
Digital.ai Application Protection for Web protects client-side code and APIs, prevents reverse engineering and stops unauthorized website access. It also delivers real-time threat reporting and analytics. With Digital.ai Application Protection for Web, you can become aware of and respond to exploratory probes before attacks can breach APIs to backend systems.
Advanced threat intelligence data from Digital.ai Application Protection for Web easily integrates with enterprise security log management and SIEM platforms for a comprehensive, real-time view of app security.

ebook
We invite you to learn more about Digital.ai's solution for securing client-side web apps. Digital.ai/contact

About Digital.ai
Digital.ai enables enterprises to focus on outcomes instead of outputs, create greater business value faster, and deliver secure digital experiences their customers trust. The Digital.ai Value Stream Platform seamlessly integrates all the disparate tools and processes across the various value streams, uses data and AI/ML to create connective tissue between them, and provides the real-time, contextual insights required to drive and sustain successful digital transformation. With Digital.ai, enterprises have the visibility they've been seeking to deliver value, drive growth, increase profitability, reduce security risk, and improve customer experience.
Learn more at Digital.ai

Digital.ai | Securing web apps

©2021 Digital.ai is a trademark of Digital.ai Software, Inc. 13

