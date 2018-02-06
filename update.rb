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
    puts "Movie name"
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "Not found!"
    else
        puts "New rating?"
        rating = gets.chomp.to_i
        movies[title] = rating
    end
when "display"
    movies.each  do |movie,rating|
        puts "#{movie}: #{rating}"
    end
when "delete"
    puts "Movie name"
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "No such movie"
    else
        movies.delete(title)
    end
else
    puts "error!"
end



puts "---------------------------\n\n Hash is "
puts movies

gets