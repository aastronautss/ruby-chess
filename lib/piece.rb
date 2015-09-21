module Chess
  # Stores the piece's color, type, and the character to be used when the board
  # is printed.
  class Piece
    attr_accessor :color, :type, :character

    # Can take a custom piece for future variations?
    def initialize(color = nil)
      @color = color
      @type = nil
      @character = nil
    end

    # Returns the piece's type (stored as a symbol) as a capitalized string.
    def name
      return @type.to_s.capitalize
    end

    def possible_moves(move, board)
    end
  end
end
