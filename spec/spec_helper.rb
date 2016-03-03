require "simplecov"
SimpleCov.start
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "rspec"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "game_run"
require "mastermind_suzan/logic"
require "mastermind_suzan/color"
require "mastermind_suzan/messages"
require "mastermind_suzan/game_engine"
require "mastermind_suzan/validation"
