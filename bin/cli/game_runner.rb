$LOAD_PATH.unshift("#{File.dirname( __FILE__)}/../../lib/mastermind_suzan")
require "messages"
require "logic"
require "game_engine"
require  "player"
require_relative "valid"

module MastermindSuzan

  class GameRunner
    include Messages

    def start
      puts welcome_user
      input = gets.chomp.downcase
        case input
        when "p", "play" then GameEngine.new.start
        when "i", "instructions" then puts (game_guide)
        when "q", "quit" then exit
        else
          puts character_check
          exit
          end
    end
  end
end
