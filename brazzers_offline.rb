xfile2=File.open("brazzers.txt","r")
xfile3=File.open("brazzersdata.txt","w")
if File.exists? ("brazzers.txt")
   puts "brazzers.txt found!!"
else
	puts "brazzers.txt not found!!!"
	puts "EXITING "
	sleep (2)
end

while !xfile2.eof?
	ch=xfile2.readline
	if ch=~ /<!-- START CARD IMAGE WITH HOVER PIC PREVIEWS-->/
		9.times do
			ch=xfile2.readline
		end
		dat=ch.split(/[",-]/)
		xfile3.puts dat[1]
	end
end
xfile2.close
xfile3.close
puts "Done"
sleep (2)