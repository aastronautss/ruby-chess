module Chess
  class Player
    attr_accessor :color, :name

    def initialize(name, color = nil)
      @name = name
      @color = color
    end
  end
end
