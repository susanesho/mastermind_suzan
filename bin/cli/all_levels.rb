require "mastermind_suzan/game_engine"
require "mastermind_suzan/color"
require "mastermind_suzan/player"
require "mastermind_suzan/messages"
require "mastermind_suzan/logic"



class Awesome
    attr_accessor :player
  include Messages

  def self.player_level
    puts level_message
    level = gets.chomp.downcase
    @player = Player.new(level)
    player.gamecolor = Color.new.set(player)
  end
end
