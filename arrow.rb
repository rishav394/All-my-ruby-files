require "rubygems"
require "rest-client"
require "open-uri"

def doit()
	sleep(2)
	puts
	puts
	puts
end


puts "FETCHING DATA FROM KAT.CR"
url="https://kat.cr/usearch/Arrow/"
test=RestClient.get(url)
xfile=File.open("name.txt","w")
xfile.write(test)
xfile.close
puts "DONE FETCHING DATA"

doit

puts "WRITING MAGNET LINES IN FILE 2"
xfile=File.open("name.txt","r")
xfile2=File.open("soln.txt","w")
while !xfile.eof?
	ch=xfile.readline
	if ch=~ /magnet/
		xfile2.print ch
		xfile2.puts
	end
end
xfile.close
xfile2.close
puts "DONE WRITING MAGNET LINKS"

doit

puts "STORING FIRST MAGNET IN AN ARRAY"
xfile2=File.open("soln.txt","r")
ch = xfile2.readline
arr = ch.split(/\'/)
ch= arr[11]  #CH HAS IT
xfile2.close
puts "DONE STORING!!!"

doit

puts "WRITING DESIRED MAGNET TO THE 2nd FILE"
xfile2=File.open("soln.txt","w")
xfile2.print ch
xfile2.close
puts "DESIRED MAGNET STORED IN link.txt"

doit

puts "THE DESIRED MAGNET WAS #{ch}"
File.delete("name.txt")
File.rename("soln.txt","link.txt")
gets