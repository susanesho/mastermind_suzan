require "spec_helper"

describe MastermindSuzan::Messages do
  subject { MastermindSuzan::GameEngine.new }

  describe "#player_level" do
    it "sets the player level" do
      allow(subject).to receive(:gets).and_return("b")
      subject.player_level
    end
  end
end
