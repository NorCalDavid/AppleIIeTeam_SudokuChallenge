#board = Array.new(3) { Array.new(3, "-")}

$board = [[[1,'-',5],[8,'-',2],[2,'-','-']],
[['-',9,'-'],['-',7,6],[4,'-',5]],
[[2,'-','-'],[4,'-','-'],[8,1,9]],
[['-',1,9],['-','-',7],[3,'-',6]],
[[7,6,2],['-',8,3],['-',9,'-']],
[['-','-','-'],['-',6,1],['-',5,'-']],
[['-','-',7],[6,'-','-'],['-',3,'-']],
[[4,3,'-'],['-',2,'-'],[5,'-',1]],
[[6,'-','-'],[3,'-',8],[9,'-','-']]]

$flat_board = $board.map { |row| row.flatten }
$sideways_board = $flat_board.transpose


grid00 = ["board[0][0]", "board[0][1]", "board[0][2]"]
grid01 = ["board[1][0]", "board[1][1]", "board[1][2]"]
grid02 = ["board[2][0]", "board[2][1]", "board[2][2]"]
grid02 = ["board[3][0]", "board[3][1]", "board[3][2]"]
grid02 = ["board[4][0]", "board[4][1]", "board[4][2]"]
grid02 = ["board[5][0]", "board[5][1]", "board[5][2]"]
grid02 = ["board[6][0]", "board[6][1]", "board[6][2]"]
grid02 = ["board[7][0]", "board[7][1]", "board[7][2]"]
grid02 = ["board[8][0]", "board[8][1]", "board[8][2]"]


def possibilities_subtractor(possible_values, array)
  array.each do |element|
    if possible_values.include? element
      possible_values.delete(element)
    end
  end
  possible_values
end

def row_checker(cell, row)fffffffggg
  array = []
  row.each do |square|
    if square.is_a? Fixnum
      array << square
    end
  end
  array
end

row1 = row_checker($flat_board[0][3], $flat_board[0])
col5 = row_checker($sideways_board[4][3], $sideways_board[4])
p possibilities_subtractor((1..9).to_a, row1)
p possibilities_subtractor((1..9).to_a, col5)


# class Cell

