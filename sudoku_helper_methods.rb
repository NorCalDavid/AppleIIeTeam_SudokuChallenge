require_relative 'sudoku_reference_tables'

def board(string)
  string.split("").map { |value| value == "-" ? nil : value.to_i }
end

def exit_game
  exit
end

def display_menu
  system('clear')
  eb = "Easy Board"
  mb = "Medium Board"
  hb = "Hard Board"
  msg = "Solving Easy Board -"
  msg2 = "Come On, We are in Phase 1!"

  choose do |menu|
    menu.prompt = "Which Sudoku Board Do You Want To Play?  "
    menu.choice(eb) { say(msg + " 1"); $board = board($b_hash["board1"]) }
    menu.choice(eb) { say(msg + " 2"); $board = board($b_hash["board2"]) }
    menu.choice(eb) { say(msg + " 3"); $board = board($b_hash["board3"]) }
    menu.choice(eb) { say(msg + " 4"); $board = board($b_hash["board4"]) }
    menu.choice(eb) { say(msg + " 5"); $board = board($b_hash["board5"]) }
    menu.choice(mb) { say(msg2); $board = board($b_hash["board6"]) }
    menu.choice(mb) { say(msg2); $board = board($b_hash["board7"]) }
    menu.choice(mb) { say(msg2); $board = board($b_hash["board8"]) }
    menu.choice(mb) { say(msg2); $board = board($b_hash["board9"]) }
    menu.choice(mb) { say(msg2); $board = board($b_hash["board10"]) }
    menu.choice(hb) { say(msg2); $board = board($b_hash["board11"]) }
    menu.choice(hb) { say(msg2); $board = board($b_hash["board12"]) }
    menu.choice(hb) { say(msg2); $board = board($b_hash["board13"]) }
    menu.choice(hb) { say(msg2); $board = board($b_hash["board14"]) }
    menu.choice(hb) { say(msg2); $board = board($b_hash["board15"]) }
    menu.choice("Exit program.") { say("Thank You Good Bye!"); exit_game }
  end

end

def display_board
  rows = []
  $cell_values.each do |element|
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
  table2 = Terminal::Table.new :headings => ["Cell Name", "Value", "Possible Values"] * 3, :rows => rows, :style => {:alignment => :center}

  puts table2
end

def grid_values(array)
  values = []
  array.each { |element| values << $cell_hash[element].value }
  values
end

# def array_checker(array)
#   output_array = []
#   array.each do |square|
#     if square.is_a? Fixnum
#       output_array << square
#     end
#   end
#   output_array
# end

# def subtractor(possible_values, array)
#   array.each do |element|
#     possible_values.delete(element) if possible_values.include? element
#   end
#   possible_values
# end
