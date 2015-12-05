#!/usr/bin/env ruby

Present = Struct.new(:l, :w, :h)

class AOC2
	def initialize
		@presents = []
		@wrappingPaperSurface = 0
		@ribbonLength = 0
		getPresents
		@presents.each do |present|
			@wrappingPaperSurface += surface(present) + extra(present)
			@ribbonLength += ribbon(present) + bow(present)
		end
		p @wrappingPaperSurface
		p @ribbonLength
	end

	def getPresents#readInput
		File.open('input', 'rb') do |f|
			f.readlines.each do |l|
				l.strip!
				l, w, h = l.split('x')
				@presents.push(Present.new(l.to_i, w.to_i, h.to_i))
			end
		end
	end

	def surface present#l, w, h
		l, w, h = present.l, present.w, present.h
		2*l*w + 2*w*h + 2*h*l
	end

	def extra present#l, w, h
		l, w, h = present.l, present.w, present.h
		[l*w, w*h, h*l].min
	end

	def ribbon present
		l, w, h = present.l, present.w, present.h
		[2*(l+w), 2*(w+h), 2*(h+l)].min
	end

	def bow present
		l, w, h = present.l, present.w, present.h
		l*w*h
	end
end

if __FILE__ == $0
	AOC2.new
end
