require "spec_helper"
describe MastermindSuzan::Logic do
  let(:player) { MastermindSuzan::Player.new("b") }
  let(:logic) { MastermindSuzan::Logic.new(player) }
  let(:validation) { MastermindSuzan::Validation.new(player) }

  # context "#set_user_input" do
  #   # it "returns the input" do
  #   #   # allow(logic).to receive(:validation.collect_guess).and_return %w(r g b y)
  #   #   expect(logic.user_input).to be %w(r g b y)
  #   #   logic.set_user_input
  #   # end
  #   it "checks if the input of the user includes the element in the history and cheat views Array and returns result of the array based on the element picked guess" do
  #     allow(validation).to receive(:collect_guess).and_return %w(r g b y)
  #     # expect(logic).to receive(:check_history_and_cheat_views)
  #     logic.set_user_input
  #   end
  # end

  context "#history_or_cheat?" do
    it "returns true if the player input is c or h" do
      logic.user_input = %w(h)
      expect(logic.history_or_cheat?).to be true
    end

    it "returns false if the player input is not any of c or h" do
      logic.user_input = %w(p)
      expect(logic.history_or_cheat?).to be false
    end
  end

  context "#display_history_or_cheat" do
    it " should call cheat if user input is c or cheat" do
      logic.user_input = %w(c)
      expect(logic).to receive(:sequence_code)
      logic.display_history_or_cheat
    end

    it "should call history if user input is h or history" do
      logic.user_input = %w(h)
      expect(logic).to receive(:guess_history)
      logic.display_history_or_cheat
    end
  end

  context "#sequence_code" do
    it " should diplay the sequence code" do
      player.gamecolor = %w(r g b y)
      expect(logic).to receive(:puts).with("The sequence generated is rgby")
      logic.sequence_code
    end

    it "should call history if user input is h or history" do
      logic.user_input = %w(h)
      expect(logic).to receive(:guess_history)
      logic.display_history_or_cheat
    end
  end

  context "#process_guess" do
    it " should processes the guess of the player" do
      logic.user_input = %w(r g b r)
      player.gamecolor = %w(r y b g)
      expect(logic).to receive(:puts).with("rgbr has 3 correct element, you have 2 in the correct position, you have taken 1 guess")
      logic.process_guess
    end

    # it "should call history if user input is h or history" do
    #   logic.user_input = %w(h)
    #   expect(logic).to receive(:guess_history)
    #   logic.display_history_or_cheat
    # end
  end


  # context "#guess_history" do
  #   it "should return an array of length 2" do
  #     player.guesses = %w(kkkk byrg)
  #     allow(logic).to receive(:puts).once.with("A display of your history below")
  #     logic.guess_history
  #   end
  # end
  #
  # context "#current_sequence_color_generated" do
  #   it "returns the sequence color generated for the level the player picks" do
  #     player.gamecolor = %w(r g b y)
  #     expect(logic).to receive(:sequence_generated).with(player)
  #     logic.current_sequence_color_generated
  #   end
  # end
  #

  # context "#replay_game" do
  #   it "checks if the user can play again" do
  #     expect(logic).to receive(:puts).and_return "Do you want to (p)lay again dor (q)uit?"
  #     expect(logic).to receive(:check_replay_input)
  #     logic.replay_game
  #   end
  # end
end
