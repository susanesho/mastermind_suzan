require 'spec_helper'

describe MastermindSuzan::Color do
  context "#set" do
    it "should return array colors for beginner level" do
      player = MastermindSuzan::Player.new('b')
      color = MastermindSuzan::Color.new
      colors = color.set(player)
      expect(colors).to be_an Array
      expect(colors.length).to be 4
    end

    it "should return array colors for intermediate level" do
      player = MastermindSuzan::Player.new('i')
      color = MastermindSuzan::Color.new
      colors = color.set(player)
      expect(colors).to be_an Array
      expect(colors.length).to be 6
    end

    it "should return array colors for advanced level" do
      player = MastermindSuzan::Player.new('a')
      color = MastermindSuzan::Color.new
      colors = color.set(player)
      expect(colors).to be_an Array
      expect(colors.length).to be 8
    end
  end
end
