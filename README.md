# MastermindSuzan

[![Code Climate](https://codeclimate.com/github/andela-oesho/mastermind_suzan/badges/gpa.svg)](https://codeclimate.com/github/andela-oesho/mastermind_suzan)
[![Test Coverage](https://codeclimate.com/github/andela-oesho/mastermind_suzan/badges/coverage.svg)](https://codeclimate.com/github/andela-oesho/mastermind_suzan/coverage)

Welcome to Mastermind by suzan. An interactive gem packaged and played in a ruby environment.

##About Mastermind

Mastermind or Master Mind is a code-breaking game. The modern game with pegs was invented in 1970 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert. It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century or more.

The player decides in advance how many games they will play, which must be an even number. The computer is the codemaker, the player is the codebreaker. The codemaker chooses a pattern of colours. Duplicates are allowed. The codebreaker tries to figure out the pattern with a limited number of guesses.

## Installation

The User should have ruby set on his pc

Add this line to your application's Gemfile:

```rub
gem 'mastermind_suzan'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install /mastermind_suzan

## Game Play

* A splash screen is showed once a game is started from where the user can start a game or read instructions.
* A random code of varying legth is generated depending on the level  selected by the user.
* You have twelve guesses per game.
* On every guess, you are presented with a message identifying the number of elements you got correctly, and in what           positions.
* To view entry history, enter h or history at any time.
* To view sequence generated, enter c or cheat at any time
* To quit the game at any point enter q or quit.
* The game is timed and on successful completion, the user gets a detail of his performance and a top players list is
  displayed

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/andela-oesho/mastermind_suzan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
