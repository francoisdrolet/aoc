#!/usr/bin/env ruby

class AOC1
	def initialize
		@floor = 0
		@firstBasementPos = 0
		@str = File.open('input', 'rb').readlines[0].strip
	end
	
	def setFirstBasementPos pos
		@firstBasementPos = pos if @firstBasementPos.zero?
	end
	
	def go
		(0...@str.size).each do |pos|
			c = @str[pos]
			@floor += case c
				when '('
					1
				when ')'
					-1
				else
					raise 'wtf'
			end
			setFirstBasementPos(pos+1) if @floor == -1
		end
		puts @floor
		puts @firstBasementPos
	end
end

if __FILE__ == $0
	AOC1.new.go
end
