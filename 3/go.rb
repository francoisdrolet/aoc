#!/usr/bin/env ruby

Position = Struct.new(:x, :y)

class AOC3
	def initialize
		@map = Hash.new(0)
		@currentPos = Position.new(0,0)
		@str = input
	  go
		puts @map.keys.size
	end


	def go
		deliver
		@str.each_char do |c|
		  case c
				when '^'
					move 0,1
				when 'v'
					move 0,-1
				when '<'
					move -1,0
				when '>'
					move 1,0
				else
					raise 'wtf'
			end
			deliver
		end
	end

	def deliver
		@map[@currentPos] += 1
	end

	def move x,y
		@currentPos = Position.new(@currentPos.x + x, @currentPos.y + y)
	end

	def test1; '>'; end
	def test2; '^>v<'; end
	def test3; '^v^v^v^v^v'; end
	def input; File.open('input', 'rb').readlines[0].strip; end
end

if __FILE__ == $0
	AOC3.new
end
