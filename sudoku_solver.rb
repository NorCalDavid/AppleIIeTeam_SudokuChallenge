require_relative 'sudoku_reference_tables'
require_relative 'sudoku_helper_methods'
require 'terminal-table'

class SudokuCell
  attr_reader :name, :grid
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    @grid = determine_grid?
    @value = value
    @possible_values = (1..9).to_a
  end

  private # Private method not available outside class
    def determine_grid? ## Determine the Grid Location Based off of the Cell Name
      "grid_" + name[-1]
    end

  end

  class_instances = []
  test = $cell_reference.flatten
  test.each_index do |index|
    class_instances << SudokuCell.new(test[index], 5)
  end
  rows_of_class_instances = []
  9.times do
    rows_of_class_instances << class_instances.shift(9)
  end
  array_of_values = []
  rows_of_class_instances.each do |row|
    array_of_values << row.map { |cell| cell.value}
  end

  def display_board(array)
    rows = []
    array.each do |element|
      rows << (element)
    end

    table = Terminal::Table.new :rows => rows
    puts table
  end

  display_board(array_of_values)
