#!/usr/bin/env ruby

Position = Struct.new(:x,:y)

class AOC3
	def initialize
		@map = Hash.new(0)
		@currentPos = {:santa => Position.new(0,0), :robo => Position.new(0,0)}
		#@currentPos = [Position.new(0,0), Position.new(0,0)]
		@active = :santa
		@directions = {
			'^' => [ 0, 1],
			'v' => [ 0,-1],
			'<' => [-1, 0],
			'>' => [ 1, 0]
		}
		@arr = input.split('')
	  go
		p @map.keys.size
	end

	def go
		deliver; switch; deliver; switch
		while c = @arr.shift do
			move *@directions[c]; deliver; switch
		end
	end

	def switch
		@active = @active == :santa ? :robo : :santa
		#p @active
	end

	def deliver
		@map[@currentPos[@active]] += 1
		#p @map
	end

	def move x,y
		pos = @currentPos[@active]
		@currentPos[@active] = Position.new(pos.x + x, pos.y + y)
	end

	def test1; '>'; end
	def test2; '^>v<'; end
	def test3; '^v^v^v^v^v'; end
	def input; File.open('input', 'rb').readlines[0].strip; end
end

if __FILE__ == $0
	AOC3.new
end
