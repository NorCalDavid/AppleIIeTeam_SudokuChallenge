require_relative 'sudoku_helper_methods'
require_relative 'sudoku_reference_tables'

require 'terminal-table'

$cell_reference = [["cell00A","cell01A","cell02A","cell03B","cell04B","cell05B","cell06C","cell07C","cell08C"],
                   ["cell10A","cell11A","cell12A","cell13B","cell14B","cell15B","cell16C","cell17C","cell18C"],
                   ["cell20A","cell21A","cell22A","cell23B","cell24B","cell25B","cell26C","cell27C","cell28C"],

                   ["cell30D","cell31D","cell32D","cell33E","cell34E","cell35E","cell36F","cell37F","cell38F"],
                   ["cell40D","cell41D","cell42D","cell43E","cell44E","cell45E","cell46F","cell47F","cell48F"],
                   ["cell50D","cell51D","cell52D","cell53E","cell54E","cell55E","cell56F","cell57F","cell58F"],

                   ["cell60G","cell61G","cell62G","cell63H","cell64H","cell65H","cell66I","cell67I","cell68I"],
                   ["cell70G","cell71G","cell72G","cell73H","cell74H","cell75H","cell76I","cell77I","cell78I"],
                   ["cell80G","cell81G","cell82G","cell83H","cell84H","cell85H","cell86I","cell87I","cell88I"]]

# Grid Location Reference
  $grid_hash = {
    "grid_A" => [$cell_reference[0][0..2], $cell_reference[1][0..2], $cell_reference[2][0..2]].flatten,
    "grid_B" => [$cell_reference[0][3..5], $cell_reference[1][3..5], $cell_reference[2][3..5]].flatten,
    "grid_C" => [$cell_reference[0][6..8], $cell_reference[1][6..8], $cell_reference[2][6..8]].flatten,
    "grid_D" => [$cell_reference[3][0..2], $cell_reference[4][0..2], $cell_reference[5][0..2]].flatten,
    "grid_E" => [$cell_reference[3][3..5], $cell_reference[4][3..5], $cell_reference[5][3..5]].flatten,
    "grid_F" => [$cell_reference[3][6..8], $cell_reference[4][6..8], $cell_reference[5][6..8]].flatten,
    "grid_G" => [$cell_reference[6][0..2], $cell_reference[7][0..2], $cell_reference[8][0..2]].flatten,
    "grid_H" => [$cell_reference[6][3..5], $cell_reference[7][3..5], $cell_reference[8][3..5]].flatten,
    "grid_I" => [$cell_reference[6][6..8], $cell_reference[7][6..8], $cell_reference[8][6..8]].flatten
  }

class SudokuCell
  attr_reader :name, :grid, :test
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    @row = @name[-3]
    @col = @name[-2]
    @grid = $grid_hash["grid_" + @name[-1]]
    @value = value
    @possible_values = (1..9).to_a
  end

  end

  class_instances = []
  sudoku_game1 = board($board_1)

  $cell_reference.flatten.each_index do |index|
    class_instances << SudokuCell.new($cell_reference.flatten[index], sudoku_game1.flatten[index])
  end

  rows_of_class_instances = []
  9.times do
    rows_of_class_instances << class_instances.shift(9)
  end

  $array_of_values = []
  rows_of_class_instances.each do |row|
    $array_of_values << row.map { |cell| cell.value}
  end

  $current_game = rows_of_class_instances

def check_cells(cell)
  check_row(cell)
  possibilities_subtractor(cell.possible_values, check_row(cell))
  check_column(cell)
  possibilities_subtractor(cell.possible_values, check_column(cell))
  check_grid(cell)
  possibilities_subtractor(cell.possible_values, check_grid(cell))

end

def check_row(cell) #passed in from rows_of_class_instances[][]
  $current_game.each do |row|
    if row.include?(cell)
      array_checker(row)
    end
  end
end

def check_column(cell)
  $current_game.transpose.each do |row|
    if row.include?(cell)
      array_checker(row)
    end
  end
end

def check_grid(cell)
  array_checker($grid_hash[cell.grid]) #needs to be fixed
end

def solve_board
  $current_game.flatten.each do |cell|
    check_cells(cell)
    if cell.possible_values.length == 1
      cell.value = cell.possible_values[0]
    end
  end
end






#####################################################################
#Driver Code

display_board($array_of_values)

p ($current_game[0][0]).name
p ($current_game[0][0]).grid
p ($current_game[0][0]).value
p ($current_game[0][0]).possible_values
p array_checker($current_game[0])


# p grid_hash["grid_A"]
# p grid_buddies(grid_hash["grid_A"])

# v_array = array_checker(grid_A)
# possibilities = (1..9).to_a
# p possibilities_subtractor(possibilities, v_array)
# display_board($array_of_values)
