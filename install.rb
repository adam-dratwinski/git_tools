require 'active_record'

Dir.mkdir("db") unless File.exists?("db")

%w(test production).each do |name|
  ActiveRecord::Base.establish_connection(
    :adapter  => 'sqlite3',
    :database => "db/#{name}.sqlite3",
    :pool => 5,
    :timeout => 5000
  )

  ActiveRecord::Migration.create_table :stores do |t|
    t.string :branch_from
    t.string :branch_to
    t.string :version
    t.text :data
  end
end
