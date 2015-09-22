module Chess
  class Rook < Piece
    def initialize(color = nil)
      @color = color
      @type = :rook
      @character = "♖" if @color == :white
      @character = "♜" if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      (x + 1).upto(grid.length) do |i|
        moves << [i, y]
        break unless grid[i][y].type.nil?
      end
      (x - 1).downto(0) do |i|
        moves << [i, y]
        break unless grid[i][y].type.nil?
      end
      (y + 1).upto(grid[0].length) do |i|
        moves << [x, i]
        break unless grid[x][i].type.nil?
      end
      (y - 1).downto(0) do |i|
        moves << [x, i]
        break unless grid[x][i].type.nil?
      end

      moves
    end
  end
end
