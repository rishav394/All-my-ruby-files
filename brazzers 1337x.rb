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
	xfile2=File.open("lin.txt","a")
	ch=xfile.readline
	while !(ch=~ /<ul class="download-links-dontblock btn-wrap-list">/)
		ch=xfile.readline
	end
	ch=xfile.readline
	puts "MAGNET FOUND. WRITING MAGNET LINK.."
	ndat=ch.split(/"\s\w+="/)
	almostmag=ndat[1]
	mag=almostmag
	xfile2.write(mag)
	xfile2.puts
	xfile.close
	xfile2.close

	puts
	puts
	puts
	puts	
end


FileUtils.rm_f 'lin.txt'
url="www.brazzers.com/videos/all-sites/all-pornstars/all-categories/thismonth/bydate/"
intel=RestClient.get(url)

xfile=File.open("brazzers.txt","w")

xfile.write(intel.body)

xfile.close

xfile2=File.open("brazzers.txt", "r")

xfile3=File.open("brazzersdata.txt", "w")
xfilet=File.open("bog.txt", "w")
while !xfile2.eof?
	ch=xfile2.readline
	if ch=~ /<div class="card-overlay">/
		3.times do
			ch=xfile2.readline
		end
		dat=ch.split(/"/)
		sh=(dat[1].strip).gsub /\s+/, '%20'
		sh=sh.gsub /:/, '%3A'
		sh=sh.gsub /\(/, '%28'
		sh=sh.gsub /\)/, '%29'
		xfile3.puts sh
		xfilet.puts dat[1]
	end
end

xfile3.close
xfilet.close
xfile2.close

xfile3=File.open("brazzersdata.txt","r")
xfilet=File.open("bog.txt", "r")
ch=xfile3.read
pimp=xfilet.read
arr=ch.split(/\n/)
aor=pimp.split(/\n/)
i=1
arr.each do |x|
	if i==15
		break
	end
	puts "#{i}"
	puts "#{aor[i-1]}"
	i=i+1
	magnetout(x)
end
xfilet.close
xfile3.close
system ("clear")
puts
puts
puts
puts "SHARE"
sleep (2)
puts
puts "LINK SAVED IN lin.txt"
puts "PRESS ENTER TO CONTINUE"
gets
FileUtils.rm_f 'brazzers.txt'
FileUtils.rm_f 'brazzersdata.txt'
FileUtils.rm_f 'name.txt'
FileUtils.rm_f 'name2.txt'
FileUtils.rm_f 'bog.txt'