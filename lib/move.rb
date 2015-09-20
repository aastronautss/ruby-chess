module Chess
  class Move
    def initialize(board, player, opponent)
      while !valid?
        @move = player.prompt_move
      end
    end

    def valid?
      return false if @move.length == 2
      return false if correct_format?
    end

    private

    def correct_format?

    end
  end
end
