module Chess
  class Board
    def initialize
      @length = 8
      @width = 8
      @number_of_spaces = @length * @width

      @spaces = Array.new(@number_of_spaces, Space.new)
    end


  end
end
