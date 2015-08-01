require_relative 'sudoku_reference_tables'
require_relative 'sudoku_helper_methods'

require 'terminal-table'
require 'highline/import'
require 'colorize'

display_menu  # Menu Call

class SudokuCell
  attr_reader :name, :grid, :test, :row, :row_array, :column, :col_array, :grid_array
  attr_accessor :value, :possible_values, :update, :check_row, :check_column, :check_grid

  def initialize(name, value)
    @name = name
    @row = @name[-3].to_i
    @column = @name[-2].to_i
    @grid = "grid_" + @name[-1]
    @value = value
    @possible_values = (1..9).to_a
  end

  def update
    row_array
    col_array
    grid_array
    if (1..9).to_a.include?(@value)
      @possible_values.clear()
    end
  end

  def row_array
    $cell_values[row]
  end

  def check_row
    row_array.each do |cell|
      possible_values.delete(cell)
    end
  end

  def col_array
    $cell_values.transpose[column]
  end

  def check_column
    col_array.each do |cell|
      possible_values.delete(cell)
    end
  end

  def grid_array
    grid_values($grid_hash[@grid])
  end

  def check_grid
    grid_array.each do |cell|
      possible_values.delete(cell)
    end
  end

  def record_value
    if @value == nil && @possible_values.length == 1
        @value = @possible_values[0].to_s.red
        @possible_values.clear
    end
  end
end

# Create Instance Classes of the SudokuCell Class
  $cell_hash = Hash.new

  $cell_ref.each do |row|
    row.each_index { |index2| $cell_hash[row[index2]] = SudokuCell.new(row[index2], $board.shift) }
  end

  def assign_cell_values
    $cell_values = []
    $cell_ref.each_index do |i1|
      row = []
      $cell_ref.each_index {|i2| row << $cell_hash[$cell_ref[i1][i2]].value }
      $cell_values << row
    end
  end
  assign_cell_values

  $array_of_keys = $cell_hash.keys

#####################################################################
# Program Iteration Methods

def refresh_board
  system('clear')
  $array_of_keys.each { |key| $cell_hash[key].update }
  display_board
  display_cell_data($cell_hash)
end

def break_on_error(array)
  return false if array.uniq.length != array.length
end

def check_for_break
  assign_cell_values
  error = true

  $cell_values.each do |row|
    p error = break_on_error(row)
  end

  $cell_values.transpose.each do |column|
    p error = break_on_error(column)
  end

  $grid_hash.each do |array|
    p error = break_on_error(array)
  end

  exit if error == false
end

def iterate_cells_check_values
  5.times do
    $array_of_keys.each do |key|
      cell = $cell_hash[key]
      cell.check_grid
      cell.check_column
      cell.check_row
      cell.record_value
      cell.update
    end
    assign_cell_values
    refresh_board
  end
end

def shot_in_the_dark
  $array_of_keys.each do |key|
    cell = $cell_hash[key]
    if cell.possible_values.length >= 1
      $cell_to_check = cell.name
      $values_to_check = cell.possible_values
    end
    found = false
  end

  $cell_hash[$cell_to_check].value = $cell_hash[$cell_to_check].possible_values.sample
  $cell_hash[$cell_to_check].possible_values.clear
  p $cell_to_check
  p $cell_hash[$cell_to_check].value
  gets
  iterate_cells_check_values
  p check_for_break
end

#####################################################################
# Program Operation Commands


# refresh_board
while check_for_break != false do
  iterate_cells_check_values
  shot_in_the_dark
end
