YOUR MENTAL HEALTH IS FOR
SALE
Eliot Bendinelli & Frederike Kaltheuner

Blackhat Europe December 2019 - #BHEU

2

We fight government and corporate surveillance and advocate for a world where technology empower and enable us, not exploit our data for profit and power.

Blackhat Europe December 2019 - #BHEU

5

BACKGROUND
Making the systemic outrageous Render invisible data practices visible

Blackhat Europe December 2019 - #BHEU

6

Why tracking, why mental health, why now?

Blackhat Europe December 2019 - #BHEU

9

Am I a joke to you?

Graph by Wolfie Christi of Cracked Labs

25% of the European population experience depression

THE RESEARCH
Time to get serious

Blackhat Europe December 2019 - #BHEU

17

Mental health websites & tracking
 The idea: show how much tracking exists on mental health websites.
 Focus on 3 countries (France, Germany, UK)
 Goal: Understand how much tracking takes place on these sites, what data is being share and for what reasons.

Blackhat Europe December 2019 - #BHEU

18

Sampling method

 Using Google trend with the term "depression" in all 3 languages
­ Finding the most type search related to this term
 Pick top 5 queries and run Google search ­ through a VPN to geolocate us in the country of research
­ Using the geolocated version of Google (e.g. google.fr)
 Note if the link was a promoted or featured
 Add top 5 websites related to mental health for the country to the mix (source: similarweb.com)

Blackhat Europe December 2019 - #BHEU

19

Sampling method

Total: 136 websites

Blackhat Europe December 2019 - #BHEU

(because everybody loves a tiny screenshot of a large spreadsheet)
20

Methodology - scraping

- Open source software - Runs a headless version of Chrome or
Chromium - Scrap websites and stores all HTTP
interaction + cookies dropped + JS loaded - Provide an analysis tool to observe trends - Used to scanned 136 websites

https://webxray.org Developed by Tim
Libert

Blackhat Europe December 2019 - #BHEU

21

Methodology - scraping

Blackhat Europe December 2019 - #BHEU

22

Methodology - scraping

Blackhat Europe December 2019 - #BHEU

23

Lots of queries. Ok. But what about content?

Blackhat Europe December 2019 - #BHEU

24

Selecting a subset of websites
 Depression tests, the ideal target ­ Potential personal data shared ­ Super personal ­ People like taking tests
 Limitation: ­ Top 3 result per country

Blackhat Europe December 2019 - #BHEU

25

Methodology ­ request inspection

- Open source tool - Developed to allow developers to inspect their
request - Operates a MITM type attack so we can
intercept POST requests (needs to add CA to the browser) - Used with Firefox (but now includes Chrome)

https://httptoolkit.tec h/ Developed by Tim Perry

Blackhat Europe December 2019 - #BHEU

26

Methodology ­ request inspection
- Isolate POST requests and inspect the data sent
- Use the HTTP toolkit search to search for relevant keywords in the GET requests (within the URL). Keyworks include:
- Use https://www.urldecoder.org/ to make the URLs more readable
- Analyse the cookies stored in the Firefox browser used by the HTTP Toolkit OR open website in a clean instance of Chrome and inspect cookies through the browser's developer tools

Blackhat Europe December 2019 - #BHEU

27

Blackhat Europe December 2019 - #BHEU

28

WHAT WE FOUND
The non-surprises and the real pain

Blackhat Europe December 2019 - #BHEU

29

Popular websites on mental health share user data with third parties
Some depression tests share answers and results

Trackers, cookies and friends
 97.78% of all web pages we analysed contained a third-party element
 Google, Facebook and Amazon trackers present on huge portion of these pages
 High number of cookies (from 44.49 in average in France to 7.82 for Germany and 12.24 for the UK)

Blackhat Europe December 2019 - #BHEU

31

It's all about the money money money
 76.04% of web pages contained third-party trackers for marketing purposes
 Numerous mental health websites include trackers from known data brokers, and AdTech companies, some of which engage in programmatic advertising
 Unique IDs everywhere

Blackhat Europe December 2019 - #BHEU

32

Depression tests : the fun begins

Passeportsante.net : Third-parties :

depression.org.nz : Third-parties :

Doctissimo.fr : How about not caring at all?

So you said you didn't lose interest in the things you usually enjoyed.
Sorry mate, wrong answer. You did.
Take the test again, you can do better!

The not-so-bad : NHS

Blackhat Europe December 2019 - #BHEU

Adobe was mentioned in their privacy policy (Analytics) They removed it!
38

WHY SHOULD I CARE?
(it's actually not just about you)

Blackhat Europe December 2019 - #BHEU

39

1) People can be targeted when they're most vulnerable
Knowing who is likely depressed, when exactly, for how long, and where exactly they are can be exploited.

The DEEPLY uncanny valley of targeted ads

Some actual ads from my actual Instagram after we did this research

2) An underregulated data ecosystem can be tapped into
It merely takes five clicks on ExactData.com to download data on 1,845,071 Muslims in the United States, according to an investigation by Amnesty International. For 7.5 cents per person (or $138,380 in total) the data broker offers a file containing individual names, addresses and ZIP codes.

3) Undermines trust in technology that could be incredibly useful

4) Misuses disproportionately affect those who are already marginalised

THE FUTURE
(and how to fix it)

Blackhat Europe December 2019 - #BHEU

46

EU: create legal precedents / demand & shape guidance
https://privacyinternational.org/press-release/2859/breaking-following-pi-investigation-exploitation-data-quantcast-under

Rethink third-party tracking

Expose the invisible (and explain the obvious)

Replicate our research!!

Questions?

@Bendineliot
eliotb@privacyinternational.org

@F_Kaltheuner
mail@frederike-kaltheuner.com

