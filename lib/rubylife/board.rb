module Rubylife
  class Board
    attr_accessor :rows, :cols, :grid

    def initialize(rows=3, cols=3)
      @rows = rows
      @cols = cols
      @grid = Array.new(rows) do |row|
        Array.new(cols) do |col|
          Cell.new(row, col)
        end
      end
    end

    # _0,0_|_0,1_|_0,2_
    # _1,0_|_1,1_|_1,2_
    # _2,0_|_2,1_|_2,2_

    def live_neighbours(cell)
      neighbours = []

      @grid.each_with_index do |row, i|
      	row.each_with_index do |col,j|
      		if (grid[i][j] != cell)
      			if(grid[i][j].alive? && (((cell.x - i).abs < 2) && ((cell.y - j).abs < 2)))
      				neighbours.push(grid[i][j])
      			end
      		end
      	end
      end
      neighbours
    end

  end
end
