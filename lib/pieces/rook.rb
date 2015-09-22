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
        break if grid[i][y].color == @color
        moves << [i, y]
      end
      (x - 1).downto(0) do |i|
        break if grid[i][y].color == @color
        moves << [i, y]
      end
      (y + 1).upto(grid[0].length) do |i|
        break if grid[x][i].color == @color
        moves << [x, i]
      end
      (y - 1).downto(0) do |i|
        break if grid[x][i].color == @color
        moves << [x, i]
      end

      moves
    end
  end
end
