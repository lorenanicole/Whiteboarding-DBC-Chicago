=begin

Compare two arrays and determine if they are equal.

=end
def compare_arrays(arr_one, arr_two)
	comparison = {}
	arr_one.each do |elem|
		if comparison.has_key?(elem)
			comparison[elem] += 1
		else
			comparison[elem] = 1
		end
	end
	arr_two.each do |elem|
		if comparison.has_key?(elem)
			comparison[elem] -= 1
		else
			comparison[elem] = 1
		end
	end
	uneven_elems = comparison.select{|key,val| val != 0}
	uneven_elems.length == 0
end

p compare_arrays([1,2,3,4], [1,2,3,4,5]) == false
p compare_arrays([1,2,3,4], [1,2,3,4]) == true
p compare_arrays([1,2,4,4], [1,2,3,4]) == false
p compare_arrays([1,2,4,4], [1,2,4,4]) == true
p compare_arrays([1], [1]) == true
p compare_arrays([1], [2]) == false
p compare_arrays([], [2]) == false
p compare_arrays([], []) == true
