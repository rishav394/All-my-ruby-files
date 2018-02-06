require 'rubygems'
x = false

t1 = Thread.new{
	loop{
		puts "Hello"
		loop { 
		if x 
		else
			break
		end
		 	 }
	}
}

t2 = Thread.new{
	loop { 
	gets
	x = !x }
}

t1.join
t2.join
