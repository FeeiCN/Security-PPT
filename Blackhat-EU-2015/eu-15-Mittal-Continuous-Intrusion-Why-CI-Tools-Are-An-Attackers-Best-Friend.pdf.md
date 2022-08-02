1

2

3

4

More about Continuous Integration: http://www.martinfowler.com/articles/continuousIntegration.html
5

6

7

* Hudson was not evaluated separately. Most of the things which apply on Jenkins should apply on Hudson as well.
8

9

10

11

http://www.labofapenetrationtester.com/2014/08/script-execution-and-privilegeesc-jenkins.html
12

The rights of the user to add or change build configuration are managed using Matrix based security or Project-based Matrix Authorization Strategy. https://wiki.jenkins-ci.org/display/JENKINS/Matrix-based+security When running commands on a Windows machine we can leverage PowerShell to execute advanced scripts using this method.
13

You need to remove config.xml from $JENKINS_HOME (read the build log for finding out $JENKINS_HOME) to remove all security or replace [useSecurity]true[/useSecurity] with [useSecurity]false[/useSecurity] The Jenkins service must be restarted after that. During the tests, I was unable to successfully restart the Jenkins service from a build step even on Windows (with SYSTEM privileges). The workaround is to have an interactive reverse shell on the host machine and restart Jenkins service. Jenkins documentation on Disabling Security https://wiki.jenkins-ci.org/display/JENKINS/Disable+security
14

https://imgflip.com/memegenerator/Surprised-Koala 15

Taken from http://thiébaud.fr/jenkins_credentials.html 16

We need credentials.xml from $JENKINS_HOME and master.key and hudson.util.secret from $JENKINS_HOME/secrets/ We are reading the keys master.key and hudson.util.secret in bytes and will convert them back to file on our own machine. On a Windows machine the conversion could be done by using TextToExe.ps1 from Nishang. https://github.com/samratashok/nishang/blob/master/Utility/TexttoExe.ps1
17

18

19

20

21

https://confluence.jetbrains.com/display/TCD9/Getting+Started 22

https://confluence.jetbrains.com/pages/viewpage.action?pageId=54334889#HowTo.. .-TeamCitySecurityNotes
23

24

https://confluence.jetbrains.com/display/TCD9/Role+and+Permission Teamcity documentation recommends not to have build agent on master but looks like only few care about that.
25

A Build Step could be added with the Project Administrator or even lower privileges (if configured that way). PowerShell commands and scripts could be executed using the PowerShell runner. https://confluence.jetbrains.com/display/TCD9/PowerShell On *nix machines, shell commands and scripts could be executed.
26

https://confluence.jetbrains.com/display/TCD9/Super+User Fun Fact: You can lock out SuperUser for one minute by clicking Log in button five times without entering a Username and Password. This makes it easy to block it by repeating login requests indefinitely.
27

28

29

https://confluence.jetbrains.com/display/TCD9/SSH+Keys+Management Here is how it could be done: 1. To know the data directory of the master, look for "Data Directory" in the
teamcity-server.log. Use a PowerShell runner. 2. Use "cat <TeamCity Data Directory>/config/<project>/pluginData/ssh_keys/ *" to
list contents of all the keys.
30

31

Teamcity supports using the Password type Parameter for passwords but I have seen so many users using Text Parameter for passwords. See: https://confluence.jetbrains.com/display/TCD9/Typed+Parameters
32

33

Couple of examples of credentials in Build Logs. In both the above screenshots, access to public instances and the Build Logs is with Guest privileges.
34

35

http://www.go.cd/ http://www.thoughtworks.com/products/go-continuous-delivery
36

http://support.thoughtworks.com/entries/22299328-Go-Security-Questions 37

38

http://support.thoughtworks.com/entries/22873043-go-s-custom-command http://www.go.cd/documentation/user/current/advanced_usage/command_reposito ry.html
39

We need Pipeline Group Administrator rights to be able to configure Jobs which can run custom commands.
40

41

In above, the command cmd /c powershell -c del 'C:\Program Files (x86)\Go Server\config\cruise-config.xml' will remove the configuration file of Go. The command cmd /c powershell ­c Restart-Service 'Go Server` will restart the Go Server service. After this, all security will be removed from the Go dashboard and anyone who knows the URL will have admin rights. Instead of removing the cruise-config.xml file, we can also remove only the <security></security> part of it and restart the Go Server service for same effect. Or we can add the current user to <admins> in the <security> part of cruiseconfig.xml
42

43

Documentation on using password files: http://www.go.cd/documentation/user/current/configuration/dev_authentication.ht ml https://github.com/gocd/gocd/blob/master/manualtesting/ant_hg/password.properties Location of SSH keys is: C:/Program Files (x86)/Go Server/%HOMEDRIVE%%HOMEPATH%/.ssh /var/go/.ssh on Linux
44

45

46

47

48

49

Documentation for the exec builder: http://cruisecontrol.sourceforge.net/main/configxml.html#exec
50

51

52

53

54

55

56

57

58

59

60

61

