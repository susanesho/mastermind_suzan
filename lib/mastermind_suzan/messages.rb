module MastermindSuzan
  module Messages
    def welcome_user
      "Welcome to Mastermind\n Would you like to (p)lay, read the (i)instructions, or (q)uit?"
    end

    def beginner_level_message
      "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. \n Use (q)uit at any time to end the game. What's your guess?\n"
    end

    def intermediate_level_message
      "I have generated an intermediate sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite. \n Use (q)uit at any time to end the game. What's your guess?\n"
    end

    def advanced_level_message
      "I have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, (y)ellow, and (p)urple. \n Use (q)uit at any time to end the game. What's your guess?\n"
    end

    def game_guide
      "\nOnce game starts, a random code is generated and you're asked to guess what the code is.
      Every code is a four/five/six digit word made up by the letters [r, g, b, y]/[r, g, b, y, w]/[r, g, b, y, w, p]
      depending on difficulty levels beginner/intermediate/advanced levels. You have twelve guesses per game.
      On every guess, you are presented with a message identifying the number of elements you got correctly, and in what positions.
      To view entry history, enter h or history at any time
      To view sequence generated, enter c or cheat at any time
      To quit the game at any point enter q or quit\n"
    end

    def feedback_message(userinput, perfect_match_count, partial_match_count, count)
      "#{userinput.join} has #{perfect_match_count + partial_match_count} correct element, you have #{perfect_match_count} in the correct position, you have taken #{count + 1} guess"
    end

    def short_input
      "Your input is too short"
    end

    def long_input
      "Your input is too long"
    end

    def congrats_message(player)
      "Congratulations! you guessed the sequence #{player.gamecolor.join} in #{player.guesses.length} guess(es) over #{player.duration}"
    end

    def play_again
      "Do you want to (p)lay again or (q)uit?"
    end

    def level_message
      "choose a level, (b)eginner, (i)ntermediate or (a)dvanced? "
    end

    def sequence_code_message(player)
      "The sequence generated is #{player.gamecolor.join}"
    end

    def valid_input
      "Please enter a valid input"
    end

    def character_check
      "Invalid character exiting.............."
    end

    def history_header
      "A display of your history below"
    end

    def history_message(index, guess, history_input)
      "(#{index + 1}) Your input '#{history_input.join(',').
        gsub(/have|has/, 'had').gsub('you had', 'and')}'"
    end
  end
end
