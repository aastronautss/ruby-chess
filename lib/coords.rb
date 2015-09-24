module Chess
  class Coords
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def increment_x(n = 1)
      Coords.new(x + n, y)
    end

    def increment_y(n = 1)
      Coords.new(x, y + n)
    end

    def shared_column?(other)
      self.x == other.x
    end

    def shared_row?(other)
      self.y == other.y
    end
  end
end
