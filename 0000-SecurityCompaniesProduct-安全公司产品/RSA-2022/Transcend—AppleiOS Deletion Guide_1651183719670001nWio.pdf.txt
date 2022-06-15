UP E DAT D 2022

B B : uilder's rief
Apple's in-app account deletion requirement

Any app in the iOS App Store that requires account creation must provide an end-to-end pathway for in-app acccount deletion by June 30, 2022. Announced at the 2021 Worldwide Developers Conference, Apple's initial deadline for this functionality was January 31, 2022.


Impact score
High
Missing compliance could mean y bo loucrkiO edS a upd pautped saotreesvm en ayrebm eoval b folo r y co ke ud r i.OS app.

Who's impacted?
Any companyiew s w ithita hn app sininthAepiO plS e'sAiO ppSSstto orree that offersuasc ecr o au cc no t unt creation, b thuattddooenso n'tt o cfufe rrreanntly op ptrio ovnidfoer in-app a dcecleotu ionnt fdro em lettiohne. app.

What's the deadline?
Ja Jn uu na er3y03,12, 0 20 22 22

Your strike team
&Ì PPrriivvaaccyy eEnnggiinneeeerriinnÂ &Ì AApppp eEnnggiinneeeerriinnÂ &Ì CCoommpplliiaannccee/oLreLgeag aÀ &Ì UUXX//AApppp dDeessigigÎ &Ì YYoouurr ddaattaa pprriivvaaccyy
iinnffrraassttrruuccttuurree ppaarrttnneerr



The clock is ticking for iOS developers to offer in-app account deletion. Here's how to respond.

T J 31 2022 he original deadline for in-app account deletion functionality was anuary

,

, but Apple has since

x J 30 2022 x q e tended the deadline to une

,

. Despite this e tension, the re uirement itself remains unchanged.

If your app doesn't include significant account-based features, let people use it without a login. If your app supports account creation, you must also offer account deletion within the app.

( Unlike most regulatory regimes, which allow companies to use manual processes like forcing consumers to q ) q .
 send deletion re uests via email , Apple's new App Store re uirement puts the onus on developers

I x n the deadline e tension announcement, Apple included additional guidelines outlining what developers  
 should consider when building their in-app account deletion functionality.

Builder's Briefing: Apple's requirement for in-app deletion of accounts

Learn more at www.transcend.io

1

F The in-app account deletion option should be easy for users to fin# F Users should be able to delete personal data while deleting their accoun( F Providing a mechanism for temporary account deactivation is insufficien( F Additional support flows may be required for apps in "highly-regulated" industrie F Apps should continue to follow relevant local laws in regards to storing user account information


Apple's original memo on the policy change also reminds app owners to use this deadline to ensure in-app privacy policies clearly explain, "what data your app collects, how it collects that data, all uses of that data, your data retention/deletion policies, and more as described in the guideline."


The new deadline for the in-app deletion requirement is June 30, 2022, and with only a few months left before the deadline, many popular iOS apps still don't have the required functionality. 


Implications for non-compliance
Apple has yet to state what will happen to apps found to be non-compliant. However, the consensus speculation is that those apps will have future updates blocked or potentially face deletion.


Either way, it's safe to say any organization relying on in-app traffic and associated revenue shouldn't risk a roadblock when their app's next update is up for review by Apple. 


In terms of your mobile development and engineering teams, the implications of this shift largely depend on what, if any, deletion workflows already exist in your app. 

Updated guidance on full deletion vs. initiation
If your app doesn't require account creation, this update is no cause for concern. However, if your app does require account creation, you must ensure users can complete full account deletion from within the app. 
 This emphasis on an end-to-end in-app mechanism represents another shift from the original guidance, in which Apple stated that:

...all apps that allow for account creation must also allow users to initiate deletion of their account from within the app.
This statement led to speculation that, if developers provided a way to initiate account deletion within the app, they wouldn't necessarily need to provide a mechanism for full deletion. However, it's since been made clear that the focus must be on building out a full account deletion flow.


Apple also noted in it's original guidance that for those that do require account creation, developers should take a data minimization approach and evaluate if a login is even necessary. For some, removing account creation functionality could be the best option. 


Alternatively, if you're using a privacy infrastructure platform like Transcend that encodes and automates this process throughout your tech stack, you're in a strong position already. 



If this is your company and you're already working with a partner like Transcend, skip ahead to
Good news for those who already have automated account deletion.

Builder's Briefing: Apple's requirement for in-app deletion of accounts

Learn more at www.transcend.io

2

Manual account deletion workflows will not be enough
For those who don't have an in-app account deletion workflow in place, the work needs to start now. Under the original guidance, where it seemed like deletion initiation may be enough, manual workflows could have been an effective stop gap measure­a user initiates deletion within the app and then an internal team manually fulfills the request. 


However, with the latest clarification, it's clear that manual workflows are incompatible with an end-to-end in-app deletion process. 


Interested in understanding the hidden costs of manually processing GDPR and CCPA-

? O P R q C C based consumer privacy requests

ur free rivacy e uest ost alculator can

( S z ) help and includes a free Google heet template for customi ation .

There's some conjecture as to whether Apple's guidance could translate to merely automating account deletion to your main authentication/user database, or something closer to how GDPR and CCPA define deletion i.e. the complete deletion of an account holder's personal data.


Our recommendation is to choose the latter path for two reasons. For one, it ensures you're building for the widest possible compliance scenario. Remember, outside GDPR and CCPA, there are over 15 state privacy laws being considered in 2022, with three coming into full force in 2023. 


More importantly, it shows respect for your user's data agency. At the end of the day, it's reasonable for your account holders to expect that when they hit delete, they mean delete -- and a marketing email the next day could very well destroy any hope of a user returning in the future.



Interested in learning more about what's involved in architecting and automating this flow

( )? S H T and the savings involved with this approach

kip ahead to ow ranscend can help

or reach out to schedule a free consultation with our solutions team.

Good news for those who already have automated account deletion
If you have programmatic deletion workflows already in place, that don't involve humans completing manual steps­you're more than halfway there in terms of complying with Apple's requirement. Your attention then turns to integrating that flow into your in-app surface.


You'll want to expose an interface that allows your account holders to prove their identity and tap a button or link to initiate their account deletion within your application. Your UX/UI teammates will be able to assist in terms of placement within existing navigation, but the path of least resistance would be to embed the interface you've already built in your web application for this same purpose. 


Builder's Briefing: Apple's requirement for in-app deletion of accounts

Learn more at www.transcend.io

3

If you're a Transcend customer, skip ahead to How Transcend can help for more specific information on how you could accomplish this

When redirecting the user from within your mobile app to such a web view, you will likely want to maintain the session between the mobile app and the web browser. One way to do this would be to use a JWT (JSON Web Token) magic link. Once the user is logged in on your mobile app, your backend can sign a shortlived JWT that attests to the user's authenticated session and serve up that JWT to the iOS client.

Going a level deeper, your deletion button or link that initiates account deletion could be implemented as a simple redirect to your web client (for example, to redirect to https://my.company.website.com/accountdeletion#JWT). Your browser could then parse out the JWT from the hash URL parameter, verify that it was signed by your backend, and if so, automatically log that user into the web client where they can initiate the account deletion.



Once the deletion is triggered, your chosen workflows can then go to work actioning the deletion across your internal databases and other connected data systems, with a confirmation of deletion sent to the user most likely via email once the job is automatically completed.

Watch out!

With an increase in deletion request traffic likely if you haven't already enabled in-app deletion, use this moment to check your current workflow on two fronts: that (1) you're deleting personal data across the gamut of systems in use (don't forget SaaS vendors where your marketing emails may be triggered from), and (2) that you have appropriate deletion dependencies in place so that no data is being recreated as part of the deletion process in one of your systems.

How Transcend can help
If you don't have an established privacy engineering team or are looking for a more efficient approach to privacy code development, then it makes sense to find an engineered data privacy infrastructure partner like Transcend. We can handle your privacy request fulfillment needs, from iOS in-app account deletion to GDPR compliance, and get you technically ready for any new laws on the horizon--all built on a robust security architecture.


In the case of this specific requirement, a new customer could get set up using prebuilt workflows and connections, and be in a place to hand a link off to your mobile developers in just a couple of hours­ensuring that when a user submits a deletion request, you'll be fulfilling their request across your core user database. You can then continue to add your existing systems to ensure you've got full data systems coverage. 


Once connected to your app, your users can then securely authenticate as described above, and Transcend can delete data across your data systems via webhook or other integration methods.


It's very likely that Apple's requirements will continue to strengthen and could evolve from initiating deletion to requiring personal data visibility within an app where an account is created. With Transcend, you'll be well equipped to handle any permutations or evolution of the app guidelines here.

Builder 's Briefing: Apple's requirement for in-app deletion of accounts

www. . Learn more at

transcend io

4

And it goes beyond app-based deletion. Partnering with a data privacy infrastructure partner like Transcend means when it comes time to comply with the trio of new U.S. privacy laws (California, Virginia, and Colorado) coming into force in 2023, you'll already have a platform in place to seamlessly comply.

In summary

Come June 30, 2022, any app in the iOS App Store that offers account creation must also provide an end-to-end pathway for account deletion within the app itself.
 The technical implications of this change vary depending on existing technical data deletion workflows you have in place. 
 Apple's update is part of a broader change driven by modern privacy laws, and any infrastructure that automates data orchestration and deletion will put organizations in a strong position for future data rights compliance.  


About Transcend Transcend is the privacy platform that makes it easy to encode privacy across your tech stack. 

Our technology moves companies into the future of data privacy with freed-up resources, enhanced regulatory stances for the laws of today and tomorrow, and stronger relationships with their customers through respectful and compliant data transparency, consent, and control.
 Transcend Privacy Requestsorchestratesalluserinformationfromacompany'sdatabases,SaaStools, and applications in one powerful system. Plus, their users are confident their preferences are seen, understood, and valued. 
 Transcend Consent goes beyond cookies to ensure nothing is tracked without user consent, plus saves time and resources on configuration­all without sacrificing site performance or UX.
 Transcend Data Mapping keep tabs on all data records, owners, and systems changes, and includes actionable privacy governance like fulfilling privacy requests and auto-generating Record of Processing Activities (ROPA).

Reach out to learn more
Learn more at www.transcend.io

Appendix

Rapid Response Conversation Starters

In this briefing guide, we ran through the different scenarios you need to consider in responding to Apple's change in guidelines. Regardless of how far along you are, the below questions can help ensure you can move fast in bringing your iOS app into compliance. 


For your crossfunctional strike team

Do we really need account creation in our app?
 Apple's guidelines come from a place of data minimization, so this is a good moment to assess if you still require this functionality.
 Do we have an existing technical workflow in place for deletion that we can repurpose for this update?

 If your organization is already accepting consumer data privacy requests (or Data Subject Requests/DSRs) as part of GDPR or CCPA compliance, you'll have some process established, but the key business question is whether it's automated to cope with the increased volume of deletions that could result from this change.
 Data coverage is key -- ensure you're not missing any SaaS systems as part of your deletion workflows.
 If not, how do we get there? 
 See our thoughts in How Transcend Can Help here, but the right data privacy infrastructure partner can quickly get you in compliance and drive real savings for your organization in the process (see our Privacy Request Cost Calculator for more on this topic). 
 Do we have a clear project plan to fully implement this update by June 30, 2022?


For privacy engineering teams

What existing deletion workflows can we reuse for this change? Are any modifications needed to support an in-app experience?

 Do we have the right authentication workflow in place to support an in-app deletion workflow on mobile devices? Or do we need to build something new here?

 Have provisioned resources for this in our Q1/Q2 2022 roadmap?


Builder's Briefing: Apple's requirement for in-app deletion of accounts

Learn more at www.transcend.io

6

For legal teams

Is our data or vendor map up to date across the organization? Do we have confidence in where data is stored?


Is other privacy information on our Apple Store listing up to date and accurate?


For user experience/ user interface teams

Where will this deletion request fit into our existing in-app user experience?


Are we designing something that is clear and obvious to the user, and is not obscuring deletion in a way that confuses the user?


For in-app teams

Is this on the roadmap to add into our app interface by June 30?


Is app privacy information on your app listing accurate? If not, are there plans to work with legal to update and tie in this update?


Sources

Deadline for in-app purchase and account deletion requirements extended
 Apple Inc.-https://developer.apple.com/news/?id=i71db0mv


App Store Review Guidelines
 Apple Inc. - https://developer.apple.com/app-store/review/guidelines/#5.1.1

Account Deletion within Apps Required Starting January 31 - News
 Apple Inc. - https://developer.apple.com/news/?id=mdkbobfo
  
 Apple Is Making It Easier to Delete Accounts Attached to Third-Party Apps
 Ian Campbell - https://www.theverge.com/2021/10/6/22712795/apple-developer-account-deletion-appreporting

Builder's Briefing: Apple's requirement for in-app deletion of accounts

Learn more at www.transcend.io

7

