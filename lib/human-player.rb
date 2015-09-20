module Chess
  # Includes all the prompts for a human player.
  class HumanPlayer < Player
    # Asks the player for a move (to be entered in the console). The move
    # should be in the format <from to>, e.g. "E2 E4". Returns an array with
    # from as index 0, and to as index 1.
    def prompt_move(board)
      print "#{@name}'s move: "
      gets.chomp.split.upcase
    end
  end
end
