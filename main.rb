class TicTacToe
  WIN_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @players = { "X": "", "O": ""}
    @round = 0
    @picked = []
  end
  
  def play
    puts "Welcome to Tic Tac Toe!"
    set_player_names
    display_board
    play_round until game_over?
    end_game
  end
  
  private

  def set_player_names
    ["X", "O"].each do |player|
      puts "Player #{player}, what's your name?"
      @players[player] = gets.chomp
    end
    puts "Welcome, #{@players["X"]} and #{@players["O"]}!"
  end

  def display_board
    puts "
      #{@board[0]} | #{@board[1]} | #{@board[2]}\n
      #{@board[3]} | #{@board[4]} | #{@board[5]}\n
      #{@board[6]} | #{@board[7]} | #{@board[8]}
      "
  end

  def valid_move?(move)
    move.between?(0, 8) && !@picked.include?(move)
  end

  def make_move(player)
    puts "#{@players[player]}, please pick a number to make your mark"
    move = gets.chomp.to_i
    if valid_move?(move)
      @board[move] = player
      @round += 1
      @picked << move
      display_board
    else
      puts "Please enter a valid number"
      make_move(player)
    end
  end

  def play_round
    player = @round.even? ? "X" : "O"
    make_move(player)
  end

  def game_over?
    @round == 9 || WIN_COMBO.any? { |combo|
      combo.all? { |cell|
        @board[cell] == "X" } || 
      combo.all? { |cell|
        @board[cell] == "O" }
    }
  end

  def end_game
    if @round == 9
      puts "It's a tie!"
    elsif WIN_COMBO.any? { |combo| combo.all? { |cell| @board[cell] == "X" } }
      puts "Congratulations, #{@players["X"]}! You win!"
    elsif WIN_COMBO.any? { |combo| combo.all? { |cell| @board[cell] == "O" } }
      puts "Congratulations, #{@players["O"]}! You win!"
    end
  end
end

TicTacToe.new.play