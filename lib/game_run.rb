require "mastermind_suzan/messages"
require "mastermind_suzan/logic"
require "mastermind_suzan/game_engine"
require "valid"
require  "game_runner"

  module MastermindSuzan
    GameRunner.new.start
  end
#   class GameRun
#     include Messages
#     include Validation
#     def start
#       puts welcome_user
#       input = gets.chomp.downcase
#         case input
#         when "p", "play" then GameEngine.new.start
#         when "i", "instructions" then game_guide
#         when "q", "quit" then exit
#         else
#           puts character_check
#           exit
#           end
#     end
#   end
# end
