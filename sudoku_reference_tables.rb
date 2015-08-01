# Cell Names
$cell_reference = [["cell00A","cell01A","cell02A","cell03B","cell04B","cell05B","cell06C","cell07C","cell08C"],
                   ["cell10A","cell11A","cell12A","cell13B","cell14B","cell15B","cell16C","cell17C","cell18C"],
                   ["cell20A","cell21A","cell22A","cell23B","cell24B","cell25B","cell26C","cell27C","cell28C"],

                   ["cell30D","cell31D","cell32D","cell33E","cell34E","cell35E","cell36F","cell37F","cell38F"],
                   ["cell40D","cell41D","cell42D","cell43E","cell44E","cell45E","cell46F","cell47F","cell48F"],
                   ["cell50D","cell51D","cell52D","cell53E","cell54E","cell55E","cell56F","cell57F","cell58F"],

                   ["cell60G","cell61G","cell62G","cell63H","cell64H","cell65H","cell66I","cell67I","cell68I"],
                   ["cell70G","cell71G","cell72G","cell73H","cell74H","cell75H","cell76I","cell77I","cell78I"],
                   ["cell80G","cell81G","cell82G","cell83H","cell84H","cell85H","cell86I","cell87I","cell88I"]]

# Grid Location Reference
  $grid_hash = {
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


$board_1 = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
