require "spec_helper"

describe MastermindSuzan::Validation do
  before(:all) do
    player = MastermindSuzan::Player.new("b")
    player.gamecolor = %w(r g b y)
    @validation = MastermindSuzan::Validation.new(player)
  end

  context "#collect_guess" do
    it "should return user guess as an array" do
      allow(@validation).to receive(:gets).and_return("rggb")
      expect(@validation.collect_guess).to eq %w(r g g b)
    end
  end
  context "#input_error" do
    it "should return short input when player guess input is shorter than the game color length" do
      expect(@validation).to receive(:puts).with("Your input is too short")
      @validation.input_error(3)
    end

    it "should return long input when player guess input is longer than the game color length" do
      expect(@validation).to receive(:puts).with("Your input is too long")
      @validation.input_error(9)
    end
  end

  context "#check_replay_input" do
    it "should exit the game if user inputs q or quit" do
      allow(@validation).to receive(:gets).and_return("q")
      @validation.check_replay_input
    end
  end
end
