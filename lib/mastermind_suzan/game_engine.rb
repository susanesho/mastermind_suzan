require_relative "color"
require_relative "player"
require_relative "messages"
require_relative "logic"

module MastermindSuzan
  class GameEngine
    include Messages
    attr_accessor :player
    def start
      player_level
      logic = Logic.new(player)
      until player.guesses.length >= 12
        logic.set_user_input
        logic.process_guess
      end
    end

    def player_level
      puts level_message
      level = gets.chomp.downcase
      @player = Player.new(level)
      player.gamecolor = Color.new.set(level)
    end
  end
end
