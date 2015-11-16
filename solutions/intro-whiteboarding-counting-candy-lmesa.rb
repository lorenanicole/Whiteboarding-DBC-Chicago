=begin

Math for test case
Jar 1 - 100
Jar 2 - 200
Jar 3 - 200
Jar 4 - 200 
Jar 5 - 100
Total:  800

800 / 5 = 160

=end

# Solution 1: Use a hash? 
# Performance: O(n**2)

def hash_counting_candy(instructions)
	jar_qty = Hash[(1..instructions.shift).map { |num| [num, 0] }] # Make a map of jar num and set a default qty

    instructions.each do |instruction| # Parse each set of instructions
		(instruction[0]..instruction[1]).each do |jar|
            jar_qty[jar] += instruction[2]
        end
	end
	(jar_qty.values.inject(:+)) / jar_qty.length # Calculate the average
end

# Test
puts hash_counting_candy([5,[1,2,100],[2,5,100],[3,4,100]]) == 160


# Solution 2 - Pattern - Essentially we're "reducing" the array to a value. Instead 
# of nested iteration let's parse the instructions into the math operation and
# keep track of the total only. 
#
# Performance: O(n)

def reduce_counting_candy(instructions)

    jars_count = instructions[0]

    # Fill jars

    total_candy = instructions[1..-1].reduce(0) { |total, instruction|
        num_jars = (instruction[1]+1) - instruction[0]
        # num_jars = (instructions[0]..instructions[1]).to_a.length
        candy_qty = num_jars * instruction[-1]
        total += candy_qty

    }

    # instructions[1..-1].each do |instruction|

    #     num_jars = (instruction[1]+1) - instruction[0]
    #     candy_qty = num_jars * instruction[-1]
    #     total_candy += candy_qty

    # end

    total_candy/jars_count
end

# Test
puts reduce_counting_candy([5,[1,2,100],[2,5,100],[3,4,100]]) == 160


