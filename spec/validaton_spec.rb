require "spec_helper"

describe MastermindSuzan::Validation do
  let(:my_validation) { Class.new { extend MastermindSuzan::Validation } }

  context "#collect_guess" do
    it "should return user guess as an array" do
      player = MastermindSuzan::Player.new("b")
      player.gamecolor = %w(r g b y)
      allow(my_validation).to receive(:gets).and_return("rggb")
      expect(my_validation.collect_guess(player)).to eq %w(r g g b)
    end
  end
  context "#input_error" do
    it "should return short input when player guess input is shorter than the game color length" do
      player = MastermindSuzan::Player.new("i")
      my_validation.player = player
      player.gamecolor = %w(r g b y o s)
      expect(my_validation).to receive(:puts).with("Your input is too short")
      my_validation.input_error(5)
    end

    it "should return long input when player guess input is longer than the game color length" do
      player = MastermindSuzan::Player.new("i")
      my_validation.player = player
      player.gamecolor = %w(r g b y o s)
      expect(my_validation).to receive(:puts).with("Your input is too long")
      my_validation.input_error(9)
    end
  end

  # context "#check_replay_input" do
  #   it "should start the game again if user enters p or play" do
  #     allow(my_validation).to receive(:gets).and_return("p")
  #     allow(my_validation).to receive(MastermindSuzan::GameEngine.new.start)
  #     my_validation.check_replay_input
  #     #expect(my_validation.check_replay_input).to be_an instance_of MastermindSuzan::GameEngine

  #   end
  # end


end


