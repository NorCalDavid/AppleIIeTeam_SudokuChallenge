board = [[[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],

         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],

         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]],
         [[nil,nil,nil],  [nil,nil,nil],  [nil,nil,nil]]]

cell_reference = [[["cell00A","cell01A","cell02A"],  ["cell03B","cell04B","cell05B"],  ["cell06C","cell07C","cell08C"]],
                  [["cell10A","cell11A","cell12A"],  ["cell13B","cell14B","cell15B"],  ["cell16C","cell17C","cell18C"]],
                  [["cell20A","cell21A","cell22A"],  ["cell23B","cell24B","cell25B"],  ["cell26C","cell27C","cell28C"]],

                  [["cell30D","cell31D","cell32D"],  ["cell33E","cell34E","cell35E"],  ["cell36F","cell37F","cell38F"]],
                  [["cell40D","cell41D","cell42D"],  ["cell43E","cell44E","cell45E"],  ["cell46F","cell47F","cell48F"]],
                  [["cell50D","cell51D","cell52D"],  ["cell53E","cell54E","cell55E"],  ["cell56F","cell57F","cell58F"]],

                  [["cell60G","cell61G","cell62G"],  ["cell63H","cell64H","cell65H"],  ["cell66I","cell67I","cell68I"]],
                  [["cell70G","cell71G","cell72G"],  ["cell73H","cell74H","cell75H"],  ["cell76I","cell77I","cell78I"]],
                  [["cell80G","cell81G","cell82G"],  ["cell83H","cell84H","cell85H"],  ["cell86I","cell87I","cell88I"]]]

# Grid Location Reference
grid_A = [board[0][0], board[1][0], board[2][0]]
grid_B = [board[0][1], board[1][1], board[2][1]]
grid_C = [board[0][2], board[1][2], board[2][2]]
grid_D = [board[3][0], board[4][0], board[5][0]]
grid_E = [board[3][1], board[4][1], board[5][1]]
grid_F = [board[3][2], board[4][2], board[5][2]]
grid_G = [board[6][0], board[7][0], board[8][0]]
grid_H = [board[6][1], board[7][1], board[8][1]]
grid_I = [board[6][2], board[7][2], board[8][2]]

def grid_buddies(array)
  values = []
  array.each_index { |index| values << array[index].value }
end

