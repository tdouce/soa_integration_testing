ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rest_client'

# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, make a
# separate helper file that requires this one and then use it only in the specs
# that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

# 'home' (the application where the test data must be created) must:
#   1. Have the gem 'remote_factory_girl_home_rails' installed and configured
#   2. The 'home' server must be running on the port and host configured below,
#      and be available a the end_point prior to running tests in the 'client'
#      (i.e. this application) 
#
RemoteFactoryGirl.configure(:home_1) do |config|
  config.home = { host: 'localhost',
                  port: 3000,
                  end_point: '/remote_factory_girl/home' }
  config.return_with_root = false
  #config.return_response_as = :dot_notation
  #config.return_as_active_resource = true
end

# If you needed to create data in another 'home' (i.e. home_2), then you can configure
# a second 'home'
#
#RemoteFactoryGirl.configure(:home_2) do |config|
#  config.home = { host: 'localhost',
#                  port: 4000,
#                  end_point: '/remote_factory_girl/home' }
#  config.return_with_root = false
#  #config.return_response_as = :dot_notation
#  #config.return_as_active_resource = true
#end


# 'home' (the application where the test data must be created) must:
#   1. Have the gem 'remote_database_cleaner_home_rails' installed and configured
#   2. The 'home' server must be running on the port and host configured below,
#      and be available a the end_point prior to running tests in the 'client'
#      (i.e. this application) 
#
RemoteDatabaseCleaner.configure do |config|
  config.home = { host: 'localhost',
                  port: 3000,
                  end_point: '/remote_database_cleaner/home/clean' }
end

RSpec.configure do |config|
  config.before(:each) do
    RemoteDatabaseCleaner.clean
  end
end

#### Helpers used to help prove RemoteFactoryGirl created test data #####
def home
  "http://#{ RemoteFactoryGirl.config(:home_1).home[:host] }:#{ RemoteFactoryGirl.config(:home_1).home[:port] }"
end

def fetch_users_from_home
  json = RestClient.get "#{ home }/users", {:params => {:just_retrieving_resources_to_prove_they_exist_in_client_test => true}, :accept => :json}
  parse_json(json)
end

def fetch_user_by_id_from_home(id)
  json = RestClient.get "#{ home }/users/#{ id }", {:params => {:just_retrieving_resources_to_prove_they_exist_in_client_test => true}, :accept => :json}
  parse_json(json)
end

def fetch_school_by_id_from_home(id)
  json = RestClient.get "#{ home }/schools/#{ id }", {:params => {:just_retrieving_resources_to_prove_they_exist_in_client_test => true}, :accept => :json}
  parse_json(json)
end

def parse_json(json)
  JSON.parse(json)
end
####
