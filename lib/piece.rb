module Chess
  class Piece
    attr_reader :color, :type

    def initialize(color = nil, type = nil)
      @color = color
      @type = type
    end
  end
end
