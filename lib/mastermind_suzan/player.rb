module MastermindSuzan
  class Player
    attr_accessor :gamecolor, :level, :start_time, :duration, :guesses
    def initialize(level)
      @gamecolor = ""
      @level = level
      @start_time = Time.now
      @duration = 0
      @guesses = []
    end
  end
end
