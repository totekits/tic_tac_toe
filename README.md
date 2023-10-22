# Tic Tac Toe
This [exercise](https://www.theodinproject.com/lessons/ruby-tic-tac-toe) is from the Odin Project's Ruby curriculum.
## Assignment
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.
# Tic Tac Toe
This [exercise](https://www.theodinproject.com/lessons/ruby-tic-tac-toe) is from the Odin Project's Ruby curriculum.
## Assignment
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.
## Steps
1. Create class TicTacToe to contain all the code
2. Assign constant WIN_COMBO an array of arrays of win combos
3. Define #initilize with instance variables:
   - @board = an array of 0-8
   - @players = a hash of k-v pairs: playerX-name and playerO-name
   - @round = 0 to count rounds
   - @picked = [] to store picked numbers
5. define #play to run the game with private methods:
   - #set_player_names
   - #display_board
   - #play_round until #game_over?
   - #end_game
7. Defined all the private methods and additional methods: #valid_move? and #make_move
