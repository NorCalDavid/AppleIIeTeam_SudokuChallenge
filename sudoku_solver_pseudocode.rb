# Input: String of numbers and underscores representing sudoku board.n (incomplete board)
# Output: String of numbers complete with no underscores. (filled board)

# RCG - Row, Column, Grid

#   Steps:

# Initial Pass
# P-Code:
#   0. Create Classes: Cell, (Board, Row, Column, Grid)
#   1. Populate 3D array with the input String
#   2. Have each cell check its RCG in order
#   3. Have cell eliminate any numbers in its RCG
#   4. The remaining numbers are the cells list of possible values
#   5. If there is only one possible value, record the value.
#   6. Move on to the next cell.


# User Stories:
#   1. Cell check row for all values in row
#   2. Cell check column for all values in column
#   3. Cell check grid for all values in grid
#   4. Cell collect its possible remaining values (eliminate any values checked from US 1-3)

