require_relative 'sudoku_reference_tables'
require_relative 'sudoku_helper_methods'

require 'terminal-table'

class SudokuCell
  attr_reader :name, :grid, :test
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    @row = @name[-3]
    @col = @name[-2]
    @grid = "grid_" + @name[-1]
    @value = value
    @possible_values = (1..9).to_a
  end
end

  $sudoku_game1 = board($board_1)

# Create Instance Classes of the SudokuCell Class
  $class_instances = []

  $cell_reference.each_index do |index|
    row = $cell_reference[index]

    row.each_index do |index2|
      instance_variable_set("@#{row[index2]}", SudokuCell.new(row[index2], $sudoku_game1[index][index2]))
      $class_instances << SudokuCell.new(row[index2], $sudoku_game1[index][index2])
    end

  end

  $rows_of_class_instances = []
  9.times do
    $rows_of_class_instances << $class_instances.shift(9)
  end

  $array_of_values = []
  $rows_of_class_instances.each do |row|
    $array_of_values << row.map { |cell| cell.value}
  end

def display_cell_data
  rows = []

      $rows_of_class_instances.each do |row|
        row.each do |cell|
          rows << [cell.name, cell.value, cell.possible_values]
        end
      end

  table2 = Terminal::Table.new :headings => ["Cell Name", "Value", "Possible Values"], :rows => rows
  table2
end

#####################################################################
#Driver Code

puts @cell00A.value

# p rows_of_class_instances[0][0].grid
display_board($array_of_values)
puts display_cell_data

 # p $grid_hash["grid_A"]
#p grid_buddies($grid_hash["grid_A"])

# v_array = array_checker(grid_A)
# possibilities = (1..9).to_a
# p possibilities_subtractor(possibilities, v_array)
# display_board($array_of_values)
