require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
end

response = client.post do |req|
  req.url '/api/v1/users'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "user": {"name": "test user"} }'
end

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('b78ae86e16da84afc4f8af34a2c5d535')
end

response = client.post do |req|
  req.url '/api/v1/posts'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "post": {"title": "Title", "body": "Text"} }'
end

response = client.delete do |req|
  req.url '/api/v1/posts/9'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status
