SESSION ID: LAB3-T11
DevSecOps Workshop with GitHub Actions and Azure!

Tanya Janca
Security Training & Coach SheHacksPurple.dev @SheHacksPurple

#RSAC

#RSAC
What are we going to learn today?

#RSAC
What are we going to learn today?

#RSAC
What is `DevSecOps'?

#RSAC
What are we going to use to learn?

#RSAC
What are we going to use to learn?

#RSAC
What are we going to use to learn?

#RSAC
What are we going to do in this workshop?

#RSAC
Potential Security Verifications INSIDE the Pipeline

SCA ­ Software Composition Analysis SAST ­ Static Application Security Testing DAST ­ Dynamic Application Security Testing Infrastructure Scans Encryption Hygiene (HTTP and TLS) Credential/Secret Scanning Linting

@SheHacksPurple

9

#RSAC
Potential Security Verifications OUTSIDE the Pipeline

Security Alerts from you code repository Negative Unit Testing Using a Secret Store IaST ­ Interactive Security Testing WAF ­ Web Application Firewall RASP ­ Real-Time Application Security Protection Vulnerability Management

@SheHacksPurple

10

#RSAC
Security Verifications we will cover today!
Security Alerts from your Code Repository SCA ­ Software Composition Analysis Secret Scanning Force HTTPS Security Center (time permitting)

@SheHacksPurple

11

#RSAC
Workshop Participation Prerequisites
Azure Account or free trial (credit card required) A github account A laptop connected to the conference wifi Modern Web browser (FireFox / Chrome / Edge) Do not use your work Microsoft Azure Identity, make a new one Patience and a sense of humor. :-D

@SheHacksPurple

12

#RSAC
Pre-Req 1: Create Github Account
https://github.com/join

#RSAC
Pre-Req: Create Github Account
1. Create a username and password, then solve the puzzle to prove you are a human being
2. Select the Free Plan 3. You're all set!

@SheHacksPurple

14

#RSAC
Step 1: Create Github Account

@SheHacksPurple

15

#RSAC
Step 2: Create Github Account

@SheHacksPurple

16

#RSAC
Step 3: Create Github Account: You're All Set!

@SheHacksPurple

17

#RSAC
Pre-Req 2: Create Azure Trial
Pre-Req: Create Azure Trial

#RSAC
Pre-Req: Create Azure Trial
1. Go to https://azure.microsoft.com/en-us/free/ 2. Fill out the Information for you 3. You will need to receive a text and answer a code 4. You will need a credit card 5. Make sure you use the same email for Github, Azure and Azure
DevOps.

@SheHacksPurple

19

#RSAC
The Information is Personal, so no details here.

@SheHacksPurple

20

#RSAC
You can choose whatever you like on this screen

@SheHacksPurple

21

#RSAC
It will look like this in your Azure Portal

@SheHacksPurple

22

#RSAC
Workshop Begins!
Let's create a App Service so we can publish to it! Azure Portal: https://portal.azure.com

#RSAC
Part 1: Create our Infrastructure in Azure!
Let's create an App Service to host our demo app! Azure Portal: https://portal.azure.com

#RSAC
Instructions : Setup App Service
1. Click on the "Home" link in your Azure Portal: https://portal.azure.com
2. Select "Create a New Resource" 3. Type "Web app" and click it to start the wizard, click "Create"
on the next screen.

@SheHacksPurple

25

#RSAC
Step 1 & 2: Click `Home', then "Create a Resource"
@SheHacksPurple

#RSAC
Step 3: Select "Web App"

@SheHacksPurple

27

#RSAC
Instructions Continued: Setup web app
4. The Wizard starts. Select "Free Trial" for the subscription name
5. Click "create new" then enter "MyResourceGroup" for the resource group
6. Enter something unique for the name, remember it
7. Select `West US' for the location
8. Leave the rest as the default values and then press "Create" at the bottom. It will take a few minutes, grab a coffee!

@SheHacksPurple

28

#RSAC

@SheHacksPurple

29

#RSAC
It should look like this when done. Click `Go to resource'.

@SheHacksPurple

30

#RSAC
Instructions Continued: Download Publish Profile
9. Click `Get publish profile', it will download. 10. We're done in Azure for now.

@SheHacksPurple

31

#RSAC
Part 2: Now onto Github Actions!
Let's run our first action! https://github.com/YourUserName/dotnetcore-webapp

#RSAC
Fork my repo into your repo
github.com/shehackspurple/dotnetcore-webapp

HTTPS://GITHUB.COM/<YOURUSERNAME>/DOTNETCORE-WEBAPP/ACTIONS

@SheHacksPurple

33

#RSAC
Let's look at the actions Tab

HTTPS://GITHUB.COM/<YOURUSERNAME>/DOTNETCORE-WEBAPP/ACTIONS

@SheHacksPurple

34

#RSAC
We will select .Net Core

HTTPS://GITHUB.COM/<YOURUSERNAME>/DOTNETCORE-WEBAPP/ACTIONS

@SheHacksPurple

35

#RSAC
It will create this file for us. Press "Start Commit"

@SheHacksPurple

36

#RSAC
It will bring us back here. Click 'Actions' to see it run.

@SheHacksPurple

37

#RSAC
It fails. But that's okay for now.

@SheHacksPurple

38

#RSAC
Make it build .Net by fixing the problem
Our project is .Net version 3.0.100, not version 2. Let's fix it!

@SheHacksPurple

39

#RSAC
It runs! Now let's publish to Azure!

@SheHacksPurple

40

#RSAC
First we need to add a secret to our github project

@SheHacksPurple

41

#RSAC
Create a new GitHub Secret from our API Token

@SheHacksPurple

Paste your publish profile here that you downloaded earlier from Azure.
42

#RSAC
Your new GitHub Secret is there!

@SheHacksPurple

43

#RSAC
Now to edit our action and publish to Azure!
#Tell it where our app is and it's publish profile - uses: azure/appservice-actions/webapp@master with:
app-name: dotnetcorewebapp19 publish-profile: ${{ secrets.publish_profile }} package: "bin/Release/netcoreapp3.0"

@SheHacksPurple

44

Now publish to Azure!

#RSAC

# Publish to Azure! - name: Build with dotnet run: dotnet build --configuration Release - name: dotnet publish run: | dotnet publish -c Release -o dotnetcorewebapp - name: 'Run Azure webapp deploy action using publish profile credentials' uses: azure/webapps-deploy@v1 with: app-name: dotnetcorewebapp19 # Replace with your app name publish-profile: ${{ secrets.publish_profile }} # Define secret variable in repository
settings as per action documentation package: './dotnetcorewebapp'

Commit your change when you're ready to run it.

@SheHacksPurple

45

#RSAC
Let's go back into Azure to see if our web app worked

@SheHacksPurple

46

#RSAC
We just published to Azure!

@SheHacksPurple

47

#RSAC
Part 3: Add Security to our github account!
Security Alerts & dependency tracking, Sec Lesson #1 Github Security Basics

#RSAC
Add Security Alerts in Github

That's not good Let's fix it!

@SheHacksPurple

49

#RSAC
You may need to login again to change security settings.

@SheHacksPurple

50

#RSAC
Click on Settings -> Options, scroll down to Data Services

Step 2

Step 1

Step 3

@SheHacksPurple

51

#RSAC
Click to enable security alerts

@SheHacksPurple

52

#RSAC
We're not done yet. Click on the "Security" tab.
Click Here! Let's fix this too!
Turn it on!

@SheHacksPurple

53

#RSAC
Click to automate security updates.

@SheHacksPurple

54

#RSAC
Turn on Dependency Graph. Click here
instead!
This link leads you to the
wrong screen.

@SheHacksPurple

55

#RSAC
Turn on Dependency Graph.

Click here!

@SheHacksPurple

56

#RSAC
Turn on Dependency Graph.
We win now, right?

@SheHacksPurple

Click here
57

#RSAC
It should see dependencies here (which are insecure)

@SheHacksPurple

58

#RSAC
Cautionary Tale: Don't use other's Actions carelessly
If you use someone else's GitHub action, they can change it Make sure you use commit hash version OR make a copy and then you can update it yourself from then on
https://dev.to/mheap/improve-your-github-actions-security-1im7 https://julienrenaux.fr/2019/12/20/github-actions-security-risk/

@SheHacksPurple

59

#RSAC
The GitHub Marketplace has many security tools
Let's go shopping!

#RSAC
Part 5: Add Security Tool #2: Dependencies
with SNYK

#RSAC
Verifying your 3rd party code, with Snyk

Similar Tools: Owasp Dependency Check Sonatype Nexus Retire.js Hakiri Audit-bundler SRC:CLR Black Duck Veracode SonaType

github.com/marketplace/snyk/actions/

@SheHacksPurple

62

#RSAC
Verifying your 3rd party code, with Snyk
Visit: github.com/marketplace/actions/sast-scan Click the bright green "use latest version" button Create account on Snyk Site: https://app.snyk.io/login Grab your Snyk API key and create a "secret" in github Click the `Start Commit' to trigger a build Watch it go! Then check your report!

@SheHacksPurple

63

Retrieving your API Key from Snyk

#RSAC

@SheHacksPurple

64

Retrieving your API Key from Snyk

#RSAC

@SheHacksPurple

65

#RSAC
Create a new GitHub Secret from our API Token

@SheHacksPurple

66

#RSAC
Create a new GitHub Secret from our API Token

@SheHacksPurple

67

#RSAC
Your new GitHub Secret is there!
@SheHacksPurple

Check it in and watch it work as the actions run!

#RSAC

Very basic report inside Snyk website

@SheHacksPurple

69

#RSAC
It runs.. It works!
And it breaks our build because it
SHOULD!

@SheHacksPurple

70

#RSAC
Part 6: Add Security Tool #3: Scan for Secrets
With TruffleHog!

TruffleHog

Similar Tools

#RSAC

Gitty Leaks

Cred Scan

Many more

github.com/edplato/trufflehog-actions-scan

@SheHacksPurple

72

#RSAC
Secret Scan
Similar Tools Gitty Leaks Cred Scan Many more

github.com/marketplace/actions/secret-scan

@SheHacksPurple

73

#RSAC
GitLeaks
Similar Tools Gitty Leaks Cred Scan Many more

github.com/marketplace/actions/gitleaks-action

@SheHacksPurple

74

#RSAC
Part 7: Add Security Tool #4: Force HTTPS
Forcing HTTPS in Azure is easy-peasy.

#RSAC
Forcing HTTPS
Open Azure Portal Navigate to your App Service Select "configure security" On SSL/TLS settings select "Force HTTPS" You're all set!

@SheHacksPurple

76

#RSAC
Part 8: Add Security Tool #5: Cloud Native Security!
Security Center in Azure has a free tier and you should use it!

#RSAC
Turning on Azure Security Center ­ Free Tier
Navigate to Security Center on the left hand pane Click on "Subscription coverage" on the top right On the next page verify that your subscription is covered under the "free tier" You're all set! (PS At work, in prod, you might want to use the paid tier, but this is just a free workshop so we're not going to today.)

@SheHacksPurple

78

#RSAC
Turning on Azure Security Center ­ Free Tier
There will be a video of how to turn on Azure Security Center on this slide. It's way too large to email it.

@SheHacksPurple

79

#RSAC
Let's run our pipeline and see the results!
Queue up a build and let's watch it go. There's LOTS wrong with this app for us to find!

#RSAC
Kick off the final build
Start our pipeline by checking in our last change. Let's analyze the results together Which bugs would you create tickets for? Which bugs would you `accept the risk' for? What's next?

@SheHacksPurple

81

#RSAC
Workshop Wrap Up
Please delete everything you have build so that you do not incur any unexpected expenses.

#RSAC
Workshop Cleanup
· You can choose to delete everything. · Or you can turn off all your VMs until you want
to use them again. · You are responsible for all expenses you run up
after this workshop. · Let's shut everything down together.
Workshop Cleanup
@SheHacksPurple

#RSAC
You are responsible for all expenses
after this workshop.
@SheHacksPurple

#RSAC
Workshop Wrap Up
Please delete everything you have build so that you do not incur any unexpected expenses.

#RSAC
Apply what you have learned!
DevOps + AppSec = DevSecOps

Security in and outside the Pipeline

Security in Every Part of the SDLC

Continuous (Security) Learning for All

Security must adjust for DevOps!

@SheHacksPurple

86

#RSAC
Apply What You Have Learned Today

Next week you should:
­ Get read access to your code repository and scan it for SCA ­ Talk to DevOps teams about adding SCA to their pipelines in alerting mode
In the first three months following this presentation you should:
­ Inventory all of your apps, put as many as possible through a pipeline ­ Add one security test to each pipeline (preferably SCA and secret scanning)
Within six months you should:
­ Every app going through the pipeline, every pipeline follows security template ­ Add two security tests to each pipeline & gather metrics

@SheHacksPurple

87

#RSAC
Resources: Mentoring Monday!
#MentoringMonday
EVERY MONDAY
@SheHacksPurple

#RSAC
Resources: The Open Web Application Security Project!
#OWASPlove
https://owasp.org
@SheHacksPurple

#RSAC
Resources: Women of Security!
Paris, Ottawa, San Francisco, Singapore, Dallas, Houston, Austin,
Vancouver, Portland, Ottawa, Chicago, Bangalore, Boise, Montréal, Zurich, Nairobi,
Johannesburg, Stockholm , Victoria, Milwaukee, Detroit, Denver, Barcelona, Madrid
Canada, France, USA, India, Switzerland, Kenya, South Africa, Sweden, Spain
@SheHacksPurple @WoSECtweets

#RSAC
Resources: ME!
Follow me?
Twitter: @SheHacksPurple https://SheHacksPurple.dev https://dev.to/SheHacksPurple https://YouTube.com/SheHacksPurple
@SheHacksPurple

THANK YOU!
Tanya Janca ­ SheHacksPurple.dev
https://twitter.com/shehackspurple https://dev.to/shehackspurple
https://medium.com/@shehackspurple https://www.youtube.com/shehackspurple
https://www.twitch.tv/shehackspurple

#RSAC

