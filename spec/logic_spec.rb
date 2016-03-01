  require 'mastermind_suzan'
  require 'lib/mastermind_suzan/logic'
  require 'lib/mastermind_suzan/validation'
describe MastermindSuzan::Logic do
  subject(:logic) { Logic.new(player)}
  let(:player) { Player.new('b') }
  context "zip_user_input" do
    it " returns a zipped array" do
      allow(player).to receive(:guess).and_return(['r','r','b','y'])
      allow(logic).to receive(@user_input).and_return(['b','r','o','y'])
      expect(logic.zip_user_input).to eq([['r','b'],['r','r'],['b','o'],['y','y']])
    end
  end

  end



