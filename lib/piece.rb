module Chess
  class Piece
    attr_accessor :color, :type, :symbol

    def initialize(color = nil, type = nil, symbol = nil)
      @color = color
      @type = type
      @symbol = symbol
    end
  end
end
