require "spec_helper"
require "support/color_example"

describe MastermindSuzan::Color do
  context "setting intermediate colors" do
    it_behaves_like "color_example", "b", 4
  end

  context "setting intermediate colors" do
    it_behaves_like "color_example", "i", 6
  end

  context "setting intermediate colors" do
    it_behaves_like "color_example", "a", 8
  end
end
