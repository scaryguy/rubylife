module Rubylife
	class Cell
		attr_accessor :x, :y, :alive

		def initialize(x=0, y=0)
			@x = x
			@y = y
			@alive = false
		end

		def alive?
			@alive
		end

		def dead?
			!@alive
		end
		
	end
end