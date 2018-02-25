require "rubygems"
require "json"
require 'restclient'
require 'crack'
require 'clipboard'

url="https://api.opendota.com/api/matches/3738135228"
data= JSON.parse(RestClient.get(url))
xfile=File.open("dots.txt","w")
xfile.write(data)
xfile.close