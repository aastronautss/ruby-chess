module Chess
  class HumanPlayer < Player
    def prompt_move(board)
      print "#{@name}'s move: "
      gets.chomp.split.upcase
    end
  end
end
