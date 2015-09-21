module Chess
  # Stores the player's color, name, a list of captured pieces, and his king
  # for ease of deciding checks and mates.
  class Player
    attr_accessor :color, :name, :captured_pieces, :king

    def initialize(name, color = nil)
      @name = name
      @color = color
      @captured_pieces = []
      @turn_count = 0
    end

    def prompt_move(board)
    end
  end
end
