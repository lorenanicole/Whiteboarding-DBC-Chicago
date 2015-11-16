def prime?(n)
	return false if n < 2
	(2..Math.sqrt(n)).none? {|num| n % num == 0}
end

p prime?(13) == true
p prime?(5) == true
p prime?(99) == false