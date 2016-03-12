require "spec_helper"
describe MastermindSuzan::Logic do
  let(:player) { MastermindSuzan::Player.new("b") }
  let(:logic) { MastermindSuzan::Logic.new(player) }
  let(:validation) { MastermindSuzan::Validation.new(player) }

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

    it " should processes the guess of the player" do
      logic.user_input = %w(r g b r)
      player.gamecolor = %w(r g b r)
      expect(logic).to receive(:replay_game)
      logic.process_guess
    end
  end

  context "#guess_history" do
    it "should display a history of guesses" do
      player.guesses = %w(kkkk)
      allow(logic).to receive(:history_message).with(0,"kkkk", [])
      logic.guess_history
    end
  end
end
