require "spec_helper"

describe MastermindSuzan::Messages do
  let(:my_messages) { Class.new { extend MastermindSuzan::Messages } }

  context "#welcome_user" do
    it "should print the module message for welcome user" do
      expect(my_messages.welcome_user).to include("Welcome to Mastermind\n Would you like to (p)lay, read the (i)instructions, or (q)uit?")
    end
  end

  context "#game_guide" do
    it "should print the module game guide" do
      expect(my_messages.game_guide).to include("Once game starts, a random code is generated and you're asked to guess what the code is.
      Every code is a four/five/six digit word made up by the letters [r, g, b, y]/[r, g, b, y, w]/[r, g, b, y, w, p]
      depending on difficulty levels beginner/intermediate/advanced levels. You have twelve guesses per game.
      On every guess, you are presented with a message identifying the number of elements you got correctly, and in what positions.
      To view entry history, enter h or history at any time
      To view sequence generated, enter c or cheat at any time
      To quit the game at any point enter q or quit")
    end
  end

  context "#beginner_level_message" do
    it "shuld print the module message for beginner_level_message" do
      expect(my_messages.beginner_level_message).to include("I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. \n Use (q)uit at any time to end the game. What's your guess?\n")
    end
  end

  context "#intermediate_level_message" do
    it "shuld print the module message for intermediate_level_message" do
      expect(my_messages.intermediate_level_message).to include("I have generated an intermediate sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite. \n Use (q)uit at any time to end the game. What's your guess?\n")
    end
  end

  context "#advanced_level_message" do
    it "shuld print the module message for advanced_level_message" do
      expect(my_messages.advanced_level_message).to include("I have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, (y)ellow, and (p)urple. \n Use (q)uit at any time to end the game. What's your guess?\n")
    end
  end

  # context "#feedback_message" do
  #   it "shuld print the module message for feedback_message" do
  #     expect(my_messages.feedback_message).to include("I have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, (y)ellow, and (p)urple. \n Use (q)uit at any time to end the game. What's your guess?")
  #   end
  # end

  context "#short_input" do
    it "shuld print the module message for short input" do
      expect(my_messages.short_input).to include("Your input is too short")
    end
  end

  context "#long_input" do
    it "shuld print the module message for long input" do
      expect(my_messages.long_input).to include("Your input is too long")
    end
  end

  # context "#congrats_message(player)" do
  #   it "shuld print the module message for congrats_message" do
  #
  #     expect(my_messages.congrats_message).with(player).to include("Congratulations! you guessed the sequence #{player.gamecolor.join} in #{player.guesses.length} guess(es) over #{player.duration}")
  #   end
  # end

  context "#level_message" do
    it "should print the level message" do
      expect(my_messages.level_message).to include("choose a level, (b)eginner, (i)ntermediate or (a)dvanced?")
    end
  end

  context "#valid_input" do
    it "should print the module message for level message" do
      expect(my_messages.valid_input).to include("Please enter a valid input")
    end
  end

  context "#character_check" do
    it "should print the character check mesage" do
      expect(my_messages.character_check).to include("Invalid character exiting..............")
    end
  end

  context "#history_header" do
    it "should print the history_header message" do
      expect(my_messages.history_header).to include("A display of your history below")
    end
  end
end
