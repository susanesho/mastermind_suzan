require_relative "logic"
# require_relative "game_engine"
require "byebug"

module MastermindSuzan
  class Validation
    include Messages
    attr_accessor :player, :guess

    def initialize(player)
      @player = player
    end

    def collect_guess
      loop do
        @guess = gets.chomp.downcase
        break if check_valid_input?(guess)
        input_error(guess.length)
      end
      guess.split("")
    end

    def input_error(guess_length)
      if guess_length < player.gamecolor.length
        puts short_input
      else
        puts long_input
      end
    end

    def check_replay_input
      player_input = gets.chomp.downcase
      if player_input == "p" || player_input == "play"
        GameEngine.new.start
      else
        exit
      end
    end

    def check_valid_input?(guess)
      history_cheat_view_arr = %w(h c history cheat)
      return true if history_cheat_view_arr.include? guess
      guess.length == player.gamecolor.length
    end
  end
end
