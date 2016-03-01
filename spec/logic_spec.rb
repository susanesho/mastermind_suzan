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

  # context "#player_guess" do
  #   it "should return an array of vvlength 2" do
  #     player.guesses = ["kkkk", "byrg"]
  #     expect(logic.player_guess).to be_an Array
  #   end
  # end

end
