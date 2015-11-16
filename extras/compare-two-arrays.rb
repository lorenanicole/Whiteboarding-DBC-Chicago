=begin

Compare two arrays and determine if they are equal.

=end
def compare_arrays(arr_one, arr_two)
	if arr_one.length != arr_two.length
		return false
	end

	elem_frequency = {}
	arr_one.each do |elem|
		if elem_frequency.has_key?(elem)
			elem_frequency[elem] += 1
		else
			elem_frequency[elem] = 1
		end
	end
	arr_two.each do |elem|
		if elem_frequency.has_key?(elem)
			elem_frequency[elem] -= 1
		else
			elem_frequency[elem] = 1
		end
	end

	uneven_elems = elem_frequency.select{|key,val| val != 0}
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
