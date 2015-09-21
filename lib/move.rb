module Chess
  # Stores the coordinates of a move, the person making the move and his/her
  # opponent, as well as the array-index translation of the move.
  class Move
    attr_accessor :player, :opponent, :move, :from, :to, :message

    # Prompts the player for a move and only stores it if the move is valid.
    # Executes the move if it is valid. If the player plays an invalid move,
    # it displays a message stored by Move#valid? class.
    def initialize(board, player, opponent)
      @message = nil
      @player = player
      @opponent = opponent

      loop do
        puts @message unless @message.nil?
        @move = player.prompt_move(board)
        @from, @to = Board.parse_coords(@move[0]), Board.parse_coords(@move[1])
        break if valid?
      end

      execute(board)
    end

    # Returns true if it is valid. If it is invalid, the helper messages store
    # a message to be displayed by the prompter.
    def valid?
      return false unless correct_format?
      return false unless correct_owner?(board)
      return false unless space_open?(board)
      return false unless valid_move_for_piece?(board)
      return false if king_is_checked?(board)
      @message = nil
      true
    end

    private

    def execute(board)
    end

    # Returns true if the application can read the format of the move given
    # by the player. It should be an array with the "from" as index 0 and "to"
    # as index 1, and have the standard chessboard coordinates, e.g. "A2".
    def correct_format?
      unless @move.length == 2 && @move.all? { |s| s =~ /[A-H][1-8]/ }
        @message = "Invalid format!"
        return false
      end
      true
    end

    def correct_owner?(board)
      moving_piece = board.piece_at(@move[0])

      unless moving_piece.color == player.color
        if moving_piece.color == opponent.color
          @message = "You can't move your opponent's pieces!"
        else
          @message = "There is no piece there!"
        end
        return false
      end
      true
    end

    # Returns true if the "to" space is either blank, an opponent's piece, or
    # not a king (which shouldn't happen either way but we'll make sure it
    # doesn't happen here).
    def space_open?(board)
      destination_piece = board.piece_at(@move[1])

      unless destination_piece.type.nil? || destination_piece.color == @opponent.color || destination_piece.type = :king
        @message = "You can't capture your own piece!"
        return false
      end
      true
    end

    # Returns true if the specific type of piece can move the way the player
    # is requesting (e.g. a bishop is only moving diagonally). It does this by
    # asking the piece for an array of all the possible indices from the "from"
    # space.
    def valid_move_for_piece?(board)
      moving_piece = board.piece_at(@move[1])
      unless moving_piece.possible_moves(self, board).include?(@to)
        @message = "A #{moving_piece.name} can't move that way!"
        return false
      end
      true
    end

    # Returns true if the player's king is checked.
    def king_is_checked?(board)
    end
  end
end
