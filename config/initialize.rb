require 'active_record'

CONFIG = YAML.load(File.read(File.expand_path('../config.yml', __FILE__)))

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => "db/#{APP_ENV}.sqlite3",
  :pool => 5,
  :timeout => 5000
)
