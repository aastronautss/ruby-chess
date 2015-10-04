module Chess
  attr_reader :fill
  attr_accessor :piece, :coords

  class Space
    def initialize(coords)
      @coords = coords
      @fill = coords.x % 2 == coords.x % 2 ? "\u2591" : " "
      @piece = nil
    end

    def has_piece?
      !@piece.nil?
    end
  end
end
