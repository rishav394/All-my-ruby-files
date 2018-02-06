require "rubygems"
require "rest-client"
require "fileutils"

def magnetout(pornname)

	puts "SEARCHING FOR IT"
	url="http://1337x.to/search/#{pornname}/1/"
	test=RestClient.get(url)
	xfile=File.open("name.txt","w")#it has all the data of the search page
	xfile.write(test)
	xfile.close
	puts "DONE SEARCHING"	

	puts "FINDING THE BEST TORRENT"
	xfile99=File.open("name.txt","r")

	#we r now opening the torrent page
	ch=xfile99.readline
	while !(ch=~ /<th class="coll-5">uploader<\/th>/)
		ch=xfile99.readline
	end
	ch=xfile99.readline
	ch=xfile99.readline
	ch=xfile99.readline
	ch=xfile99.readline
	ch=xfile99.readline
	ndat=ch.split(/\"/)
	#ndat=ch.split(/\/">/,/href="/)
	#/\/">, href="/
	snew=ndat[9]


	puts "TORRENT FOUND. OPENING NOW.."
	nurl="http://1337x.to#{snew}"  #this shit has pages's link
	xfile99.close
	#puts "#{nurl}"
	test=RestClient.get(nurl)    #this shit has page's source
	xfile=File.open("name2.txt","w")
	xfile.write(test)
	xfile.close
	xfile=File.open("name2.txt","r")
	ch=xfile.readline
	while !(ch=~ /<ul class="download-links-dontblock btn-wrap-list">/)
		ch=xfile.readline
	end
	ch=xfile.readline
	puts "MAGNET FOUND. WRITING MAGNET LINK.."
	ndat=ch.split(/"\s\w+="/)
	almostmag=ndat[1]
	mag=almostmag
	puts
	puts mag
	xfile.close


	puts
	puts
	puts
	puts	
end


FileUtils.rm_f 'lin.txt'

puts "Enter the name"
inp = gets.chomp

sh=inp.gsub /\s+/, '%20'
sh=sh.gsub /:/, '%3A'
sh=sh.gsub /\(/, '%28'
sh=sh.gsub /\)/, '%29'

magnetout(sh)




system ("clear")
puts
puts
puts
puts "SHARE"
sleep (2)

puts "PRESS ENTER TO CONTINUE"
gets


FileUtils.rm_f 'brazzers.txt'
FileUtils.rm_f 'brazzersdata.txt'
FileUtils.rm_f 'name.txt'
FileUtils.rm_f 'name2.txt'
FileUtils.rm_f 'bog.txt'