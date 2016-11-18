# Rubylife

An implementation of Conway's Game of Life in Ruby

## For demonstration

```console
$ bundle install
```

```console
$ rspec --tag glider
```

### Output:

```
  Glider
"Initial pattern:"
"___|_X_|___"
"___|___|_X_"
"_X_|_X_|_X_"
"====================== Round 1"
"___|___|___"
"_X_|___|_X_"
"___|_X_|_X_"
"====================== Round 2"
"___|___|___"
"___|___|_X_"
"___|_X_|_X_"
"====================== Round 3"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 4"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 5"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 6"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 7"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 8"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 9"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
"====================== Round 10"
"___|___|___"
"___|_X_|_X_"
"___|_X_|_X_"
    should work

Finished in 0.01018 seconds (files took 0.11499 seconds to load)
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubylife'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubylife


## Usage

```ruby
game = Rubylife::Game.new(Rubylife::Board.new, [[2,0],[2,1],[2,2],[1,2],[0,1]])
game.tick!
```
