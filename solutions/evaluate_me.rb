def awesome_code(x)
	total = 0
	for i in 0..1000
		total = i
	end
	while x > 0
		x /= 2
		total += x
	end
	total
end
