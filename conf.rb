movies = {
    :revenant => 4,
    :olym => 2,
    :americanpie => 1,
}
puts "INput"

choice = gets.chomp

case choice
when "add"
    puts "Movie name"
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "Movie Rating"
        rating = gets.chomp.to_i
        movies[title] = rating
    else
        puts "#{movie} already existes";
    end
when "update"
    puts "Updated!"
when "display"
    puts "Movies!"
when "delete"
    puts "Deleted!"
else
    puts "error!"
end


gets