require_relative 'sudoku_reference_tables'
require_relative 'sudoku_helper_methods'

require 'terminal-table'
require 'highline/import'

display_menu  # Menu Call

class SudokuCell
  attr_reader :name, :grid, :test, :row, :row_array, :column, :col_array
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    @row = @name[-3].to_i
    @row_array = $cell_values[@row]
    @column = @name[-2]
    @col_array = ##$cell_values.transpose[@row]
    @grid = "grid_" + @name[-1]
    #@grid_array = grid_values($grid_hash[@grid])
    @value = value
    @possible_values = (1..9).to_a
  end
end

# Create Instance Classes of the SudokuCell Class
  $cell_hash = Hash.new
  $cell_values = []

  $cell_ref.each do |row|
    row.each_index { |index2| $cell_hash[row[index2]] = SudokuCell.new(row[index2], $board.shift) }
  end

  $cell_ref.each_index do |i1|
    row = []
    $cell_ref.each_index {|i2| row << $cell_hash[$cell_ref[i1][i2]].value }
    $cell_values << row
  end

#####################################################################
# Program Iteration Methods

def refresh_board
  system('clear')
  display_board($cell_values)
  puts display_cell_data($cell_hash)
end

def iterate_cells_check_values



end

def check_row(cell_name, row_array)



end

def check_column(cell_name, col_array)



end

def check_grid(cell_name, grid_array)



end

#####################################################################
# Program Operation Commands


refresh_board
p $cell_hash["cell01A"].row_array
p $cell_hash["cell01A"].row
#p $cell_hash["cell01A"].grid_array