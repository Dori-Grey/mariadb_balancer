require 'sinatra'
require 'mysql2'

get '/' do
  db_config = {
    host: 'haproxy', username: 'root', database: 'app', port: '3306'
  }

  client = Mysql2::Client.new(db_config)
  client.query("INSERT INTO users (name) VALUES ('Test name')")
  results = client.query('SELECT * FROM users')

  content_type :json
  results.to_a.to_json
end
