require "rubylife/version"
require 'rubylife/board'
require 'rubylife/cell'


module Rubylife
  class Game
    attr_reader :board

    def initialize(board=Board.new, seed=[])

      @board = board
      seed.each do |cell|
        board.grid[cell[0]][cell[1]].alive=true
      end

    end

    def tick!

      live_cells = []
      dead_cells = []


      @board.cells.each do |cell|

        # Rule #1:
        # Any live cell with fewer than two live neighbours dies​, as if caused by under­population.
        if (cell.alive? && @board.live_neighbours(cell).size < 2)
          dead_cells << cell
        end

        # Rule #2:
        # Any live cell with two or three live neighbours lives​ on to the next generation.
        if (cell.alive? && (@board.live_neighbours(cell).size == 2 || @board.live_neighbours(cell) == 3))
          live_cells << cell
        end

        # Rule #3:
        # Any live cell with more than three live neighbours dies​, as if by overcrowding..
        if (cell.alive? && @board.live_neighbours(cell).size > 3)
          dead_cells << cell
        end

        # Rule #4:
        # Any dead cell with exactly three live neighbours becomes a live cell,​as if by reproduction.
        if (cell.dead? && @board.live_neighbours(cell).size == 3)
          live_cells << cell
        end

      end

      live_cells.each { |cell| cell.alive = true}
      dead_cells.each { |cell| cell.alive = false}

    end

  end
end
