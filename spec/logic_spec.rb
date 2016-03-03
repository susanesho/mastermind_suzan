require "spec_helper"
describe MastermindSuzan::Logic do
  let(:player) { MastermindSuzan::Player.new('b') }
  subject(:logic) {MastermindSuzan::Logic.new(player)}

  # context "zip_user_input" do
  #   it " returns a zipped array" do
  #     allow(player).to receive(:guess).and_return(['r','r','b','y'])
  #     allow(logic).to receive(@user_input).and_return(['b','r','o','y'])
  #     expect(logic.zip_user_input).to eq([['r','b'],['r','r'],['b','o'],['y','y']])
  #   end
  # end

  context "#history" do
    it "should return an array of length 2" do
      player.guesses = ["kkkk", "byrg"]
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
    it"returns partial match" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r y g b)
      expect(logic.partial_match.count).to be 3
    end
  end

  context "#perfect_positions" do
    it"returns partial match" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r y g b)
      expect(logic.perfect_positions.count).to be 1
    end
  end

  context "#player_guess" do
    it "checks if the input of the user is false and returns an array" do
      allow(logic).to receive(:collect_guess).and_return %w(r g b y)
      allow(logic).to receive(:command).and_return false
      expect(logic.player_guess).to be_an Array
    end
    it "checks if the guess of the user is true and calls the command_action method" do
      allow(logic).to receive(:command).and_return true
     expect(logic).to receive(:command_action)
     logic.command_action
    end
  end

  context "#feedback_to_user" do
    it "check if the user_input is not a command and prints the the feedback message" do
      allow(logic).to receive(:command).and_return false
      allow(logic).to receive(:feedback_guess).and_return String
      expect(logic.feedback_to_user).to be nil
    end
  end

  context "#replay_game" do
    it "checks if the user can play again" do
     allow(logic).to receive(:puts).and_return "Do you want to (p)lay again or (q)uit?"
     allow(logic).to receive(:check_replay_input).and_return("q")
    end
  end

  context "#check_guess" do
    it "checks if the user guess is in perfect or partial position with that of the player" do
      player.gamecolor = %w(r g b y)
      logic.user_input = %w(r g b y)
      allow(logic).to receive(:congrats_msg).with(player)
      allow(logic).to receive(:logic.replay_game).and_return replay_game
      expect(player.gamecolor).to eql logic.user_input

    end
  end


end
