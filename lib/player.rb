module Chess
  class Player
    attr_accessor :color, :name, :captured_pieces

    def initialize(name, color = nil)
      @name = name
      @color = color
      @captured_pieces = []
    end

    def prompt_move(board)
    end
  end
end
