APP_ENV = "production" 

require "cuba"
require "rack/protection"
require "securerandom"
require "./app"

Cuba.use Rack::Session::Cookie, :secret => SecureRandom.hex(64)
Cuba.use Rack::Protection

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end
  end
end

run Cuba
