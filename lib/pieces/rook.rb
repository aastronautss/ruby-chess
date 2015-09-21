module Chess
  class Rook < Piece
    def initialize(color = nil)
      @color = color
      @type = :rook
      @character = ♖ if @color == :white
      @character = ♜ if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      (x + 1).upto(grid.length) { |i| moves << [i, y] }
      (x - 1).downto(0) { |i| moves << [i, y] }
      (y + 1).upto(grid[0].length) { |i| moves << [x, i] }
      (y - 1).downto(0) { |i| moves << [x, i] }

      moves
    end
  end
end
