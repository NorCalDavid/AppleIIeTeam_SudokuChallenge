require_relative 'sudoku_reference_tables'
require_relative 'sudoku_helper_methods'

require 'terminal-table'
require 'highline/import'

display_menu  # Menu Call

class SudokuCell
  attr_reader :name, :grid, :test, :row, :row_array, :column, :col_array, :grid_arrayx
  attr_accessor :value, :possible_values, :update, :check_row, :check_column, :check_grid

  def initialize(name, value)
    @name = name
    @row = @name[-3].to_i
    @column = @name[-2]
    @grid = "grid_" + @name[-1]
    @value = value
    @possible_values = (1..9).to_a
  end

  def update
    row_array
    col_array
    grid_array
  end

  def row_array
    $cell_values[row]
  end

  def check_row
    row_array.each do |cell|
      possible_values.delete(cell) if cell.is_a? Fixnum #Is conditional required here?
    end
  end

  def col_array

  end

  def check_column

  end

  def grid_array
    grid_values($grid_hash[@grid])
  end

  def check_grid
    grid_array.each do |cell|
      possible_values.delete(cell) if cell.is_a? Fixnum #Is conditional required here?
    end
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

  $array_of_keys = $cell_hash.keys

#####################################################################
# Program Iteration Methods

def refresh_board
  system('clear')
  $array_of_keys.each { |key| $cell_hash[key].update }
  display_board
  display_cell_data($cell_hash)
end

def iterate_cells_check_values
  $array_of_keys.each do |key|
    cell = $cell_hash[key]
    cell.check_row
    cell.check_column
    cell.check_grid
    cell.update
  end
  refresh_board

end

#####################################################################
# Program Operation Commands


# refresh_board
iterate_cells_check_values
