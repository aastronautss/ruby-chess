module Chess
  class Pawn < Piece
    def initialize(color = nil)
      @color = color
      @type = :pawn
      @character = ♙ if @color == :white
      @character = ♟ if @color == :black
    end

    def possible_moves(move, board)
      x, y = move.from
      coords = move.move[0]
      moves = []

      case @color
      when :white
        left_diag = [x - 1, y + 1]
        left_diag_piece = board.piece_at_indices(left_diag)
        right_diag = [x + 1, y + 1]
        right_diag_piece = board.piece_at_indices(right_diag)

        moves << [x, y + 1]
        moves << [x, y + 2] if y == 1
        moves << left_diag if left_diag_piece.color == :black
        moves << right_diag if right_diag_piece.color == :black
      when :black
        left_diag = [x - 1, y - 1]
        left_diag_piece = board.piece_at_indices(left_diag)
        right_diag = [x + 1, y - 1]
        right_diag_piece = board.piece_at_indices(right_diag)

        moves << [x, y - 1]
        moves << [x, y - 2] if y == 6
        moves << left_diag if left_diag_piece.color == :black
        moves << right_diag if right_diag_piece.color == :black
      else
      end

      moves
    end
  end
end
