Security and Privacy in Mobile Advertising

Hao Chen

University of California, Davis

Ads are the Financial Pillar of Mobile Computing
Most mobile software is free. · Android · Most apps
Where does revenue come? · In-app purchase · Ads

Mobile Ads Ecosystem
Parties · Users · App developers · Ad providers · Advertisers

Security Problems 
· App developers: ad revenue diversion due to cloning
· Ad providers / advertisers: ad fraud

Anatomy of Mobile Ad Traffic

Ad Revenue Diversion
Cloning harms app ecosystem
· Developers: lose revenue and incentives to make apps
· Markets: polluted search results · Users: difficult to find high quality apps

AdRob
Goals
Characterize cloned apps · Market · App category · Ad provider
Quantify impact on developers · Loss of ad revenue · Loss of user base

Dataset: 265,000 apps from 17 markets

Cloning between Markets
Found · >5,000 clusters of clones · >44,000 unique apps

Cloning on Each Market

Determine Impact
· Naive question How many times has an app been cloned?
· Better question How many people use a cloned app instead of the original?

How to Determine Impact
· Count the users running each app. · Determine the ownership of each app. · Classify original vs. plagiarized apps.

Count Users Running Each App
Potential vantage points · On the device · On the app server · On the network

Count Users Running Each app
Combine traffic analysis with static analysis
On the network · Capture ad traffic · Extract client IDs
In the lab, for each app · Extract client ID · Determine whether it is original or clone

AdRob

Traffic Analysis
· Collaborated with a major US cellular provider. · Captured 2.6 billion packets in 12 days. · Removed all user-identifying information.

Loss of Revenue and User Base

Web Ad Fraud Programs that automatically "view" ads and "click" them

Mobile Ad Fraud
Apps that automatically "view" ads and "click" them

MAdFraud
Goals
· Design system for automatically detecting ad traffic
· Use system to detect fraud and other undesirable ad behavior

Ad Fraud
· Impression fraud: request ads when in the background.
· Click fraud: click on ads without user interaction.

MAdFraud

Dynamic Analysis
For each app:
· Create an emulator and install the app · Run app in the foreground for 1 minute · Use an Intent to move the app into the
background · Run app in the background for 1 minute · Capture all network traffic throughout
Never interact with app to ensure all detected clicks are fraudulent

Identify Impressions and Clicks
Simple approach · Reverse engineer ad libraries to find ad request and click URLs · Use URLs to count the number of impressions and clicks
Problems · Time intensive for the many ad libraries (80+) · Lack context · Was the ad resold? · Was the click proceeded by an impression?

Automatically Identify Impressions and Clicks
Build request trees
Identify impressions using machine learning based on
· Request tree properties · Query parameters · HTTP properties
Identify clicks based on request trees and impressions.

Dataset and Results Overview
Dataset 150,000 apps crawled from 19 markets

Finding: Background Impressions 12,421 apps make impressions in the background

Finding: Click Fraud

Prevention
App cloning · Market-scale incremental clone detection
Ad fraud · Include proofs of user viewing or clicking provided by trusted software.

Conclusion
· Ads are crucial for sustaining mobile app ecosystem.
· Ads involves multiple parties with complex relationship.
· Many security problems affect different parties.
· Measurement is the first step toward solutions.

