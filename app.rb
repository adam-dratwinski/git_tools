APP_PATH = File.dirname(__FILE__) 

require "pry"
require "cuba"
require "rack/protection"
require "securerandom"
require "cuba/render"

Cuba.plugin Cuba::Render

require_relative "config/initialize"
require_relative "app/models/commit"
require_relative "app/models/store"
require_relative "app/models/github_store"
require_relative "config/routes"
