require 'rubygems'
require 'rest-client'

URL="http://preev.com/pulse/units:btc+inr/sources:bitfinex+bitstamp+btce"
data1 = 0
data2 = 0
sign = ["up","down","equal"]
i=3
$key_hit = false


thread1 = Thread.new{

	while true
		response = RestClient.get(URL)
		arr = (response.body).split(/"/)
		data2=arr[9].to_i
		if data2>data1
			i = 0
		elsif data2<data1
			i = 1
		else data2 == data1
			i = 2
		end
		puts "#{arr[9]}   #{sign[i]}"
		data1=arr[9].to_i
		break if $key_hit
	end
}


thread2 = Thread.new {
    x = gets
    $key_hit = true
}


thread1.join
thread2.join
