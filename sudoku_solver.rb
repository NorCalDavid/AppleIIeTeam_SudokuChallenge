require_relative 'sudoku_reference_tables'

class SudokuCell
  attr_reader :name, :grid
  attr_accessor :value, :possible_values

  def initialize(name, value)
    @name = name
    #@grid = determine_grid?
    @value = value
    @possible_values = (1..9).to_a
  end

  private # Private method not available outside class
  def determine_grid? ## Determine the Grid Location Based off of the Cell Name
   #self.name[-1] << "grid_"
  end

end

######################################################

