module Chess
  class HumanPlayer < Player
    def prompt_move
      print "#{@name}'s move: "
      gets.chomp.split
    end
  end
end
