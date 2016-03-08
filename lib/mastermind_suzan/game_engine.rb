require_relative "color"
require_relative "player"
require_relative "messages"
require_relative "logic"
$LOAD_PATH.unshift("#{File.dirname( __FILE__)}/../../bin/cli")
require "all_levels"

module MastermindSuzan
  class GameEngine
    include Messages
    attr_accessor :player

    def start
      @player = AllLevels.new.player_level
      logic = Logic.new(player)
      until player.guesses.length >= 12
        logic.player_guess
        logic.check_guess
      end
    end
  end
end
