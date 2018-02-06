require 'rest_client'
require 'crack'

response = RestClient::get("https://api.stockfighter.io/ob/api/heartbeat")

parse = Crack::JSON.parse(response.body)

if parse["ok"] do
	puts "Everything's fine"
else
	puts "not okay"
end

gets.chomp


