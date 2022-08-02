FUZZING JAVASCRIPT ENGINES FOR FUN & PROFIT
AREUM LEE@SSG SINGI@THEORI

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

2

AREUM LEE

 Areum Lee  Member @ SSG  Undergrad student @ Sejong Univ  Former intern @ Fortinet HQ  Alumnus @ BoB

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

3

SINGI

 Jeonghoon Shin  Member @ SSG  Researcher @ Theori  Mentor @ BoB  Full time daddy

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

4

CONTENTS

1. Overview
 What we aimed
to do
 How we did it

2. Our Fuzzer
 Characteristics 
& Environment
 Overall structure
 JFF  Fuzzer
- Bella - Benjamin

3. Conclusion  Result  Limitations

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

5

WHAT WE AIMED TO DO

1. Find vulnerabilities in browser javascript engines!
 v8  javascript core  chakra core  spider monkey
2. Utilize fuzzer!

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

6

WHY TARGET BROWSERS?

 Everyone uses web browsers.  If a browser is vulnerable, a lot of people are prone to
attacks.
 Web standards are continuously being updated. 
New features are added continuously.
 More changes to code. So more chance of bugs?
 Web browser security is super important.

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

7

WHY JAVASCRIPT?
 Javascript is easier to exploit compared to DOM objects


HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

8

WHY JAVASCRIPT?

 Documentation of ECMA Script is well maintained
 If a zero-day is found, it will work on similar js engine
versions

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

9

WHY FUZZING?

 It saves time!  It creates many test cases in a short time  You can focus on other work while the computer runs
the fuzzer.
 If you can't find bugs via source code auditing, 
you have somewhere to turn to. 

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

10

HOW WE DID IT

 Create a Javascript Fuzzing
Factory
 Manage fuzzing nodes using
Docker
 Make fuzzer create test cases
based on existing 1day cases.
 Test case does not need to have
any meaning to it. Just needs to create crashes!

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

11

CHARACTERISTICS & ENVIRONMENT

[ CHARACTERISTICS ]
 Fuzzing · In-memory fuzzing
 Management · use Docker!

[ ENVIRONMENT ]
 Fuzzing Server · Amazon EC2 service · 8 GB RAM · 4 CPU core

 Creation of Test Case
· Mutation based on existing 1days
· Generation using dictionary for
javascript syntax

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

12

OVERALL STRUCTURE

JAVASCRIPT FUZZING FACTORY

MANAGEMENT

DOCKER

NODE 1 NODE 2 NODE 3 NODE 4

FUZZER

JS ENGINE
 CRASH

CRASH COLLECTOR

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

13

JFF - JAVASCRIPT FUZZING FACTORY

JAVASCRIPT FUZZING FACTORY

MANAGEMENT PLATFORM

DOCKER

NODE 1 NODE 2 NODE 3 NODE 4

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

14

JFF - JAVASCRIPT FUZZING FACTORY
 Comprises of :
1. Docker
- js engines and fuzzer run within the docker nodes
2. Web management platform
- Use node js API to control the docker    

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

15

JFF - JAVASCRIPT FUZZING FACTORY
 In-memory fuzzing  make changes to javascript engine code

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

16

JFF - JAVASCRIPT FUZZING FACTORY
 In-memory fuzzing

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

17

JFF - JAVASCRIPT FUZZING FACTORY
 In-memory fuzzing  Before

 After
  

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

18

JFF - JAVASCRIPT FUZZING FACTORY
 In-memory fuzzing
 Before
 

 After
  

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

19

THE FUZZERS



BELLA


BENJAMIN
NULL





HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

20

BELLA

 Mutation based  Apply mutations on existing 1days by finding patterns
 Why?  There are too many cases.  Hard to find pattern by hand.
 How?  Create template from existing 1days.  Make minimal changes to create random JS file.

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

21

LEGO

 Our approach to create JS syntax  Name given to the template created from 1days.

 Parse 1-day PoCs for making LEGO file  Parse LEGO file to make a new JS file.

 Excluded whatever was not important

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

22

BENJAMIN

 Generation based  make by using input grammar

 How?  Create input grammar by using library

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

23

BENJAMIN

 Problem!  Test cases have fixed form  Have to be randomized

 Solution  Make API!

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

24

API

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

25

API

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

26

CRASH COLLECTOR

 Use regex  \s\*\s[0-9A-F]{8}\s\|.*\|.*\[(eax|ebx|ecx|edx|esi|edi|ebp|esp|eip).*\]

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

27

OVERALL STRUCTURE (AGAIN)

JAVASCRIPT FUZZING FACTORY

MANAGEMENT

DOCKER

NODE 1 NODE 2 NODE 3 NODE 4

FUZZER

JS ENGINE
 CRASH

CRASH COLLECTOR

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

28

IT'S LIKE AN ICE CREAM SUNDAE!

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

29

RESULT

 Crash produced by using Benjamin.  Target : Safari javascript core

 Occurred in web assembly due to overflow.

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

30

DEMO

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

31

WE'RE STILL FAR FROM PERFECT

 We need good code coverage.  JFF is small-scale compared to those being used in big
companies.
 Limitations to creating different types of JS templates.  The sequence of API usage may be limited
 We have few minor bugs.

HITBAMS2018 - FUZZING JAVASCRIPT ENGINES FOR FUN AND PROFIT

32

FUTURE PLANS

 Keep track of ECMA Script updates and add to fuzzer
 ECMA script updates will also be applied to javascript
engine
 Enhance JFF to support other vectors

Q&A

