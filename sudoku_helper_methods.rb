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
  new_arr
end

def display_board(array)
  rows = []
  array.each do |element|
    rows << (element)
  end

  table = Terminal::Table.new :rows => rows
  puts table
end

def grid_buddies(array)
    values = []
    instance_variable_set("@#{foo}", "cornholio")
    array.each_index { |index| p array[index].value }
  end

def array_checker(array)
  output_array = []
  array.each do |square|
    if square.is_a? Fixnum
      output_array << square
    end
  end
  output_array
end

def possibilities_subtractor(possible_values, array)
  array.each do |element|
    if possible_values.include? element
      possible_values.delete(element)
    end
  end
  possible_values
end
