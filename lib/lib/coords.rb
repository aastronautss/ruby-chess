module Chess
  class Coords
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def self.parse_notation(str)
      str.upcase!
      if str =~ /[A-F][1-8]/
        return Coords.new(a[0].ord - 65, a[1].to_i)
      else
        raise "Invalid space format: \"#{str}\" !"
      end
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
