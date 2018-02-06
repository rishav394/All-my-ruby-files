require "rubygems"
require "rest-client"

base_URL="https://www.idomaths.com/simeq.php?solvesimeq=1&size=2"
for q1 in (1)..(100) do
	url="https://www.idomaths.com/simeq.php?solvesimeq=1&size=2&q1=#{q1}&r1=2&a1=3&q2=2&r2=3&a2=4&round=2"
	response=RestClient.get(url)
	answers=File.open("yo.txt", "a")
	if response=~ /\s-?\d</
		answers.print response
		answers.puts
	end
	answers.close
end


gets