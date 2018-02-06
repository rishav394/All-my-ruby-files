puts "Text to search through: "
text = gets.chomp
puts "Word to redact: "
redact = gets.chomp
puts "new Word"
word = gets.chomp
words = text.split(" ")
words.each do |tword|
if tword != redact
print tword + " "
else
print word + " "
end
end
gets