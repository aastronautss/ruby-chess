module Chess
  class Board
    attr_accessor :grid, :white_player, :black_player

    def initialize(grid = Array.new(8, Array.new(8, Piece.new)))
      @grid = grid
      randomize_players(prompt_players)
    end


    private

    def prompt_players
      players = []
      puts "PLAYER 1: What is your name?"
      players << Player.new(gets.chomp)
      puts "PLAYER 2: What is your name?"
      players << Player.new(gets.chomp)
    end

    def randomize_players(players)
      players.shuffle!
      @white_player = players.pop
      @white_player.color = :white
      @black_player = players.pop
      @black_playerj.color = :black
    end
  end
end
