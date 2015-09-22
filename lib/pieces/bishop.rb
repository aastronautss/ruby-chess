module Chess
  class Bishop < Piece
    def initialize(color = nil)
      @color = color
      @type = :bishop
      @character = "♗" if @color == :white
      @character = "♝" if @color == :black
    end

    # Returns an array of coordinates corresponding to the Bishop's diagonals.
    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      # Set auxiliary variables
      y_step_up = y
      y_step_dn = y

      # Diagonally to the right of the piece
      (x + 1).upto(grid.length) do |i|
        y_step_up += 1
        moves << [i, y_step_up] unless y_step_up >= grid[0].length
        break unless grid[i][y_step_up].type.nil?
      end

      (x + 1).upto(grid.length) do |i|
        y_step_dn -= 1
        moves << [i, y_step_dn] unless y_step_dn < 0
        break unless grid[i][y_step_dn].type.nil?
      end

      # Reset auxiliary variables
      y_step_up = y
      y_step_dn = y

      # Diagonally to the left of the piece
      (x - 1).downto(grid.length) do |i|
        y_step_up += 1
        moves << [i, y_step_up] unless y_step_up >= grid[0].length
        break unless grid[i][y_step_up].type.nil?
      end

      (x - 1).downto(grid.length) do |i|
        y_step_dn -= 1
        moves << [i, y_step_dn] unless y_step_dn < 0
        break unless grid[i][y_step_dn].type.nil?
      end

      moves
    end
  end
end
