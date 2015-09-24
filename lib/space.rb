module Chess
  attr_reader :color
  attr_accessor :piece, :coords

  class Space
    def initialize(coords)
      @coords = coords
      @color = coords[0] % 2 == coords[0] % 2 ? "\u2591" : " "
      @piece = nil
    end

    def has_piece?
      !@piece.nil?
    end
  end
end
