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

      possible_moves = [[x + 1, y],
                        [x + 1, y + 1],
                        [x, y + 1],
                        [x - 1, y + 1],
                        [x - 1, y],
                        [x - 1, y - 1],
                        [x, y - 1],
                        [x + 1, y - 1]]

      possible_moves.each do |move|
        moves << move if grid[x][y].type.nil? && !board.space_attacked?(move, color)
      end

      moves
    end
  end
end
