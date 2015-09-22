module Chess
  # Main class for Chess module. Keeps track of all positions, and controls
  # whose turn it is.
  class Board
    attr_accessor :grid, :white_player, :black_player, :white_king, :black_king

    # Creates a grid which, by default, is full of empty pieces and calls
    # set_board to fill it up with the standard positions. Prompts the players
    # and decides who plays black and who plays white.
    def initialize(grid = Array.new(8, Array.new(8, Piece.new)))
      @grid = grid
      set_board
      puts "Welcome to chess!"
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
      # Fill blank space between starting rows.
      2.upto(5) do |row|
        0.upto(7) { |col| @grid[col][row] = Piece.new }
      end

      # White pawn row
      0.upto(7) { |col| @grid[col][1] = Pawn.new(:white) }

      # Black pawn row
      0.upto(7) { |col| @grid[col][6] = Pawn.new(:black) }

      # White back row
      @grid[0][0] = Rook.new(:white)
      @grid[0][1] = Knight.new(:white)
      @grid[0][2] = Bishop.new(:white)
      @grid[0][3] = Queen.new(:white)
      @grid[0][5] = Bishop.new(:white)
      @grid[0][6] = Knight.new(:white)
      @grid[0][7] = Rook.new(:white)

      # Black back row
      @grid[7][0] = Rook.new(:black)
      @grid[7][1] = Knight.new(:black)
      @grid[7][2] = Bishop.new(:black)
      @grid[7][3] = Queen.new(:black)
      @grid[7][5] = Bishop.new(:black)
      @grid[7][6] = Knight.new(:black)
      @grid[7][7] = Rook.new(:black)

      # Setup kings
      @white_king = King.new(:white)
      @grid[0][4] = @white_king

      @black_king = King.new(:black)
      @grid[7][4] = @black_king
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

    # Returns the piece at the given indices (in array format)
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

    # Returns true if the given space (can be indices or coords) is attacked by
    # any pieces of the color opposite the given color.
    def space_attacked?(indices, color_of_defender)
      indices = (indices.is_a?(String) ? Board.parse_coords(indices) : indices)
      x = indices[0]
      y = indices[1]

      color_of_attacker = (color_of_defender == :black ? :White : :black)
      spaces_attacked_by(color_of_attacker).include?(indices)
    end

    def pieces_in_play(color)
      pieces = []

      # TODO: change this to use Array#select function.
      @grid.each do |col|
        @grid[col].each do |row|
          piece = @grid[col][row]
          pieces << piece if piece.color == color
        end
      end
    end

    def spaces_attacked_by(color)
      attacking_pieces = pieces_in_play(color)
      attacking_pieces.map { |piece| piece.possible_moves }
    end

    def king_in_check?(color)

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

    def opposite_color(color)
      color == :white ? :black : :white
    end
  end
end
