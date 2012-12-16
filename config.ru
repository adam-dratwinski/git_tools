APP_ENV = "production" 

require "./app"

Cuba.use Rack::Session::Cookie, :secret => SecureRandom.hex(64)
Cuba.use Rack::Protection

Cuba.use Rack::Static,
  root: "public",
  urls: ["/javascripts", "/stylesheets", "/images"]

run Cuba
