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

class SudokuCell
  attr_reader :name, :grid, :test
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    @name
    #@grid = determine_grid?
    @value = value
    @possible_values = (1..9).to_a
    instance_variable_set(:@test, ("grid_" + @name[-1]))
  end

  private # Private method not available outside class
    def determine_grid? ## Determine the Grid Location Based off of the Cell Name
       #grid_hash["grid_" + @name[-1]]
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

  # Grid Location Reference
  grid_hash = {
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

  def grid_buddies(array)
    values = []
    p array
    array.each_index { |index| p array[index].value }
  end

# instance_variable_set("@#{rows_of_class_instances[0][0].grid}", "cornholio")

#p array_checker(rows_of_class_instances[0][0].grid)
#p rows_of_class_instances[0][0].grid
#p rows_of_class_instances[0][0].test



#####################################################################
#Driver Code

display_board($array_of_values)

# p grid_hash["grid_A"]
# p grid_buddies(grid_hash["grid_A"])

# v_array = array_checker(grid_A)
# possibilities = (1..9).to_a
# p possibilities_subtractor(possibilities, v_array)
# display_board($array_of_values)
