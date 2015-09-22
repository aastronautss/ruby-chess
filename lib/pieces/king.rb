module Chess
  class King < Piece
    def initialize(color = nil)
      @color = color
      @type = :king
      @character = "♔" if @color == :white
      @character = "♚" if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      moves << [x + 1, y]
      moves << [x + 1, y + 1]
      moves << [x, y + 1]
      moves << [x - 1, y + 1]
      moves << [x - 1, y]
      moves << [x - 1, y - 1]
      moves << [x, y - 1]
      moves << [x + 1, y - 1]

      moves
    end
  end
end
