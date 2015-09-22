module Chess
  class Queen < Piece
    def initialize(color = nil)
      @color = color
      @type = :queen
      @character = "♕" if @color == :white
      @character = "♛" if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      # VERTICALS / HORIZONTALS
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

      # DIAGONALS
      # Set auxiliary variables
      y_step_up = y
      y_step_dn = y

      # Diagonally to the right of the piece
      (x + 1).upto(grid.length) do |i|
        break if grid[i][y_step_up].color == @color
        y_step_up += 1
        moves << [i, y_step_up] unless y_step_up >= grid[0].length
      end

      (x + 1).upto(grid.length) do |i|
        break if grid[i][y_step_dn].color == @color
        y_step_dn -= 1
        moves << [i, y_step_dn] unless y_step_dn < 0
      end

      # Reset auxiliary variables
      y_step_up = y
      y_step_dn = y

      # Diagonally to the left of the piece
      (x - 1).downto(grid.length) do |i|
        break if grid[i][y_step_up].color == @color
        y_step_up += 1
        moves << [i, y_step_up] unless y_step_up >= grid[0].length
      end

      (x - 1).downto(grid.length) do |i|
        break if grid[i][y_step_dn].color == @color
        y_step_dn -= 1
        moves << [i, y_step_dn] unless y_step_dn < 0
      end

      moves
    end
  end
end
