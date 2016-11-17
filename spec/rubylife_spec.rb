require "spec_helper"
require_relative './../lib/rubylife/board.rb'
require_relative './../lib/rubylife/cell.rb'

# _0,0_|_0,1_|_0,2_
# _1,0_|_1,1_|_1,2_
# _2,0_|_2,1_|_2,2_

describe Rubylife do
  it "has a version number" do
    expect(Rubylife::VERSION).not_to be nil
  end

  context 'Board' do
    subject { Rubylife::Board.new }

    it 'should have rows and cols attributes' do
      expect(subject).to respond_to :rows, :cols, :live_neighbours
    end

    it 'should have live_neighbours method working' do
      top_middle = subject.grid[0][1]
      middle_middle = subject.grid[1][1]
      top_right = subject.grid[0][2]
      top_middle.alive = true
      middle_middle.alive = true
      top_right.alive = true
      # p subject.live_neighbours(middle_middle)
      expect(subject.live_neighbours(middle_middle).count).to be == 2
    end

    it 'should live_neighbours not cause false positive', neighbours: true do
      top_middle = subject.grid[0][1]
      middle_middle = subject.grid[2][2]
      top_right = subject.grid[0][2]
      top_middle.alive = true
      middle_middle.alive = true
      top_right.alive = true
      # p subject.live_neighbours(middle_middle)
      expect(subject.live_neighbours(middle_middle).count).to be == 0
    end

    it 'should live_neighbours not cause false positive 2', neighbours2: true do
      top_middle = subject.grid[2][1]
      middle_middle = subject.grid[0][0]
      top_right = subject.grid[2][2]
      top_middle.alive = true
      middle_middle.alive = true
      top_right.alive = true
      # p subject.live_neighbours(middle_middle)
      expect(subject.live_neighbours(middle_middle).count).to be == 0
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
