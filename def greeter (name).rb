def greeter (name)
  return "greeting #{name}"
end

def by_three?(n)
  if n%3 == 0 
  	return true
  else
  	return false
  end
end

puts by_three?(3)
gets