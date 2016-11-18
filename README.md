# Rubylife

An implementation of Conway's Game of Life in Ruby

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
