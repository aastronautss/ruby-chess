module Chess
  class Knight < Piece
    def initialize(color = nil)
      @color = color
      @type = :knight
      @character = "♘" if @color == :white
      @character = "♞" if @color == :black
    end

    def possible_moves(move, board)
      moves = []
      grid = board.grid
      x, y = move.from

      possible_coords = [[x + 2, y + 1],
                         [x + 2, y + 1],
                         [x - 2, y + 1],
                         [x - 2, y - 1],
                         [x + 1, y + 2],
                         [x + 1, y - 2],
                         [x - 1, y + 2],
                         [x - 1, y - 2]]

      possible_coords.each do |coords|
        space = piece_at_indices(coords)
        moves << coords unless space.type.nil? || space.color == @color
      end

      moves
    end
  end
end
