require_relative "valid"
$LOAD_PATH.unshift("#{File.dirname( __FILE__)}/../../lib/mastermind_suzan")
require "logic"
require "messages"
require "color"
require "player"


module MastermindSuzan
  class SplittedLogic
    include Validation
    include Messages
    attr_accessor :user_input, :match, :player
    attr_reader :counter, :count

    def initialize(player)
      @player = player
    end

    def feedback_on_history_and_cheats(user_input)
      puts nouns = Logic.new(player)
      nouns.command_action(user_input)
    end

    def history_first_message
      puts history_display_box
    end

    def history_details_to_user(index, history_input)
      puts "(#{index + 1}) Your input was '#{history_input.join(",").gsub(/have|has/, "had")}'"
    end

    def cheat_message_to_player
      puts sequence_generated(@player)
    end

    def current_feedback_to_user
      puts player.guesses.last
    end

    def congratulate_user
       puts congrats_msg(@player)
    end

  end
end
