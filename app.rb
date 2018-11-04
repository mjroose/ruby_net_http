require 'net/http'
require 'uri'
require 'pry'

uri = URI('https://jsonplaceholder.typicode.com/todos')

req = Net::HTTP::Post.new(uri)
req.set_form_data('from' => '2005-01-01', 'to' => '2005-03-31')

res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
  http.request(req)
end

binding.pry

# case res
# when Net::HTTPSuccess, Net::HTTPRedirection
#   # OK
# else
#   res.value
# end