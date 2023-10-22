@player_x_name = ""
@player_o_name = ""
@round = 0
@board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
  [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

@player_x_combination = []
@player_o_combination = []


def check_win
  WIN_COMBINATION.each do |combo|
    if (combo - @player_x_combination).empty?
      puts "Congratulations #{@player_x_name}! You win!"
      exit
    elsif (combo - @player_o_combination).empty?
      puts "Congratulations #{@player_o_name}! You win!"
      exit
    end
  end
  play_round
end

def play_round
  if @round.even? && @round < 9
    puts "#{@player_x_name}, please pick a number to make your mark"
    player_x_input = gets.chomp.to_i
    if player_x_input.between?(0, 8) &&
      !@player_x_combination.include?(player_x_input) &&
      !@player_o_combination.include?(player_x_input)
      @player_x_combination << player_x_input
      @board[player_x_input] = "X"
      @round += 1
      show_board
      check_win
    else 
      puts "Invalid input, please try again"
      play_round
    end
  elsif @round.odd? && @round < 9
    puts "#{@player_o_name}, please pick a number to make your mark"
    player_o_input = gets.chomp.to_i
    if player_o_input.between?(0, 8) &&
      !@player_x_combination.include?(player_o_input) &&
      !@player_o_combination.include?(player_o_input)
      @player_o_combination << player_o_input
      @board[player_o_input] = "O"
      @round += 1
      show_board
      check_win
    else 
      puts "Invalid input, please try again"
      play_round
    end
  else 
    puts "It's a tie!"
    start_game?
  end
end

def show_board
  puts "
  #{@board[0]} | #{@board[1]} | #{@board[2]}\n
  #{@board[3]} | #{@board[4]} | #{@board[5]}\n
  #{@board[6]} | #{@board[7]} | #{@board[8]}
  "
end

def ask_names
  puts "Welcome to Tic Tac Toe!"
  puts "Player X: what is your name?"
  @player_x_name = gets.chomp
  puts "Player O: what is your name?"
  @player_o_name = gets.chomp
  puts "Welcome #{@player_x_name} and #{@player_o_name}!"
  show_board
  play_round
end

def start_game?
  puts "Would you like to start a game of Tic Tac Toe? [y/n]"
  answer = gets.chomp.downcase
  if answer == "y"
    ask_names
  elsif answer == "n"
    puts "Goodbye!"
  else
    puts "Please enter y or n"
    start_game?
  end
end

start_game?