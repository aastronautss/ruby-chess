module Chess
  # Main class for Chess module. Keeps track of all positions, and controls
  # whose turn it is.
  class Board
    attr_accessor :grid, :white_player, :black_player

    # Creates a grid which, by default, is full of empty pieces and calls
    # set_board to fill it up with the standard positions. Prompts the players
    # and decides who plays black and who plays white.
    def initialize(grid = Array.new(8, Array.new(8, Piece.new)))
      @grid = grid
      set_board
      randomize_players(prompt_players)
    end

    # Announces who is playing what color, and alternates turns until someone
    # wins. Returns the name of the winner.
    def play
      puts "#{@white_player.name} plays white."
      puts "#{@black_player.name} plays black."
      winner = nil
      current_player = @white_player
      next_player = @black_player
      move_history = []

      while winner.nil?
        display_board
        move_history << Move.new(self, current_player, next_player)
        winner = checkmate
        current_player, next_player = next_player, current_player
      end

      display_board
      "#{winner} wins!"
    end

    # Sets up board with new Piece objects.
    def set_board
    end

    # Prints the board to the console, as well as the players' captured pieces.
    def display_board
    end

    # Returns true if the board is in the position of a checkmate.
    def checkmate
    end

    # Returns the piece at the coordinate, given as a string. E.g. "C5"
    def piece_at(coords)
      x, y = self.parse_coords(coords)
      @grid[x][y]
    end

    def piece_at_indices(indices)
      @grid[indices[0]][indices[1]]
    end

    # Returns the array indices corresponding to the coordinate (given by e.g.
    # "E4")
    def self.parse_coords(coords)
      ary = coords.split("")
      ary[0] = ary[0].ord - 65
      ary[1] = ary[1] - 1
      ary
    end

    private

    # For initialization: returns an array of all the players in the game.
    # TODO: Ask for human or computer once AI is implemented.
    def prompt_players
      players = []
      puts "PLAYER 1: What is your name?"
      players << HumanPlayer.new(gets.chomp)
      puts "PLAYER 2: What is your name?"
      players << HumanPlayer.new(gets.chomp)
    end

    # Takes an array full of players and shuffles them into the black and white
    # positions.
    def randomize_players(players)
      players.shuffle!
      @white_player = players.pop
      @white_player.color = :white
      @black_player = players.pop
      @black_player.color = :black
    end
  end
end
