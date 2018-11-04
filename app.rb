require 'rest-client'
require 'pry'
require 'json'

file = File.read('environment.json')
environment = JSON.parse(file)
token = environment["token"]

payload = { name: "blog" }
headers = { params: {access_token: token} }
res = RestClient.post('https://api.github.com/user/repos', payload.to_json, headers)

binding.pry