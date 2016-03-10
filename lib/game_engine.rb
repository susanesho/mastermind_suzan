require "mastermind_suzan/messages"
require "mastermind_suzan/logic"
require "mastermind_suzan/player"
require "mastermind_suzan/validation"
require "mastermind_suzan/color"


module MastermindSuzan
  class GameEngine
    include Messages
    attr_accessor :player, :logic

    def start
      puts welcome_user
      input = gets.chomp.downcase
      case input
      when "p", "play" then play
      when "i", "instructions" then game_guide
      when "q", "quit" then exit
      else
        exit_game
      end
    end

    def play
      player_level
      @logic = Logic.new(player)
      until player.guesses.length >= 12
        logic.set_user_input
        logic.process_guess
      end
      logic.sequence_code
      exit
    end

    def player_level
      puts level_message
      level = gets.chomp.downcase
      @player = Player.new(level)
      player.gamecolor = Color.new.set(level)
    end

    def exit_game
      puts character_check
      exit
    end
  end
end
