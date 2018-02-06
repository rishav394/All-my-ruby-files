for a in 1..255 do
	xafile = File.open("shutall2.txt", "a")
	if a==43
		a=44
	end
	xafile.print "shutdown -m [\\]192.168.100.#{a} -r -f -t 12  "  #some concept of regx. used here in case of //
	xafile.puts
	xafile.close
end
gets