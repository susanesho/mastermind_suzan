require_relative "logic"
require_relative "game_engine"

module MastermindSuzan
  class Validation
    include Messages
    attr_accessor :player

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
      if guess_length < player.gamecolor.length
        puts short_input
      else
        puts long_input
      end
    end

    def check_replay_input
      loop do
        player_input = gets.chomp.downcase
        if player_input == "p" || player_input == "play"
          GameEngine.new.start
        elsif player_input == "q" || player_input == "quit"
          exit
        else
          puts valid_input
        end
      end
    end

    def check_valid_input?(guess)
      history_cheat_view_arr = %w(h c history cheat)
      return true if history_cheat_view_arr.include? guess
      guess.length == player.gamecolor.length
    end

    def replay_game
      puts play_again
      check_replay_input
    end
  end
end
