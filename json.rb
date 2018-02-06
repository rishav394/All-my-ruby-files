require "rubygems"
require "json"
require 'restclient'
require 'crack'
require 'io/console'


parse = ""
5.times{
	inp = STDIN.getch
	parse += inp
	url="http://en.wikipedia.org/w/api.php?action=opensearch&search=#{parse}&namespace=0"

	data= Crack::JSON.parse(RestClient.get(url))
	puts data[1]
}