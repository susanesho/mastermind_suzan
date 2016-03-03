require "spec_helper"
describe MastermindSuzan::Logic do
  let(:player) { MastermindSuzan::Player.new("b") }
  subject(:logic) { MastermindSuzan::Logic.new(player) }

  context "#history" do
    it "should return an array of length 2" do
      player.guesses = %w(kkkk byrg)
      allow(logic).to receive(:gets).and_return("bbgy")
      expect(logic.history).to be_an Array
      expect(logic.history.length).to eq 2
    end
  end

  context "#cheat" do
    it "returns game colours" do
      player.gamecolor = %w(r g b y)
      expect(logic).to receive(:sequence_generated).with(player)
      logic.cheat
    end
  end

  context "#command_action" do
    it " should call cheat if user input is c or cheat" do
      logic.user_input = %w(c)
      expect(logic).to receive(:cheat)
      logic.command_action
    end

    it "should call history if user input is h or history" do
      logic.user_input = %w(h)
      expect(logic).to receive(:history)
      logic.command_action
    end
  end

  context "#command?" do
    it "returns true if it is a command" do
      logic.user_input = %w(h)
      expect(logic.command?).to be true
    end

    it "returns false if it is not a command" do
      logic.user_input = %w(p)
      expect(logic.command?).to be false
    end
  end

  context "#partial_match" do
    it "returns partial match" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r y g b)
      expect(logic.partial_match.count).to be 3
    end
  end

  context "#perfect_positions" do
    it "returns partial match" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r y g b)
      expect(logic.perfect_positions.count).to be 1
    end
  end

  context "#player_guess" do
    it "checks if the input of the user is false and returns an array" do
      allow(logic).to receive(:collect_guess).and_return %w(r g b y)
      expect(logic.player_guess).to be_an Array
    end
    it "checks if the guess of the user is true and calls the command_action method" do
      allow(logic).to receive(:collect_guess).and_return %w(c)
      logic.player_guess
    end
  end

  context "#replay_game" do
    it "checks if the user can play again" do
      expect(logic).to receive(:puts).and_return "Do you want to (p)lay again dor (q)uit?"
      expect(logic).to receive(:check_replay_input)
      logic.replay_game
    end
  end

  context "#check_guess" do
    it "prints congratulation message to the user if guess is correct" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r g b y)
      allow(logic).to receive(:puts).and_return("sss")
      allow(logic).to receive(:replay_game)
      logic.check_guess
    end

    it "goes to the methods partial match, and perfect position" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r b g y)
      allow(logic).to receive(:puts).with "rbgy has 4 correct element, you have 2 in the correct position, you have taken 0 guess"
      logic.check_guess
    end
  end
end
