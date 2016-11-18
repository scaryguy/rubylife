require "spec_helper"
require_relative './../lib/rubylife.rb'
require_relative './../lib/rubylife/board.rb'
require_relative './../lib/rubylife/cell.rb'

# General Structure
# -----------------
# _0,0_|_0,1_|_0,2_
# _1,0_|_1,1_|_1,2_
# _2,0_|_2,1_|_2,2_
#------------------

describe Rubylife do

  context 'Game', game: true do
  	let!(:game) { Rubylife::Game.new(Rubylife::Board.new, [[0,1],[1,1]]) }

  	it 'should respond to board attribute' do
  		expect(game).to respond_to :board
  	end

  	it 'should start a new game with seeded cells' do
  		expect(game.board.grid[0][1].alive).to eq(true)
  		expect(game.board.grid[1][1].alive).to eq(true)
  		expect(game.board.grid[2][1].alive).to eq(false)
  	end

  	it 'should refresh all cells after a tick!', tick: true do
  		# p game
  		expect(game.board.grid[0][1].alive).to eq(true)
  		game.tick!
  		expect(game.board.grid[0][1].alive).to eq(false)

  	end

  end

  context 'Board' do
    subject { Rubylife::Board.new }

    it 'should have rows and cols attributes' do
      expect(subject).to respond_to :rows, :cols, :live_neighbours
    end

    it 'should have live_neighbours method working' do

      # __|_X_|_X_
      # __|_X_|__
      # __|__|__

      target_cell = subject.grid[1][1]
      cell2 = subject.grid[0][1]
      cell3 = subject.grid[0][2]

      target_cell.alive = true
      cell2.alive = true
      cell3.alive = true
      # p subject.live_neighbours(target_cell)
      expect(subject.live_neighbours(target_cell).count).to be == 2
    end

    it 'should live_neighbours not cause false positive for bottom/top cells', neighbours: true do

      # __|_X_|_X_
      # __|__|__
      # __|__|_X_

      target_cell = subject.grid[2][2]
      cell2 = subject.grid[0][1]
      cell3 = subject.grid[0][2]

      target_cell.alive = true
      cell2.alive = true
      cell3.alive = true
      # p subject.live_neighbours(target_cell)
      expect(subject.live_neighbours(target_cell).count).to be == 0
    end

    it 'should live_neighbours not cause false positive for top/bottom cells', neighbours2: true do

      # _X_|__|__
      # __|__|__
      # __|_X_|_X_

      target_cell = subject.grid[0][0]
      cell2 = subject.grid[2][1]
      cell3 = subject.grid[2][2]

      target_cell.alive = true
      cell2.alive = true
      cell3.alive = true
      # p subject.live_neighbours(target_cell)
      expect(subject.live_neighbours(target_cell).count).to be == 0
    end

    it 'should live_neighbours not cause false positive for middle/bottom cells', neighbours3: true do

      # __|_X_|__
      # _X_|__|__
      # __|__|_X_

      target_cell = subject.grid[1][0]
      cell2 = subject.grid[0][1]
      cell3 = subject.grid[2][2]

      target_cell.alive = true
      cell2.alive = true
      cell3.alive = true
      # p subject.live_neighbours(target_cell)
      expect(subject.live_neighbours(target_cell).count).to be == 1
    end

  end

  context 'Cell' do
    subject { Rubylife::Cell.new }

    it 'should have x, y, alive, alive? and dead? attributes' do
      expect(subject).to respond_to :x, :y, :alive, :alive?, :dead?
    end

    it 'should be dead by default' do
      expect(subject).to be_dead
    end

    it 'should change life mode' do
      expect(subject).to be_dead
      subject.alive = true
      expect(subject).to be_alive
    end

  end

end
