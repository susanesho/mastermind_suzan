require 'spec_helper'

describe MastermindSuzan::Messages do

  let(:my_messages) {Class.new  {extend MastermindSuzan::Messages}}
  context "#game_guide"
  it "should print the module game guide" do
    expect(my_messages.game_guide).to be_a String
  end

  context "#welcome_user" do
    it "should print the module message for welcome user" do
      expect(my_messages.welcome_user).to be_a String
    end
  end

  context "#valid_input"
  it "should print the module message for level message" do
    expect(my_messages.valid_input).to be_a String
  end

  context "#short_input"
  it "shuld print the module message for short input" do
    expect(my_messages.short_input).to be_a String
  end

  context "#long_input"
  it "shuld print the module message for long input" do
    expect(my_messages.long_input).to be_a String
  end

end

