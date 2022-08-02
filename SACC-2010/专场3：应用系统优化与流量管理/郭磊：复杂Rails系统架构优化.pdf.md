Rails
130
Jonathan Palleyidapted CTO , idapted 
© 2010 Idapted, Ltd.



""

2009 

1909 


1 30

"1"

Rails
(Rails )





//

"30"?








·  ·  · () · 

?

UI
· CSS/JS/Styleguide · Gem

interface
CSS/JS

<%= idp_include_js_css %> # =>
<script src ="/assets/javascripts/frame.js" type="text/javascript"></script> <link href="/assets/stylesheets/frame.css" media="screen" rel="stylesheet"
type="text/css" />

interface

CSS 

interface
GemHelper
Model

interface
View:
<%= search_form_for(HistoryRecord, :interaction_id, :released,[:rating, {:collection=>assess_ratings}],[:mark_spot_num,{:range=>true}], [:created_at, {:ampm=>true}]) %>
Controller:
@history_records = HistoryRecord.combo_search(params)

interface



1.  2. gem

interface data

data
?
-  - Services

data


course 

user 
purchase 
learning 

data
Purchase
: 

"course"

data


course

data

Model: class CoursePackage < ActiveRecord::Base
acts_as_readonly :course
end
View: <ul> <% CoursePackage.all.each do |package| %>
<li><%= package.title %> <%= package.price %></li> <% end %> </ul>

data

Model: class CoursePackage < ActiveRecord::Base
acts_as_readonly :course
end
View: <ul> <% CoursePackage.all.each do |package| %>
<li><%= package.title %> <%= package.price %></li> <% end %> </ul>

data
acts_as_readonly
def acts_as_readonly(name, options = {}) config = CoreService.app(name).database establish_connection config[Rails.env] set_table_name(self.connection.current_database + (options[:table_name]||table_name).to_s)
end

data
acts_as_readonly
def acts_as_readonly(name, options = {})
config = CoreService.app(name).database
establish_connection config[Rails.env] set_table_name(self.connection.current_database + (options[:table_name]||table_name).to_s) end

data
Core service
class CoreService < ActiveResource::Base self.site = :user def self.app(app_name) CoreService.find(app_name) end
end

data

Core

data
core

data
config/site_config.yml
app: course api:
course_list: package/courses
config/initializers/idp_initializer.rb
CoreService.reset_config

data
core_service.rb in idp_lib
APP_CONFIG = YAML.load(Rails.root.join("config/site_config.yml"))
def reset_config self.post(:reset_config, :app => { :name => APP_CONFIG["app"], :settings => APP_CONFIG, :database => YAML.load_file( Rails.root.join("config/database.yml"))})
end

data
Model in Purchase: class CoursePackage < ActiveRecord::Base
acts_as_readonly :course
end

data
gem
config/environment.rb config.gem `idp_helpers' config.gem `idp_lib'

data
gems

data
· Web services
class CoursePackageService < ActiveSupport::Base self.site = :course
end

data



data

learning: app/controllers/roadmap_services_controller.rb
def create Roadmap.generate(params[:user_id], params[:course_id])
end
Purchase: app/models/roadmap_service.rb class RoadmapService < ActiveSupport::Base
self.site = :course end Purchase: app/models/order.rb def activate_roadmap
RoadmapService.create(self.user_id, self.course_id) end

data
gem
http://github.com/idapted/eco_apps

interface data

user

user
User
·  ·  · 

user


user

SSO Shared Session
Same Session Store

user

config/initializers/idp_initializer.rb
ActionController::Base.session_store = :active_record_store ActiveRecord::SessionStore::Session.acts_as_remote :user,
:readonly => false

user

Controller""
* controlleruser

user

before_filter :check_access_right
def check_access_right unless xml_request? or inner_request? access_denied unless has_page_right?(params[:controller]) end
end
controller

user

has_page_right?
user

user

class IdpRoleRight < ActiveRecord::Base
acts_as_readonly :user, :table_name => "role_rights"
end
def has_page_right?(page) roles = current_user.roles roles_of_page = IdpRoleRight.all(:conditions => ["path = ?",
page]).map(&:role_id) (roles & roles_of_page).size > 0
end

user
gems!
config/environment.rb
config.gem `idp_helpers' config.gem `idp_lib' config.gem `idp_core'

interface data

user service

service



· File · Mail · Comet service

Specify Class that Has Files
Upload File in Background to
FileService
Store with app_name, model_name, model_id
Use readonly magic to easily
display

File
class Article < ActiveRecord::Base has_files end Idp_file_form
@article.files.first.url

service

Comet

class ChatRoom < ActiveRecord::Base acts_as_realtime end

<%= realtime_for(@chat_room, current_user.login) %>

<%= realtime_data(dom_id, :add, :top) %>

@chat_room.realtime_channel.broadcast ("hi world", current_user.login)

service

mail

Mail services
MailService.send("test@idapted.com", :welcome, :user => "test")

App
www.eqenglish.com/user www.eqenglish.com/studycenter www.eqenglish.com/scenario






App 


· User Management · Course package · Purchase · Learning process ·...






· App · 




· service · 
 · 


· 
· 


- 
-  -  - Scalable - "jump in" - 


· FreeSWITCH
· VoIP · http://www.freeswitch.org.cn
· Flex · Erlang
· concurrent tasks
· Titanium
· mobile


1. VoIP 2. JavaScript
 tech-team-jobs@idapted.com

 Q&A
http://developer.idapted.com
jpalley@idapted.com (@jpalley) guolei@idapted.com (@fiyuer)
© 2010 Idapted, Ltd.

