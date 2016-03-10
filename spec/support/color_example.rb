RSpec.shared_examples "color_example" do |level, length|
  it "should return array colors of correct length" do
    colors = subject.set(level)
    expect(colors.length).to be length
  end
end
