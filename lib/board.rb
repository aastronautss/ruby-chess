module Chess
  class Board
    attr_accessor :grid, :white_player, :black_player

    def initialize(grid = Array.new(8, Array.new(8, Piece.new)))
      @grid = grid
      set_board
      randomize_players(prompt_players)
    end

    def play
      puts "#{@white_player.name} plays white."
      puts "#{@black_player.name} plays black."
      winner = nil
      current_player = @white_player
      next_player = @black_player
      move_history = []

      while winner.nil?
        display_board
        move_history << Move.new(self, current_player, next_player)
        winner = checkmate
        current_player, next_player = next_player, current_player
      end

      display_board
      puts "#{winner} wins!"
    end

    def set_board
    end

    def display_board
    end

    def checkmate
    end

    private

    def prompt_players
      players = []
      puts "PLAYER 1: What is your name?"
      players << HumanPlayer.new(gets.chomp)
      puts "PLAYER 2: What is your name?"
      players << HumanPlayer.new(gets.chomp)
    end

    def randomize_players(players)
      players.shuffle!
      @white_player = players.pop
      @white_player.color = :white
      @black_player = players.pop
      @black_player.color = :black
    end
  end
end
