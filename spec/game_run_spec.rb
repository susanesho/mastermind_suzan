require "spec_helper"

describe MastermindSuzan::GameRun do
  subject { MastermindSuzan::GameRun.new }
  context "#start" do
    it "quits if the user enters q" do
      allow(subject).to receive(:gets).and_return("q")
      expect { subject.start }.to raise_error SystemExit
    end

    it "should exit without a valid input" do
      allow(subject).to receive(:gets).and_return("l")
       expect { subject.start }.to raise_error SystemExit
    end
  end
end
