require_relative "color"
require_relative "player"
require_relative "messages"
require_relative "logic"

module MastermindSuzan
  class GameEngine
    attr_accessor :player

    include Messages
    def start
      player_level
      logic = Logic.new(player)
      player.gamecolor
      until player.guesses.length >= 12
        logic.player_guess
        logic.check_guess
      end
      logic.cheat
      logic.replay_game
    end

    def player_level
      puts level_message
      level = gets.chomp.downcase
      @player = Player.new(level)
      player.gamecolor = Color.new.set(player)
    end
  end
end
