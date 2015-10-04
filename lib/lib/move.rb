module Chess
  # Stores the coordinates of a move, the person making the move and his/her
  # opponent, as well as the array-index translation of the move.
  class Move
    attr_accessor :player, :opponent, :from, :to

    # Prompts the player for a move and only stores it if the move is valid.
    # Executes the move if it is valid. If the player plays an invalid move,
    # it displays a message stored by Move#valid? class.
    def initialize(board, player, opponent)
      @message = nil
      @player = player
      @opponent = opponent

      begin
        @from, @to = parse_input(player.prompt_move(board))
      rescue Exception => message
        puts "#{message} Try again!"
      end

      begin
        execute(board)
      rescue Exception => message
        puts "#{message} Try again!"
      end
    end

    private

    def parse_input(spaces)
      if spaces.length == 2
        from = Coords.parse_notation(spaces[0])
        to = Coords.parse_notation(spaces[1])
        [from, to]
      else
        raise "Invalid format: \"#{spaces}\" !"
      end
    end

    def execute(board)
      space_from = board.space_at(@from)
      space_to = board.space_at(@to)
      moving_piece = space_from.piece

      if moving_piece && valid_move_for_piece?(board, moving_piece)
        space_from.piece = nil
        space_to.piece = moving_piece
      else
        raise generate_exception(board, moving_piece)
      end
    end

    def generate_exception(board, moving_piece)
      case
      when !moving_piece
        return "There is no piece there!"
      when moving_piece.color != player.color
        return "You can't move your opponent's pieces!"
      when moving_piece.color == board.piece_at(@to).color
        return "You can't capture your own piece!"
      else
        return "Illegal move!"
      end
    end

    # Returns true if the specific type of piece can move the way the player
    # is requesting (e.g. a bishop is only moving diagonally). It does this by
    # asking the piece for an array of all the possible indices from the "from"
    # space.
    def valid_move_for_piece?(board, moving_piece)
      moving_piece.possible_moves(self, board).include?(@to)
    end
  end
end
