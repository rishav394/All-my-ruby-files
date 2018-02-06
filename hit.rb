$key_hit = false
t1 = Thread.new{

loop{
        puts "Hello"
        sleep 1
        break if $key_hit
    }
}

t2 = Thread.new {
    x = gets
    $key_hit = true
}
t1.join
t2.join

puts "Done, exiting"