module Chess
  class Knight < Piece
    def initialize(color = nil)
      @color = color
      @type = :knight
      @character = ♘ if @color == :white
      @character = ♞ if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      moves << [x + 2, y + 1]
      moves << [x + 2, y - 1]
      moves << [x - 2, y + 1]
      moves << [x - 2, y - 1]
      moves << [x + 1, y + 2]
      moves << [x + 1, y - 2]
      moves << [x - 1, y + 2]
      moves << [x - 1, y - 2]

      moves
    end
  end
end
