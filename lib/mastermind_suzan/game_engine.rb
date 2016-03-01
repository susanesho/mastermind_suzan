require_relative 'color'
require_relative 'player'
require_relative 'messages'
require_relative 'logic'

module MastermindSuzan
  class GameEngine
    include Messages
    def start
      player_level
      logic = Logic.new(@player)
      p @player.gamecolor
      until @player.guesses.length >= 13
        logic.player_guess
        logic.check_guess
        logic.feedback_to_user
      end
      logic.cheat
      logic.replay_game
    end

    def player_level
      puts level_message
      level = gets.chomp.downcase
      @player = Player.new(level)
      Color.new.set(@player)
    end
  end
end
