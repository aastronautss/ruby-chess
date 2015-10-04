module Chess
  # Main class for Chess module. Keeps track of all positions, and controls
  # whose turn it is.
  class Board
    attr_accessor :spaces, :white_player, :black_player, :white_king, :black_king

    # Creates a grid which, by default, is full of empty pieces and calls
    # set_board to fill it up with the standard positions. Prompts the players
    # and decides who plays black and who plays white.
    def initialize()
      @spaces = Array.new(64).map.with_index do |col, i|
        Space.new(index_to_coords(i))
      end

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
      space = @spaces.find { |space| space.coords == coords }
      space.piece
    end

    def space_at(coords)
      @spaces[coords_to_index(coords)]
    end

    # Returns true if the given space (can be indices or coords) is attacked by
    # any pieces of the color opposite the given color.
    def space_attacked?(coords, color_of_defender)
      x = coords.x
      y = coords.y

      color_of_attacker = opposite_color(color_of_defender)
      spaces_attacked_by(color_of_attacker).include?(indices)
    end

    def pieces_in_play(color)
      @spaces.select { |space| space.piece }
    end

    def spaces_attacked_by(color)
      attacking_pieces = pieces_in_play(color)
      attacking_pieces.map { |piece| piece.possible_moves }
    end

    def king_in_check?(color)

    end

    private

    def index_to_coords(index)
      x = index % 8
      y = index / 8 / 1 # SublimeText thinks this is a regex. Silly SublimeText.
      Coords.new(x, y)
    end

    def coords_to_index(coords)
      coords.y * 8 + coords.x
    end

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
