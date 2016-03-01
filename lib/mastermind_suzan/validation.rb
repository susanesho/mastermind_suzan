require_relative 'logic'
require_relative 'game_engine'

module MastermindSuzan
  module Validation
    include Messages

    def collect_guess(player)
      @player = player
      loop do
        @guess = gets.chomp.downcase
        break if check_valid_input?(@guess)
        input_error(@guess.length)
      end
      @guess.split("")
    end

    def input_error(guess_length)
      if guess_length < @player.gamecolor.length
        puts short_input
      else
        puts long_input
      end
    end

    def check_replay_input
      loop do
        player_input = gets.chomp.downcase
        if player_input == 'p' || player_input == 'play'
          GameEngine.new.start
        elsif player_input == 'q' || player_input == 'quit'
          exit
        else
          puts valid_input
        end
      end
    end

    def check_valid_input?(guess)
      command = %w(h c history cheat)
      return true if command.include? guess
      guess.length == @player.gamecolor.length
    end
  end
end
