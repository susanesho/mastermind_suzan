require_relative "validation"
require_relative "messages"
require_relative "color"
require_relative "player"
require "byebug"

module MastermindSuzan
  class Logic
    include Messages
    attr_accessor :user_input, :perfect_match_count, :validation, :player
    attr_reader :partial_match_count, :count

    def initialize(player)
      @player = player
    end

    def set_user_input
      @validation = Validation.new(player)
      @user_input = validation.collect_guess
      if history_or_cheat?
        display_history_or_cheat
      end
    end

    def history_or_cheat?
      history_and_cheat_views_arr = %w(h c history cheat)
      history_and_cheat_views_arr.include? user_input.join("")
    end

    def display_history_or_cheat
      case user_input.join("")
      when "h", "history" then guess_history
      when "c", "cheat" then sequence_code
      end
    end

    def guess_history
      puts history_header
      player.guesses.each_with_index do |guess, index|
        history_input = guess.split(",")
        history_input.delete(history_input.last)
        puts history_message(index, guess, history_input)
      end
    end

    def sequence_code
      puts sequence_code_message(player)
    end

    def zip_code_with_guess
      player.gamecolor.zip(user_input)
    end

    def process_guess
      if user_input == player.gamecolor
        player.duration = Time.now - player.start_time
        puts congrats_message(player)
        replay_game
      else
        select_perfect_matches
        select_partial_matches
        feedback_to_user
      end
    end

    def select_perfect_matches
      perfect_matches = zip_code_with_guess.select { |elem| elem[0] == elem[1] }
      @perfect_match_count = perfect_matches.count
    end

    def select_partial_matches
      partial_matches = zip_code_with_guess.select { |elem| elem[0] != elem[1] }
      system_partial_match, user_partial_match = partial_matches.transpose
      partial_color_match = []
      user_partial_match.each do |element|
        if system_partial_match.include? element
          system_partial_match.delete_at(system_partial_match.index(element))
          partial_color_match << element
        end
        @partial_match_count = partial_color_match.count
      end
    end

    def feedback_to_user
      unless history_or_cheat?
        player.guesses << feedback_message(user_input, perfect_match_count, partial_match_count, @player.guesses.length)
        puts player.guesses.last
      end
    end

    def replay_game
      puts play_again
      validation.check_replay_input
    end
  end
end
