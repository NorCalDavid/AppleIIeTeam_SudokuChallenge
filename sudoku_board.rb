
def board(string)

	new_arr = []

	while string.empty? == false do 
	new_arr << string.slice!(0,9).split("")
	end 

	new_arr.each do |sub_arr|
		sub_arr.each_index do |index|
			if sub_arr[index] == "-"
				sub_arr[index] = nil
			else 
				sub_arr[index] = sub_arr[index].to_i 
			end 
		end
	end
	p new_arr
end

 board("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")





