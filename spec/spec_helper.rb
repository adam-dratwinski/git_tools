APP_ENV = "test" 

require_relative "../app.rb"
require_relative "helpers/stub_github_response"

Store.delete_all
