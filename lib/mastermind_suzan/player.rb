module MastermindSuzan
  class Player
    attr_accessor :gamecolor, :level, :start_time, :duration, :guesses
    def initialize(color = nil, level)
      @gamecolor = color
      @level = level
      @start_time = Time.now
      @duration = 0
      @guesses = []
    end
  end
end
