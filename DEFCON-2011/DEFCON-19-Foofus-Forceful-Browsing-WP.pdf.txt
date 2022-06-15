Can Homegrown Information Analysis Tools Help Us Make Better Predictions about the Outcome of Supreme Court Cases?
Foofus

Table of Contents
Introduction..........................................................................................................................................1 Gathering Argument Data via the Web.................................................................................................2
Technical Background.....................................................................................................................2 Interacting with the Oyez Web Server.............................................................................................4 Limitations.......................................................................................................................................5 The Justices..........................................................................................................................................7 Anthony Kennedy............................................................................................................................8
Scorecard.....................................................................................................................................8 Discussion...................................................................................................................................8 Antonin Scalia................................................................................................................................10 Scorecard...................................................................................................................................10 Discussion ................................................................................................................................10 Clarence Thomas...........................................................................................................................12 Scorecard...................................................................................................................................12 Discussion.................................................................................................................................12 Elena Kagan...................................................................................................................................13 Scorecard...................................................................................................................................13 Discussion.................................................................................................................................13 John G. Roberts, Jr.........................................................................................................................14 Scorecard...................................................................................................................................14 Discussion.................................................................................................................................14 Ruth Bader Ginsburg.....................................................................................................................15 Scorecard...................................................................................................................................15 Discussion.................................................................................................................................15 Samuel A. Alito, Jr.........................................................................................................................17 Scorecard...................................................................................................................................17 Discussion.................................................................................................................................17 Sonia Sotomayor............................................................................................................................18 Scorecard...................................................................................................................................18 Stephen G. Breyer..........................................................................................................................20 Scorecard...................................................................................................................................20 Discussion.................................................................................................................................20 The Court As a Whole........................................................................................................................21 Case Outcomes..............................................................................................................................21 Decisional Patterns........................................................................................................................22 Concluding Thoughts.........................................................................................................................23

Introduction
In 2005, Professor Jay Wexler of Boston University published an article in which he purported to identify the funniest sitting United States Supreme Court justice by reviewing transcripts of oral arguments and counting the number of times the record reflected laughter.1 On the surface, this short and enjoyable article seems frivolous, but it raises an interesting possibility. Specifically, although the bulk of Supreme Court punditry focuses on specific cases or arguments, it is possible to learn things about the justices by aggregate analysis of oral arguments. Such an approach will never be a substitute for analysis of policy or legal theory: it is issue-neutral. That characteristic, however, is also a strength: the possibility of spotting patterns or trends in the way the justices interact might be useful in cases where an individual justice's opinion is in doubt, or where it is desirable to counterbalance possible preconceptions of the part of the analyst. At the very least, sifting through the complete library of arguments heard by members of the current court can give outsiders a better-rounded view of interactions on the court by placing any given oral argument in a broader context.
This paper presents a first attempt at such analysis, using materials available from the Oyez Project.2 The research consisted of three major phases: development of software tools to facilitate the collection and organization of Supreme Court argument materials, the actual use of those tools to harvest data for every case heard by a currently sitting member of the Supreme Court, and the analysis and presentation of that material. The goal was to study whether it is feasible to draw inferences either about some individual justices or about the court as a whole based simply on numerical analysis of case data. The question of whether any of the justices have mannerisms at oral argument that telegraph their votes is a complex one, and this paper admittedly only scratches the surface of the topic. Nevertheless, even in the context of this research, it is possible to observe, for at least four justices, patterns in their
1 Jay D. Wexler, Laugh Track, 9 GREEN BAG 2d 59. 2 See, http://www.oyez.org (last visited May 12, 2011).
-1-

interactions with the advocates that correlate with their eventual votes.
Gathering Argument Data via the Web
Before addressing the specifics of the Oyez web site, a brief explanation of the underlying technology involved is warranted to ensure that the reader is acquainted with the necessary terms, and can better understand the process involved.
Technical Background
The World Wide Web is a collection of Internet-connected systems sharing data3 via the Hypertext Transfer Protocol (HTTP). Most users experience the Internet by using a web browser.4 In this context, a web browser is a piece of software that sends HTTP requests for web resources (documents, images, video, etc.) to various web servers which respond to these requests by furnishing the requested materials, again via HTTP. For the purposes of this discussion, the inner details of HTTP are unimportant, it is enough to understand that HTTP is a simple request-response protocol: a client (usually a web browser) issues a request, the server responds, and the transaction is complete. The figure below is a transcript of a simple HTTP conversation: a client requests a document,5 and the server returns it. The text in bold is issued by the client, and the remainder is the server's response.
3 In re Doubleclick Privacy Litig., 154 F. Supp. 2d 497, 501 (S.D.N.Y. 2001) 4 Currently popular web browsers include Internet Explorer, Firefox, Chrome, Safari, and Opera, but there have
been others, such as Netscape Navigator and Mosaic. 5 See http://www.foofus.net/foofus/test.html (last visited April 30, 2011); the reader is invited to visit this URL in
order to see the page rendered in an actual web browser.
-2-

Simple HTTP Transaction with the www.foofus.net Web Server GET /foofus/test.html HTTP/1.0
HTTP/1.1 200 OK Date: Sun, 25 Apr 2010 15:38:50 GMT Server: Apache/2.2.3 (Unix) PHP/5.2.0 mod_ssl/2.2.3 OpenSSL/0.9.8l Last-Modified: Sun, 25 Apr 2010 15:38:03 GMT ETag: "2eb83e-57-7227ecc0" Accept-Ranges: bytes Content-Length: 87 Connection: close Content-Type: text/html
<HTML> <HEAD><TITLE>Test Page</TITLE></HEAD> <BODY>This is a test page</BODY> </HTML>
The web server's response begins with a set of "headers:" information about the
response itself. The headers let the browser know that the client's request will be honored (the
"200 OK" response code), the type of web server software in use (Apache),6 the date end time of
the transaction, and some facts about the response itself: the length of the response (87 bytes),
and what the response consists of (an HTML document), which begins after the blank line.
HTML stands for HyperText Markup Language,7 a standard for describing both the form and
the content of a web page. In the example above, the underlined and italicized portions of the
document are HTML "tags" used to describe the layout of the web page (in this case, which
portions constitute the title, to be shown in the web browser's title bar, and which portions
constitute the body of the document, to be displayed in the browser's main window).8 The same
fundamental transaction is played out behind the scenes of every web surfing session: the web
browser requests some material from a web server, the web server returns a block of data that
describes both the information to be presented to the user and the format in which the
6 See http://www.apache.org/ (last visited April 30, 2011). 7 See http://www.w3.org/wiki/HTML (last visited April 30, 2011) 8 HTML tags can also describe links, images, forms, and a variety of other document types that might be
embedded in web pages.
-3-

information should be presented, and the web browser renders the content for the user in the manner directed.
Interacting with the Oyez Web Server
The oyez.org web site provides a facility for the public to review the activities of the United States Supreme Court. Specifically, it allows users to browse the docket for any given term, view a summary of each case, and even listen to the oral arguments (and in some cases also opinion announcements9). As an added feature, the site provides an "expanded view" of the oral argument, which displays the transcript of the oral arguments synchronized with the original audio. Oral argument transcripts are stored as XML files.10 XML is a specification similar to HTML, except its intent is to make content more easily accessible to programs, rather than human readers.11
In order to gather the necessary underlying data for this research, two programs were developed in the perl programming language.12 Each of these programs basically automates a set of actions that could be taken by a human being with a web browser, and records the results. The first program systematically downloads the court's complete docket for a given year. Its output is a file containing a list of cases; for each case it records the caption, docket number, argument date, decision date, majority decision author, and the vote split. Using this program, it was possible to make a master docket list of all cases heard by since Justice Scalia was elevated to the court in 1986 up to April 30, 2011.13
The second program is more complex: it takes the master docket file and a list of
9 See, e.g., The Oyez Project, Tison v. Arizona, 481 U.S. 137 (1987) available at: (http://oyez.org/cases/1980-1989/1986/1986_84_6075) (last visited Saturday, May 7, 2011).
10 See http://www.w3.org/XML/ (last visited on May 12, 2011). 11 The files are intended to be parsed by the oral argument display applet that allows those listening to an
argument to follow along with the text, but the they are just as easily parsed by other software, such as that created in the course of this study. 12 See http://www.perl.org/ (last visited on April 30, 2011). 13 This cutoff date is arbitrary, but it was important at some point to stop merely collecting data and to begin analyzing it.
-4-

the current justices as inputs and constructs a series of web requests. There are three main outputs:
1. For each case, the program creates a file whose contents reflect whether the petitioner or the respondent prevailed, how each justice voted, the citation, and who the advocates for each party were.
2. For each justice, the program creates several files: a list of cases in which the justice participated, a list of cases the in which the justice did not participate, a list of cases in which the justice voted with the majority, a list of cases in which the justice voted with the minority, and lists of cases in which the justice wrote a concurrence, dissent, or joined another justice's concurrence or dissent.
3. The transcript file for the case's oral argument.
The net result is a complete collection of each justice's voting record, along with results and oral argument transcripts for every case heard by any combination of the current members of the United States Supreme Court.
Some efforts were required to account for inconsistencies in the data: Oyez is not completely faithful to its naming conventions (e.g., in the oral argument transcript files, Justice Roberts is sometimes referred to as "John_G_Roberts" and sometimes as "john_g_roberts_jr;" Justice Sotomayor is alternately "justice_sotomayor" or "sonia_sotomayor," and so forth). Likewise, some justices (e.g., John Roberts and Elena Kagan) appeared in transcripts as advocates before they were elevated to the court.
Limitations
There are a number of important limitations affecting data gathered in this way. The first and most obvious has already been mentioned: this analysis places no weight
-5-

whatsoever on the merits of the case at bar, the issues at stake, or the briefs submitted. It makes no sense to think that cases are decided without attention to these factors, and as a result, the findings presented here represent a form of insight into Supreme Court decision-making that is untethered to the issues surrounding any particular case.
Second, for the purposes of this research, we are accepting Oyez's analysis of which party prevailed in the case. For example, a case might present several questions, some of which the court might answer in favor of the petitioner, and some in favor of the respondent, making it at least somewhat unclear which party has "won." A more nuanced analysis might take the nature of the issues into account, but that is too complex an undertaking for this effort.
The data from Oyez are also not 100% uniform, and this presents a technical problem. When parsing the oral argument files, the only way to decide whether a justice's question is asked of the petitioner or the respondent is by the name of the advocate to whom the question is addressed. The Oyez pages summarizing a case name the advocates, but in some cases fail to specify which side they represented. Likewise, readers with an actuarial bent will notice that for some justices, particularly those who have been on the court the longest, the total number of cases heard by the court during a Justice's tenure is slightly higher than the sum of the number of cases in which the Justice voted for the majority, the number of cases in which the justice voted for the minority, and the number of cases in which the justice did not participate. Again, this represents some minor inconsistency in the way that Oyez has recorded the justices' votes, and the relatively few missing votes could be found through further research, but because the margin of error is less than 1%, the degree of extra precision to be had by tracking down the missing votes is not worth the rather substantial effort required to review hundreds of case records for single voting anomalies.
The only data-related flaw of substance is that Oyez seems not to have reported -6-

the justices' votes for 78 cases in the 2008 term, as well as 23 other cases between 2006 and 2010.14 This was only discovered late in the analysis, when producing graphs to detect trends in the justices' voting patterns, and time did not permit tabulation of the votes in these cases. Once again, this information is available, albeit not from Oyez, should some intrepid future researcher find value in filling in the lacunae that remain in this initial paper.
Finally, it is important to note that the findings for the individual justices have differing weights. For a justice who speaks only rarely at oral argument, or a justice who is new to the court, even a seemingly stark pattern may not justify a strong conclusion, simply because there is not enough data to go on.
The Justices
This section provides an overview of the findings for each justice. The first item is a scorecard with a brief numerical synopsis of the justice's record on the court. The second section presents analysis of the oral argument data for cases in which the justice participated.
The oral argument transcripts identify the speaker of each utterance. For the purposes of this analysis, no attempt was made to differentiate between utterances based on their nature (e.g., questions, comments, jokes, etc.): it is simply assumed that every time a justice speaks, it is to ask a question. Questions come in only three classes, therefore, based on the identity of the last party to speak: the petitioner, the respondent, or a current fellow justice (questions asked to justices no longer on the court were excluded15).
Cases for which either the justices' voting records or the advocates' roles (i.e., whether they appeared for the petitioner or the respondent) were not available were excluded
14 Compare, e.g., The Oyez Project, Altria Group v. Good , 555 U.S. ___ (2008) available at: (http://oyez.org/cases/2000-2009/2008/2008_07_562) (last visited Saturday, May 7, 2011) with The Oyez Project, Oregon v. Ice , 555 U.S. ___ (2009) available at: (http://oyez.org/cases/2000-2009/2008/2008_07_901) (last visited Saturday, May 7, 2011).
15 In retrospect, this may have been a mistake, because it tends to understate the value of justice-to-justice questions for justices with greater seniority on the court. The intent behind the decision was to avoid potential overstatement of the value resulting from arguments or dialogs with justices no longer present.
-7-

from the analysis, because it would be impossible to link the justices' votes with whatever they did at oral argument.
Anthony Kennedy
Scorecard
Cases During Tenure: 2057 Voted with the Majority: 1802 Voted with the Minority: 188
Did Not Participate: 65 Majority Opinions Authored: 214
Concurrences Authored: 192 Dissents Authored: 185
Joined Another Justice's Opinion: 169
Discussion The perception of Justice Kennedy as a swing vote seems supported by the fact
that he has voted with the majority in over 87% of the 2,057 cases heard by the Supreme Court since his appointment: as Justice Kennedy rules, so does the court. In a 5-4 decision, of course, each of the five votes in the majority is equally decisive­ the changing of any would tip the outcome in the other direction. Justice Roberts, for example, has been with the majority in roughly the same percentage of the cases he has heard. The phrase "swing vote," in the context of the Supreme Court, must therefore mean something more than "strongly correlated with the outcome of cases," and must connote a vote that is less easy to predict on policy or ideological grounds.
Of the 2,057 cases heard during Justice Kennedy's time on the court, 734 were included in the oral argument study (i.e., there was complete information about the justices' rulings in these cases, there was complete information about who represented each party, and Justice Kennedy said at least one thing in the course of the oral arguments). Over the course of those cases, Justice Kennedy spoke 8,753 times: 4,378 times to the petitioner, 3,837 times to the
-8-

respondent, and 438 times to another sitting member of the court. Along with Justice Ginsburg, he is a very even-handed questioner, with only a very slight bias in favor of speaking to the petitioner. He is also the court's most even-handed writer of special opinions, balancing between 51% concurrences, and 49% dissents. Most justices lean in favor of writing dissents.
This even-handedness carries through to the distribution of his questions at oral argument: even when the cases are grouped by the party for whom Justice Kennedy voted, no significant pattern emerges.
Questioning Patterns by Vote
Justice Kennedy has a slight tendency to ask more questions of the petitioner in cases where he votes for the respondent.16 This is not as reliable a metric with Justice Kennedy as it is with some other justices. For example, in Maryland v. Pringle, 540 U.S. 366 (2003), Justice Kennedy asked 20 questions of the petitioner and only one of the respondent, and voted for the petitioner. Likewise in NASA v. FLRA, 527 U.S. 229 (1999), Justice Kennedy voted for the respondent, having asked the respondent 19 questions and the petitioner only two.
At least at this level of analysis, Justice Kennedy remains one of the most inscrutable members of the court: his questioning behavior at oral argument does not telegraph what his vote will be.
16 This will be a recurring trend: many justices tend to ask fewer questions of the party for whom they eventually vote.
-9-

Antonin Scalia
Scorecard
Cases During Tenure: 2230 Voted with the Majority: 1834 Voted with the Minority: 383
Did Not Participate: 13 Majority Opinions Authored: 229
Concurrences Authored: 341 Dissents Authored: 382
Joined Another Justice's Opinion: 278
Discussion As the senior member of the court, Justice Scalia has the left the most abundant
statistical trail. He stably in the majority (82.3%), and is a vigorous author of both dissents and concurrences. Like Justices Thomas, Ginsburg, Alito and Breyer, he has written more of each than he has majority opinions, and he is only barely in second place behind Justice Thomas among his fellow justices in terms of overall likelihood of submitting a written opinion in any given case (Justice Scalia has written in 671 of the 2213 cases in which he has participated, for a rate of 42.9%).
Justice Scalia is also an enthusiastic participant in oral argument: in the 754 arguments considered for this analysis, he spoke 17,954 times, for an average of nearly 24 questions per argument. He shows a slightly stronger than average tendency to side with the petitioner (457 cases, or 60.6%). In cases where he votes for the petitioner, his questioning pattern at oral argument practically a precise mirror of his questioning in cases where he votes for the respondent.
-10-

Questioning Patterns by Vote
Most of the justices are at least somewhat "antagonistic" in their questioning, in the sense that they tend to ask more questions of the party for whom they will not be voting. In a nutshell, the party who receives fewer questions from Justice Scalia at oral argument can have some degree of confidence in Justice Scalia's support at voting time. With Justice Scalia, this is a more reliable indicator than it is for most other justices: in the 40 cases in which he asked more than 25 questions of the petitioner, he voted for the respondent only 10 times. Correspondingly, in the 40 cases in which Justice Scalia asked more than 27 questions of the respondent, he voted for the petitioner only 7 times.
In the 67 cases where the questions were evenly distributed (i.e., less than a 2-question difference between questions asked of the petitioner and questions asked of the respondent), he voted for the petitioner 60 times (roughly 89.5%). As a result, it would seem that Justice Scalia's vote can be inferred with some degree of confidence from the distribution of his questions at oral argument. Of course, Justice Scalia's vote may generally also be predicted based on the content of his questions at oral argument, but in cases where his vote is in doubt, the distribution of questions might be a worthwhile metric for those seeking to handicap the court.
-11-

Clarence Thomas
Scorecard
Cases During Tenure: 1546 Voted with the Majority: 1230 Voted with the Minority: 298
Did Not Participate: 21 Majority Opinions Authored: 153
Concurrences Authored: 222 Dissents Authored: 296
Joined Another Justice's Opinion: 283
Discussion Not much can be said about Justice Thomas's speech patterns at oral argument.
He has spoken in only 12 cases eligible for in this study, uttering a total of 37 questions. Although the balance is quite lopsided (30 of the 37 questions were asked of the respondent), even such a striking pattern should not be taken as a serious statistical indicator in a sample this small. In cases where Justice Thomas spoke, he voted for the petitioner 8 times (75%), but again, that apparent bias may not be indicative of anything in particular.
Justice Thomas's silence at oral argument is countered, however, by his outspokenness in the written word: he has written an opinion of some sort (whether majority, concurrence, or dissent) in 671 of the 1,525 in which he has participated (44%), making him the court's leader in terms of likelihood of submitting a written opinion in any given case.
-12-

Elena Kagan
Scorecard
Cases During Tenure: 34 Voted with the Majority: 10 Voted with the Minority: 4
Did Not Participate: 20 Majority Opinions Authored: 3
Concurrences Authored: 0 Dissents Authored: 2
Joined Another Justice's Opinion: 5
Discussion Thus far, Justice Kagan's record with the court is remarkable mostly for the
number of cases in which she has not participated: she has recused herself in 58% of the cases heard between the time she ascended to the bench and the time when the data for this study were collected. Of the 14 cases she has heard, only 13 were eligible for inclusion in the oral argument study. As the court's newest member, there is not yet much data to go on, but her behavior thus far is different from that of her fellow justices.
In the first place, she has voted for the respondent in eight of the 13 cases studied: most justices, and the court as a whole, show at least a moderate statistical preference for the petitioner. Second, Justice Kagan tends to ask more questions of the petitioner regardless of what her vote turns out to be: in only three cases has she asked more questions of the respondent. While it is obviously too early to claim that these trends are in any way significant, it is interesting to note that Justice Kagan is bucking the court's trends, at least at the outset of her tenure.
As a final footnote, the fact that Justice Kagan has such a high rate of non-participation in cases has had an interesting side-effect: even though there are only 10 cases in which she has voted with the majority, she has written three majority opinions. This is well over twice the rate experienced by her more senior colleagues, and it shows an amusing
-13-

(if predictable) dynamic in assignments: the fewer cases in which one participates, the more likely one will have to write the court's opinion in those cases where one sides with the majority.
John G. Roberts, Jr.
Scorecard
Cases During Tenure: 325 Voted with the Majority: 285 Voted with the Minority: 27
Did Not Participate: 7 Majority Opinions Authored: 38
Concurrences Authored: 17 Dissents Authored: 25
Joined Another Justice's Opinion: 33
Discussion Justice Roberts spoke at oral argument in 265 cases suitable for inclusion in this
study. In the cases examined, Justice Roberts voted for the petitioner 173 times (65%), and for the respondent 93 times (35%). He has asked a total of 2,475 questions of petitioners (an average of 9.34), 2,777 questions of respondents (an average of 10.48), and 166 questions of his fellow justices. These are not distributed evenly, however.
Questioning Patterns by Vote
In other words, in cases where Justice Roberts votes for the respondent, he asks an average of 11.1 questions of the petitioner (and 9.66 of the respondent), and in cases where he votes for
-14-

the petitioner, he asks an average of 10.9 questions of the respondent (and of the 8.4 of the petitioner). These numbers support the theory that, statistically speaking, Justice Roberts has a mildly antagonistic questioning style: he tends to ask more questions of the party against whom he will vote. This is a weaker correlation than we have observed with other justices, however.
Additionally, Justice Roberts sides with the majority in just over 90% of his votes. Surprisingly, this is slightly higher than Justice Kennedy's percentage. The number of questions Justice Roberts asks of each party is therefore at least weakly correlated with the outcome of the case. Obviously, this does not establish any sort of causative relationship: one could not hope to win a case merely by confining one's oral argument to topics unlikely to draw questions from Justice Roberts. Nevertheless, litigants seeking to divine the outcome of their cases after oral argument may wish to count the questions Justice Roberts asks of each side.
Ruth Bader Ginsburg
Scorecard
Cases During Tenure: 1326 Voted with the Majority: 1055 Voted with the Minority: 270
Did Not Participate: 1 Majority Opinions Authored: 140
Concurrences Authored: 143 Dissents Authored: 257
Joined Another Justice's Opinion: 275
Discussion Justice Ginsburg has been on the court for a total of 1,341 cases (as of this data
collection), in that entire time, there has only been one case in which she did not participate,17 and she has spoken at least once in every single argument in which she has participated. Over
17 Federal Election Commission v. NRA Political Victory Fund, 513 U.S. 88 (1994)
-15-

the cases included in this analysis, she voted for the petitioner 431 times (57.8%), and for the respondent 315 times (42.2%). This pattern places her more or less precisely in harmony with the court's overall tendency to side slightly with the petitioner (see the "Case Outcomes" discussion in the "Court as a Whole" section, below).
Justice Ginsburg has asked a total of 10,501 questions, of which 5,382 (51.2%) were for the petitioner, 4,818 (45.8%) were for the respondent, and 301 (2.9%) were for a colleague on the court. On the whole, she is an even-handed questioner, but when she votes for the respondent, she has a tendency to pepper the petitioner with questions.
Questioning Patterns by Vote
This is not a wholly trustworthy indicator, however: there are 76 cases in which she asked no questions whatsoever of the respondent, but in those cases she still cast her vote for the petitioner 40 times (including seven cases in which she asked more than 10 questions of the petitioner). Still, if we calculate the ration of petitioner questions to respondent questions for each case, when the ratio is greater than 5-1, she has voted for the petitioner only 23.7% of the time.
As a general rule, it seems impossible to infer much about Justice Ginsburg's vote on the basis of her speaking at oral argument. However, as the ratio of the number of questions Justice Ginsburg asks of the petitioner at oral argument to the number of questions she asks of
-16-

the respondent increases, the probability of her voting for the petitioner decreases, settling just below 25% for extreme values.
Samuel A. Alito, Jr.
Scorecard
Cases During Tenure: 304 Voted with the Majority: 238 Voted with the Minority: 37
Did Not Participate: 21 Majority Opinions Authored: 29
Concurrences Authored: 31 Dissents Authored: 33
Joined Another Justice's Opinion: 33
Discussion Of the 207 oral arguments eligible for inclusion in this study, Justice Alito voted
with the petitioner 114 times (55%), and in his time on the court overall, he has voted with the majority 78% of the time, making him a centrist, in terms of the court's overall tendency to side slightly in favor of the petitioner. He spoke at oral argument 1,295 times (an average of six questions per case).
Like Justice Scalia, the pattern of Justice Alito's allocation of questions between the petitioner and respondent is an almost perfect mirror image, depending on which party he eventually votes for, with the party that receives his vote being asked fewer questions.
Questioning Patterns by Vote
-17-

Thus, in cases where Justice Alito voted for the petitioner, the 39.5% of his questions went to the petitioner, 58.5% to the respondent, and the remaining 2% to his fellow justices. In cases where the respondent got Justice Alito's vote, 59.5% of his questions went to the petitioner, 37.4% to the respondent, and the remaining 3.1% to his fellow justices. This is a less reliable indicator for Justice Alito than it is for Justice Scalia, at least when votes for the respondent are concerned. In cases where Justice Alito asked more questions of the petitioner, he still voted for the petitioner 43.7% of the time; in cases where Justice Alito asked more questions of the respondent, on the other hand, he only voted for the respondent 35.1% of the time.
Sonia Sotomayor
Scorecard
Cases During Tenure: 103 Voted with the Majority: 78 Voted with the Minority: 18
Did Not Participate: 3 Majority Opinions Authored: 12
Concurrences Authored: 8 Dissents Authored: 13
Joined Another Justice's Opinion: 24
Only 85 cases from Justice Sotomayor's tenure on the court were eligible for inclusion in this study. In those cases, she voted for the petitioner 52 times (61.2%), and for the respondent 33 times (38.8%). As was the case with Justice Ginsburg, Justice Sotomayor tends to ask more questions of the petitioner in cases where she votes for the respondent.
-18-

Questioning Patterns by Vote
In contrast to Justice Ginsburg, however, there is no clear trend. Justice Sotomayor is liable to vote either way, regardless of the ratio of petitioner questions to respondent questions. In the five cases where she asked the petitioner 15 or more questions and the respondent zero, she voted for the petitioner three times. In the 21 cases where she asked the petitioner more than 10 questions, she voted with the petitioner nine times (or 42.8%). Possibly some more useful pattern will emerge over time, but at the moment, the best we can say is that in cases where she asks more than 20 questions of the petitioner, it is likely that Justice Sotomayor will vote for the respondent. The converse is not necessarily true: in Wood v. Allen, 558 U.S. ___(2010), Justice Sotomayor asked no questions of the petitioner, but spoke 22 times during the respondent's argument and still voted for the respondent.
-19-

Stephen G. Breyer
Scorecard
Cases During Tenure: 1237 Voted with the Majority: 972 Voted with the Minority: 247
Did Not Participate: 16 Majority Opinions Authored: 124
Concurrences Authored: 150 Dissents Authored: 235
Joined Another Justice's Opinion: 230
Discussion This analysis covered 716 of the 1237 cases heard by the Supreme Court during
Justice Breyer's tenure. In those cases, he has spoken a total of 12,892 times, for an average of 18 questions per case. Justice Breyer has voted with the majority in 78.6% of the cases in which he has participated.
At oral argument, Justice Breyer's distribution of questions is unique: 57.7% of his questions are directed at the respondent, and a mere 39.0% at the petitioner, despite the fact that he has voted for the petitioner in 64.9% of the cases available to this study. Nevertheless, his questioning is far less respondent-centric in cases where he votes for the respondent.
Questioning Patterns by Vote
Justice Breyer's tendency to devote such a high percentage of his questions to the respondent,
-20-

regardless of his eventual vote, is unique among the pool of justices for whom there was enough data to study. In cases where he has voted for the respondent, just under half of his questions have been directed at the petitioner (49.7%). In the 435 cases where Justice Breyer has asked more questions of the respondent, he has voted for the petitioner 76.3% of the time, whereas in the 246 cases in which he asked more questions of the petitioner, he voted for the respondent 52.8% of the time. Thus, from a purely statistical perspective, although it is more likely that Justice Breyer will vote for the petitioner in any given case, that probability increases, the more questions he asks of the respondent.
The Court As a Whole
Knowledge of the patterns of the justices individually is more helpful when it is couched in the context of the behavior of the court as a whole. Being "in the majority" differs from case to case, for example, depending on whether, and how, the court's votes are split. Likewise, knowing the tendency of a given justice to vote in favor of the petitioner is more helpful when compared to the court's tendency as a collective.
Case Outcomes
As has been mentioned, the court shows a slight bias in favor of petitioners: petitioners prevailed in roughly 57% of the cases analyzed, as depicted in the figure below.
Cases Resolved in Favor of Petitioner vs. Cases Resolved in Favor of Respondent
This is most likely explained by the fact that litigants would not appeal to the Supreme Court if -21-

they would reasonably expect to lose. Correspondingly, potential litigants might elect not to bring suit at all (or to settle, if they find themselves sued), rather than run the risk that the court might issue a rule that hamstrings their cause for all time.
Decisional Patterns
Over the course of the 2,371 cases studied here, the court has come out with 18 different decisional patterns, ranging from 9-0 to 3-3.18 Of these, only eight patterns amounted to more than 2% of the total caseload.
Distribution of Decisional Splits
The distribution of decisional splits remains relatively consistent on a year-by-year basis; there are some fluctuations in the relative frequencies of 5-4 and 7-2 splits, but the pattern is maintained roughly over time
Relative Frequencies of Decisional Splits by Year
18 Reagan v. Abourezk, 484 U.S. 1 (1987).
-22-

The column for 2008 should be disregarded because, as mentioned above, Oyez did only a spotty job at recording case outcomes for that year: the information available appears to be correct, but it is incomplete. Other than that column, the only serious anomalies are the sudden surges of 8-1 decisions in 1987 and 2010. The 2010 group is explained by Justice Kagan's high frequency of recusal, and the fact that not all of the court's 2010 decisions have yet been published. In 1987, Justice Kennedy was new to the court, and did not participate in a similar series of decisions. There do not, in other words, appear to be many significant trends either in the harmony or the divisiveness of the court, and unanimous decisions are fairly consistently at least 30% of the court's output.
Concluding Thoughts
The analysis presented here is interesting, but somewhat superficial­ it would be technically feasible to dig much deeper. Potentially fruitful topics for further investigation include:
· Are runs of multiple consecutive questions correlated with specific outcomes for any of the justices?
· Is there a correlation between any of the justices' votes and specific decisional split patterns (are there, for example, signs in the oral
-23-

argument questioning patterns that point to whether or not a case will be decided unanimously)?
· Except for Justice Thomas, does a justice's silence at oral argument signal anything about his or her probable vote?
· Do certain justices tend to engage in dialog with one another, and if so, does that correlate with any particular pattern in their voting?
The answers to all these questions lie within the data already collected,19 but answering them would be complex. As it stands, even having done only relatively simple investigation, we are able to spot several justices whose behavior at oral argument may reveal something about how they are likely to vote. Specifically, Justices Breyer, Alito, Ginsburg, and Scalia all exhibit questioning patterns that correlate with their votes; Justice Roberts does as well, but to a weaker extent. Possibly the same will be true of Justice Sotomayor, as she develops a deeper history with the court. There has not been enough chance to observe Justice Kagan in action to say whether she will be at all predictable via this method. The only two justices who appear not to leak information about their leanings at oral argument are Justice Thomas, who remains silent, and Justice Kennedy, whose questioning pattern is largely inscrutable.
Of course, in many instances, it may be obvious how a given justice may vote, based on the justice's record, or the nature of the questions asked at oral argument. This research has never set out to supplant standard legal analysis techniques. Reasonable minds differ on how the court will find in any given case, and the goal of this research is to see if by relying on tools outside of the usual lawyer's arsenal, we can provide additional support for a proposed outcome.
These techniques are presumably of limited utility to advocates: in the heat of
19 Others, such as the question of whether any of the justices behave differently at oral argument in civil cases than they do in criminal cases, or whether certain justices tend to treat cases from specific circuits differently would require the collection of additional data.
-24-

oral argument, it's unlikely that there is anything to be gained by counting questions. They may be of some help to corporate litigants, however, who could take steps to insulate themselves from the effects of a forthcoming decision in the time after oral argument, if they had better insight into what that ruling might be. Most likely, these tools will be of interest to primarily to court-watchers and handicappers.
In making a more nuanced estimation of the court's vote in a given case, the first step is to count any "sure" votes, using traditional policy-based reasoning. Next, one would tally up the questions asked at oral argument, and check to see if patterns exhibited by the justices already counted undermined the certainty of their vote. If so, discount the certainty of their vote by some percentage. Finally, if any of the remaining justices are among those known to hint at their votes by their behavior at oral argument, use the question tally to predict the probability of their votes, remembering to factor in their degree of petitioner-bias. At this point, enough justices should have probabilities assigned to them that it is possible to estimate the odds of the ultimate outcome.
The dominant strategy for predicting Supreme Court outcomes relies, understandably, on traditional expertise about the court and the cases in question. Other strategies exist. The "Fantasy SCOTUS" league,20 for example, endeavors to harness the collective thoughts of its various players. Prediction based on historical data is another valid source of input, and if our goal, in the end, is to make more accurate predictions about future cases, we should be open to incorporating whatever tools can help us accomplish this. This paper demonstrates the feasibility of providing support for inferences about case outcomes from oral argument data using homegrown information collection and analysis tools.21
20 http://www.fantasyscotus.net (last visited May 12, 2011) 21 Copies of these tools are available upon request; unfortunately, including the code as an appendix would have
more than doubled the length of the paper.
-25-

