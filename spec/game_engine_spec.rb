require "spec_helper"

describe MastermindSuzan::GameEngine do
let(:player) { MastermindSuzan::Player.new("b") }

  describe "#player_level" do
    it "sets the player level" do
      allow(subject).to receive(:gets).and_return("b")
      subject.player_level
    end
  end

  context "#start" do
    it "should print instructions when the user enters i" do
      allow(subject).to receive(:gets).and_return("i")
      subject.start
    end

    it "should start the game if user enters p" do
      allow(subject).to receive(:gets).and_return("p")
      expect(subject).to receive(:play)
      subject.start
    end

    it "quits if the user enters q" do
      allow(subject).to receive(:gets).and_return("q")
      expect { subject.start }.to raise_error SystemExit
    end

    it "should exit without a valid input" do
      allow(subject).to receive(:gets).and_return("l")
      expect { subject.start }.to raise_error SystemExit
    end
  end
end
