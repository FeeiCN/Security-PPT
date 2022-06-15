SESSION ID: SEM-M01
Privacy in the Age of Pervasive Cameras
When Electronic Privacy Gets Physical

Apu Kapadia
Associate Professor Dept. of Computer Science Indiana University Bloomington

#RSAC

Cameras have proliferated in the last decade

Presenter's Company Logo ­ replace or delete
on master slide

http://www.steves-digicams.com/New-pope.jpg

#RSAC

Redefining "photography" with lifelogging #RSAC cameras

Narrative Clip

Google Glass

Vuzix

http://www.getnarrative.com

Autog ra p he r

http://www.google.com/glass
Gear

Google

Apu Kapadiahttp://www.vuzix.com

http://www.autographer.com
3

http://ioncamera.com

Newer first person cameras for capturing #RSAC moments

http://www.getnarrative.com

http://www.google.com/glass

Google

Apu Kapadiahttp://www.vuzix.com

http://www.autographer.com
4

http://ioncamera.com

Newer first person cameras for capturing #RSAC moments

http://www.getnarrative.com

http://www.google.com/glass

Google

Apu Kapadiahttp://www.vuzix.com

http://www.autographer.com
5

http://ioncamera.com

Presenter's Company Logo ­ replace or delete
on master slide

Why? !!

#RSAC

Presenter's Company Logo ­ replace or delete
on master slide

Why not?

#RSAC

#RSAC
`Tivo'/DVR/Record your life

Apu Kapadia

A DAY IN YOUR LIFE
(PhD Student's lifelog)
8

#RSAC
Document interesting moments...

Apu Kapadia

http://gallery.autographer.com
9

#RSAC
...or important moments

Ryan Johnson, https://commons.wikimedia.org/w/index.php?curid=52373022

Apu Kapadia

http://gallery.autographer.com
10

http://blog.memoto.com

#RSAC
How will such collection affect our privacy?

Contextual Integrity Nissenbaum, 2004

Violating norms of collection

Apu Kapadia
11

#RSAC
Rampant sharing on social media
People upload more than 1.8 billion photos to social media each day
Apu Kapadia
12

#RSAC
Tells a detailed story about the wearer

Apu Kapadia

Impression management Goffman, 1959
What I eat What I watch
What I say Whom I meet
Where I go
13

Our `physical privacy' is no longer sacred

Virtual Theft

#RSAC

`Download the house' using the victim's

camera

Can the attacker reconstruct a 3D model of the victim's space for structured navigation?

Apu Kapadia

Robert Templeman, Zahid Rahman, David Crandall, and Apu Kapadia, "PlaceRaider: Virtual Theft in Physical Spaces with Smartphones," Network & Distributed System Security Symposium (NDSS '13)
15

Navigating the Data

#RSAC

Navigating the data

Presenter's Company Logo ­ replace or delete
on master slide

How can we improve privacy in the age of digital + wearable + social photography?

#RSAC
What makes an image sensitive?
Can we detect regions that violate privacy?
How should we obscure these regions?
Apu Kapadia
18

#RSAC
What makes an image sensitive?
Can we detect regions that violate privacy?
How should we obscure these regions?
Apu Kapadia
19

#RSAC
What makes an image sensitive?
Can we detect regions that violate privacy?
How should we obscure these regions?
Apu Kapadia
20

#RSAC

TWC SBE: Medium: Collaborative: A Socio-Technical Approach to Privacy in a Camera-Rich World With: David Crandall (IU) and Denise Anthony (Dartmouth)
National Science Foundation, $1.2M

CAREER: Sensible Privacy: Pragmatic Privacy Controls in an Era of Sensor-Enabled Computing National Science Foundation, $559K

Privacy-Enhanced Life-Logging with Wearable Cameras With: David Crandall (IU) Google Research Award, $46K

FRSP Type II: Vision for Privacy: Privacy-Aware Crowd Sensing Using Opportunistic Imagery With: David Crandall (IU) Office of the Vice Provost of Research at Indiana University Bloomington, $50K

Presenter's Company Logo ­ replace or delete
on master slide

Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect
the views of the sponsors.

Privacy behaviors and preferences of lifeloggers
Roberto Hoyle, Robert Templeman, Steven Armes, Denise Anthony, David Crandall, and Apu Kapadia, "Privacy Behaviors of Lifeloggers using Wearable Cameras," To appear in The ACM International Joint Conference on Pervasive and Ubiquitous Computing (UbiComp '14)
Roberto Hoyle, Robert Templeman, Denise Anthony, David Crandall, and Apu Kapadia, "Sensitive Lifelogs: A Privacy Analysis of Photos from Wearable Cameras," To appear in The ACM SIGCHI Conference on Human Factors in Computing Systems (CHI '15)

#RSAC
What makes an image sensitive?
Lifelogging User study (N = 36) photos captured every 5 min, 3 days
~15,000 images captured
Apu Kapadia
23

#RSAC
What makes an image sensitive?
Lifelogging User study (N = 36) photos captured every 5 min, 3 days
~15,000 images captured
Apu Kapadia
24

#RSAC
Reasons not to share photos (~8% photos)

Apu Kapadia

Reason
Objects (other than people) in the photo Where this photo was taken People within the photo Participant was in the photo It had private information
It would have been embarrassing to share it It would have violated someone else's privacy
It was a bad photo
25

Responses
30.7% 22.6% 18.4% 11.5% 11.5% 5.4% 3.8% 1.5%

Detecting sensitive spaces with PlaceAvoider
Robert Templeman, Mohammed Korayem, David Crandall, and Apu Kapadia, "PlaceAvoider: Steering First-Person Cameras away from Sensitive Spaces," The 21st Annual Network & Distributed System Security Symposium (NDSS '14)

#RSAC
Using landmarks to detect sensitive spaces

space= _______ space= _______

local image feature classifier
global image feature classifier

HMM

Presenter's Company
Logo ­ replace or delete space= _______ on master slide

space= bathroom space= bathroom space= student lounge

PlaceAvoider is effective, especially for

#RSAC

lifelogging applications

Accura 89%

75%

99%

cy

Apu Kapadia

28

88%

99%

Detecting screens with... ScreenAvoider
SMuobhhamemaedd iKfornayeeemd, Reodbert Templeman, Dennis Chen, David Crandall, and Apu Kapadia,
"Enhancing Lifelogging Privacy by Detecting Screens," In Proceedings of The ACM SIGCHI Conference on Human Factors in Computing Systems (CHI '16)

#RSAC
Screen detection using Deep Learning
Author dataset: 18,769 images collected by us, split into disjoint training and testing sets, manually annotated
CNN gives 99.8% accuracy (92% with lifelogging dataset)
Apu Kapadia
30

92% Accuracy on User Study Dataset (2,742

#RSAC

images)

Presenter's Company Logo ­ replace or delete
on master slide

88% recall 80% precision
95% recall 60% precision

117 False Negatives Video games (50%) Half visible (50%) Out of focus (35%) Photo content (13%) Sensitive apps (7%)
116 False Positives Physical windows (34%) Framed objects (33%)
Other screens (16%)

Will anybody use these (ugly) tNreaendstfoourmndse?rstand
privacy vs. aesthetics
Rakibul Hasan, Eman Hassan, Yifang Li, Kelly Caine, David J. Crandall, Roberto Hoyle, and Apu Kapadia, "Viewer Experience of Obscuring Scene Elements in Photos to Enhance Privacy," In Proceedings of the ACM SIGCHI Conference on Human Factors in Computing Systems (CHI '18)

#RSAC
Does obscuring have to be ugly?
Apu Kapadia
33

Some combinations balance privacy and

#RSAC

aesthetic appeal (N=570)

Apu Kapadia
34

#RSAC
Examples of combinations that work
Apu Kapadia
35

Can we compensate for the ugly

#RSAC

transforms?

Rakibul Hasan, Yifang Li, Eman Hassan, Kelly Caine, David J. Crandall, Roberto Hoyle, and Apu Kapadia,
"Can Privacy Be Satisfying? On Improving Viewer Satisfaction for Privacy-Enhanced Photos Using LoPgreos­enreteprl'ascCeooAmr pdeaesnletythe etic Transforms," ACM SIGCHI Conference on Human Factors in Computing Systems (CHI '19)
on master slide

#RSAC
Ponderables and future directions
Can we leverage people's `sense of propriety' when they capture and share your images?
­ Socio-Technical Strategies for Enhancing Privacy in Photo Sharing. With Bennett Bertenthal. National Science Foundation, $500K
Tangible privacy designs so we know how/when data is being collected?
­ Tangible Privacy: User-Centric Sensor Designs for Assured Privacy. With Adam J. Lee, Rosta Farzan (Pitt). National Science Foundation, $450K
Where do we draw the line with pervasive cameras? GPS units, Toaster, Air Conditioners,... What's next? Why?
Apu Kapadia
37

Toaster Ovens

Presenter's Company Logo ­ replace or delete
on master slide

Air Conditioners

GPS Units

#RSAC

#RSAC
Apply what you have learned today
Immediately (Start with your home!) Conduct an inventory of cameras in your home Policy on smartphones/cameras in bedrooms/bathrooms Be aware that your actions are fair game for social media Within 3 months Organization policy with cameras and microphones Do we really need a camera? Conduct privacy assessment
Apu Kapadia
39

