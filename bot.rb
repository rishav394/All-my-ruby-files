require 'rubygems'
require 'rest-client'
require 'crack'

q1 = 12
r1 = 40
s1 = 4
t1 = 2
u1 = 2
v1 = 0


q2 = 80
r2 = 4
s2 = 8
t2 = 2
u2 = 0
v2 = 1
a2 = 0

q3 = 60
r3 = 20
s3 = 2
t3 = 6
u3 = 0
v3 = 1
a3 = 0

q4 = 24
r4 = 10
s4 = 8
t4 = 0
u4 = 1
v4 = 0
a4 = 0

q5 = 60
r5 = 2
s5 = 12
t5 = 0
u5 = 1
v5 = 0
a5 = 0

q6 = 12
r6 = 20
s6 = 0
t6 = 3
u6 = 0
v6 = 0
a6 = 0

base_URL="https://www.idomaths.com/simeq.php?solvesimeq=1&size=6&"

for a1 in (-100)..(2000) do
	URL = "#{base_URL}q1=#{q1}&r1=#{r1}&s1=#{s1}&t1=#{t1}&u1=#{u1}&v1=#{v1}&a1=#{a1}&q2=#{q2}&r2=#{r2}&s2=#{s2}&t2=#{t2}&u2=#{u2}&v2=#{v2}&a2=#{a2}&q3=#{q3}&r3=#{r3}&s3=#{s3}&t3=#{t3}&u3=#{u3}&v3=#{v3}&a3=#{a3}&q4=#{q4}&r4=#{r4}&s4=#{s4}&t4=#{t4}&u4=#{u4}&v4=#{v4}&a4=#{a4}&q5=#{q5}&r5=#{r5}&s5=#{s5}&t5=#{t5}&u5=#{u5}&v5=#{v5}&a5=#{a5}&q6=#{q6}&r6=#{r6}&s6=#{s6}&t6=#{t6}&u6=#{u6}&v6=#{v6}&a6=#{a6}&round=4"

	response = RestClient.get(URL)

	xfile = File.open("answertemp.txt", "a")

	arr = (response.body).split(/[>,<]/)
	i = 0

	xfile.print "a1 = #{a1} --- "

	for j in 0..5 do
		xfile.print arr[12 + (6*j)] + arr[14 + (6*j)] + "   "
	end
	xfile.puts
	
	puts "done with a1 = #{a1}"
	xfile.close
end

gets