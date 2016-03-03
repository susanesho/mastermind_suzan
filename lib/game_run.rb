require "mastermind_suzan/messages"
require "mastermind_suzan/logic"
require "mastermind_suzan/game_engine"
require "mastermind_suzan/validation"
require "byebug"

module MastermindSuzan
  class GameRun
    include Messages
    include Validation
    def start
      puts welcome_user
      input = gets.chomp.downcase
      loop do
        case input
        when "p", "play" then GameEngine.new.start
        when "i", "instructions" then game_guide
        when "q", "quit" then exit
        else
          puts character_check
          exit
          end
      end
    end
  end
end
