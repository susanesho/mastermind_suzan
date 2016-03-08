require "mastermind_suzan/color"
require "mastermind_suzan/player"
require "mastermind_suzan/messages"
require "mastermind_suzan/logic"
require "mastermind_suzan/game_engine"


class Tired
    attr_accessor :player
  include Messages

  def player_level
    puts level_message
    level = gets.chomp.downcase
    @player = Player.new(level)
    player.gamecolor = Color.new.set(player)
  end
end
