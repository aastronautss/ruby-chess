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
        raise "Invalid coordinate format: \"#{str}\" !"
      end
    end
  end
end
