# 1 - 100
# 2 - 200
# 3 - 200
# 4 - 200 
# 5 - 100
# 800 / 5 = 160

def counting_candy(jars)
	jar_qty = Hash[(1..jars.shift).map { |num| [num, 0] }] # Make a map of jar num and its quantity
	jars.each do |directions| # Parse each set of instructions
		(directions[0]..directions[1]).each do |jar_num|
			jar_qty[jar_num] += directions[2]
		end
	end
	(jar_qty.values.inject(:+)) / jar_qty.length # Calculate the average
end

p counting_candy([5,[1,2,100],[2,5,100],[3,4,100]]) == 160

# Problem - assumes the ordering of the directions is always fixed
