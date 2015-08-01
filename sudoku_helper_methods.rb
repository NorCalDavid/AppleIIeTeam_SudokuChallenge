require_relative 'sudoku_reference_tables'

def board(string)
  string.split("").map { |value| value == "-" ? nil : value }
end

def exit_game
  exit
end

def display_menu
  system('clear')
  choose do |menu|
    menu.prompt = "Which Sudoku Board Do You Want To Play?  "
    menu.choice(" Easy Board") { say("Solving Easy Board - 1"); $board = board($b_hash["board1"]) }
    menu.choice(" Easy Board") { say("Solving Easy Board - 2"); $board = board($b_hash["board2"]) }
    menu.choice(" Easy Board") { say("Solving Easy Board - 3"); $board = board($b_hash["board3"]) }
    menu.choice(" Easy Board") { say("Solving Easy Board - 4"); $board = board($b_hash["board4"]) }
    menu.choice(" Easy Board") { say("Solving Easy Board - 5"); $board = board($b_hash["board5"]) }
    menu.choice(" Medium Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board6"]) }
    menu.choice(" Medium Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board7"]) }
    menu.choice(" Medium Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board8"]) }
    menu.choice(" Medium Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board9"]) }
    menu.choice("Medium Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board10"]) }
    menu.choice("Hard Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board11"]) }
    menu.choice("Hard Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board12"]) }
    menu.choice("Hard Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board13"]) }
    menu.choice("Hard Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board14"]) }
    menu.choice("Hard Board") { say("Come On, We are in Phase 1!"); $board = board($b_hash["board15"]) }
    menu.choice("Exit program.") { say("Thank You Good Bye!"); exit_game }
  end

end

def display_board(array)
  rows = []
  array.each do |element|
    rows << (element)
  end

  table = Terminal::Table.new
  table.title = "Sudoku Game Board"
  table.rows = rows
  table.style = {:alignment => :center}

  puts table
end

def display_cell_data(hash)
  rows = []
  sub_rows = []
  counter = 1
  hash.each_key do |key|
    sub_rows << [$cell_hash[key].name, $cell_hash[key].value, $cell_hash[key].possible_values.join(" ")]
    if counter % 3 == 0
      rows.push(sub_rows.flatten)
      sub_rows = []
    end
    counter += 1
  end
  table2 = Terminal::Table.new :headings => ["Cell Name", "Value", "Possible Values", "Cell Name", "Value", "Possible Values", "Cell Name", "Value", "Possible Values"], :rows => rows, :style => {:alignment => :center}
end

def grid_values(array)
  values = []
  array.each { |element| values << $cell_hash[cell].value }
  values
end

def array_checker(array)
  output_array = []
  array.each do |square|
    if square.is_a? Fixnum
      output_array << square
    end
  end
  output_array
end

def possibilities_subtractor(possible_values, array)
  array.each do |element|
    possible_values.delete(element) if possible_values.include? element
  end
  possible_values
end
