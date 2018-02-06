def double(par)
    yield par
end
double(2) { |n| puts n*2}