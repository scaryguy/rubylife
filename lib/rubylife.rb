require "rubylife/version"

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
			@board.cells.each do |cell|

				# Rule #1:
				# Any live cell with fewer than two live neighbours dies​, as if caused by under­population.
				if (@board.live_neighbours(cell).size < 2)
					cell.alive = false
				end

				# Rule #2:
				# Any live cell with two or three live neighbours lives​on to the next generation.
				if (cell.alive? && (@board.live_neighbours(cell).size == 2 || @board.live_neighbours(cell) == 3))
					cell.alive = true
				end

				# Rule #3:
				# Any live cell with more than three live neighbours dies​, as if by overcrowding..
				if (cell.alive? && @board.live_neighbours(cell).size > 3)
					cell.alive = false
				end		

				# Rule #4:
				# Any dead cell with exactly three live neighbours becomes a live cell,​as if by reproduction.
				if (cell.dead? && @board.live_neighbours(cell).size == 3)
					cell.alive = true
				end		

			end			
		end
		
	end
end
