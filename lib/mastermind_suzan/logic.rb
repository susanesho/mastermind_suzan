require_relative "validation"
require_relative "messages"
require_relative "color"
require_relative "player"

module MastermindSuzan
  class Logic
    include Messages
    attr_accessor :user_input, :perfect_matches_counter, :validation, :player
    attr_reader :partial_match_counter, :count

    def initialize(player)
      @player = player
    end

    def process_player_valid_input
      @validation = Validation.new
      @user_input = validation.collect_guess(@player)
      if history_and_cheat_views?
        check_history_and_cheat_views
      end
    end

    def history_and_cheat_views?
      history_and_cheat_views_arr = %w(h c history cheat)
      history_and_cheat_views_arr.include? user_input.join("")
    end

    def check_history_and_cheat_views
      case user_input.join("")
      when "h", "history" then player_guess_history
      when "c", "cheat" then current_sequence_color_generated
      end
    end

    def player_guess_history
      puts history_header_display
      @player.guesses.select do |player_inputs|
        history_input = player_inputs.split(",")
        history_input.delete(history_input.last)
        puts "(#{@player.guesses.
          index(player_inputs) + 1}) Your input '#{history_input.join(",").
          gsub(/have|has/, "had").gsub("you had" , "and")}'"
      end
    end

    def current_sequence_color_generated
      puts sequence_generated_message(@player)
    end

    def zip_sequence_generated_with_player_input
      collected_zipped_result = @player.gamecolor.zip(user_input)
      collected_zipped_result
    end

    def process_player_guess
      if user_input == @player.gamecolor
        @player.duration = Time.now - @player.start_time
        puts congrats_message(@player)
        validation.replay_game
      else
        select_perfect_matches
        select_partial_matches
        current_feedback_to_user
      end
    end

    def select_perfect_matches
      perfect_matches = zip_sequence_generated_with_player_input.select { |elem| elem[0] == elem[1] }
      @perfect_matches_counter = perfect_matches.count
    end

    def select_partial_matches
      partial_matches = zip_sequence_generated_with_player_input.select { |elem| elem[0] != elem[1] }
      system_partial_match, user_partial_match = partial_matches.transpose
      partial_color_match = []
      user_partial_match.each do |element|
        if system_partial_match.include? element
          system_partial_match.delete_at(system_partial_match.index(element))
          partial_color_match << element
        end
        @partial_match_counter = partial_color_match.count
      end
    end

    def current_feedback_to_user
      unless history_and_cheat_views?
        player.guesses << feedback_message(user_input, perfect_matches_counter, partial_match_counter, @player.guesses.length)
        puts player.guesses.last
      end
    end
  end
end
