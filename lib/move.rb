module Chess
  class Move
    attr_accessor @move, @from, @to, @message

    def initialize(board, player, opponent)
      @message = nil

      loop do
        puts @message unless @message.nil?
        @move = player.prompt_move(board)
        @from, @to = Board.parse_coords(@move[0]), Board.parse_coords(@move[1])
        break if valid?
      end

    def valid?
      return false if correct_format?
    end

    private

    def correct_format?
      unless @move.length == 2 && @move.all? { |s| s =~ /[A-H][1-8]/ }
        @message = "Invalid format."
        return false
      end
      true
    end
  end
end
