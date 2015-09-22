module Chess
  class Pawn < Piece
    def initialize(color = nil)
      @color = color
      @type = :pawn
      @character = "\u2659" if @color == :white
      @character = "\u265F" if @color == :black
    end

    def possible_moves(move, board)
      x, y = move.from
      coords = move.move[0]
      moves = []

      one_space_forward = @color == :white ? [x, y + 1] : [x, y - 1]
      two_spaces_forward = @color == :white ? [x, y + 2] : [x, y - 2]
      diags = @color == :white ? [[x - 1, y + 1], [x + 1, y + 1]] : [[x - 1, y - 1], [x + 1, y - 1]]

      # Forward advance
      if board.piece_at_indices(one_space_forward).empty?
        moves << one_space_forward
        if board.piece_at_indices(two_spaces_forward).empty? && starting_position?(y)
          moves << two_spaces_forward
        end
      end

      diags.each do |diag|
        space = board.piece_at_indices(diag)
        moves << diag if space.color == opposite_color
      end

      moves
    end

    def starting_position?(y)
      @color == :white ? y == 1 : y == 6
    end
  end
end
