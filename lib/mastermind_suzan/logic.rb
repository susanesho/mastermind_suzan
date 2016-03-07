require_relative "validation"
require_relative "messages"
require_relative "color"
require_relative "player"

module MastermindSuzan
  class Logic
    include Validation
    include Messages
    attr_accessor :user_input, :match
    attr_reader :counter, :count

    def initialize(player)
      @player = player
    end

    def player_guess
      @user_input = collect_guess(@player)

      if command?
        puts command_action
      else
        @player.guesses << user_input.join("")
      end
    end

    def zip_user_input
      @player.gamecolor.zip(user_input)
    end

    def perfect_positions
      @player.gamecolor.zip(user_input)
      @match = zip_user_input.select { |elem| elem[0] == elem[1] }
      @match
    end

    def check_guess
      if user_input == @player.gamecolor
        @player.duration = Time.now - @player.start_time
        puts congrats_msg(@player)
        replay_game
      else
        perfect_positions
        partial_match
        feedback_to_user
      end
    end

    def command?
      command = %w(h c history cheat)
      command.include? user_input.join("")
    end

    def partial_match
      partial_matches = zip_user_input.select { |elem| elem[0] != elem[1] }
      system_partial_match, user_partial_match = partial_matches.transpose
      partial_color_match = []
      user_partial_match.each do |element|
        if system_partial_match.include? element
          system_partial_match.delete_at(system_partial_match.index(element))
          partial_color_match << element
        end
        @counter = partial_color_match.count
      end
    end

    def feedback_to_user
      unless command?
        puts feedback_guess(user_input, match.count, counter, @player.guesses.length)
      end
    end

    def cheat
      sequence_generated(@player)
    end

    def history
      puts history_display_box
      @player.guesses.each {|history_inputs| puts "(#{@player.guesses.index(history_inputs) + 1}) Your input was '#{history_inputs}', you had #{match.count}perfects, #{counter} partial"}
    end

    def replay_game
      puts play_again
      check_replay_input
    end

    def command_action
      case user_input.join("")
      when "h", "history" then history
      when "c", "cheat" then cheat
      end
    end
  end
end
