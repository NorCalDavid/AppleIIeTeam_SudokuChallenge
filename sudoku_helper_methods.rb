# require_relative 'sudoku_solver'
require_relative 'sudoku_reference_tables'

def possibilities_subtractor(possible_values, array)
  array.each do |element|
    if possible_values.include? element
      possible_values.delete(element)
    end
  end
  possible_values
end

def row_checker(cell, row)
  array = []
  row.each do |square|
    if square.is_a? Fixnum
      array << square
    end
  end
  array
end

# def array_of_values
  # class_instances = []
  # test = $cell_reference.flatten
  # test.each_index do |index|
  #   class_instances << SudokuCell.new(test[index], nil)
  # end
  # rows_of_class_instances = []
  # 9.times do
  #   rows_of_class_instances << class_instances.shift(9)
  # end
  # array_of_values = class_instances.each do |row|
  #   row.map { |cell| cell.value}
  # end
  # return array_of_values
# end

### DRIVER CODE

# p rows_of_class_instances

# $board = [[[1,'-',5],[8,'-',2],[2,'-','-']],
# [['-',9,'-'],['-',7,6],[4,'-',5]],
# [[2,'-','-'],[4,'-','-'],[8,1,9]],
# [['-',1,9],['-','-',7],[3,'-',6]],
# [[7,6,2],['-',8,3],['-',9,'-']],
# [['-','-','-'],['-',6,1],['-',5,'-']],
# [['-','-',7],[6,'-','-'],['-',3,'-']],
# [[4,3,'-'],['-',2,'-'],[5,'-',1]],
# [[6,'-','-'],[3,'-',8],[9,'-','-']]]

# $flat_board = $board.map { |row| row.flatten }
# $sideways_board = $flat_board.transpose

# row1 = row_checker($flat_board[0][3], $flat_board[0])
# col5 = row_checker($sideways_board[4][3], $sideways_board[4])
# p possibilities_subtractor((1..9).to_a, row1)
# p possibilities_subtractor((1..9).to_a, col5)
