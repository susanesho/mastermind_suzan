$LOAD_PATH.unshift("#{File.dirname( __FILE__)}/../../lib/mastermind_suzan")
require "game_engine"
require "color"
require "player"
require "messages"
require "logic"


module MastermindSuzan
  class AllLevels
    include Messages
    attr_accessor :player
    def player_level
      puts level_message
      level = gets.chomp.downcase
      @player = Player.new(level)
      player.gamecolor = Color.new.set(level)
      player
    end

  end
end
