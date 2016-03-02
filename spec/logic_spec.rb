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

  # context "#player_guess" do
  #   it "should return an array of vvlength 2" do
  #     player.guesses = ["kkkk", "byrg"]
  #     expect(logic.player_guess).to be_an Array
  #   end
  # end

end
