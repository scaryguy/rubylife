module Rubylife
  class Board
    attr_accessor :rows, :cols, :grid, :cells

    def initialize(rows=3, cols=3)
      @rows = rows
      @cols = cols
      @cells = []
      @grid = Array.new(rows) do |row|
        Array.new(cols) do |col|
          cell = Cell.new(row, col)
          @cells.push(cell)
          cell
        end
      end
    end

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
