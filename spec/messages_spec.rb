require 'spec_helper'

describe MastermindSuzan::Messages do
  let(:messages) { MastermindSuzan::Messages.new }
  context "#welcome_user" do
    it "returns string" do
      expect(messages.welcome_user).to be_a String
    end
  end
end
