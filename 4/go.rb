#!/usr/bin/env ruby

require 'digest/md5'

class AOC4
	def initialize
		i = 1
		str = ''
		loop do
			str = secret + i.to_s
			break if str.md5.startsWithZeros? 6
			i += 1
		end
		puts i
		puts str
		puts str.md5
	end
	
	def secret
		#'abcdef'
		#'pqrstuv'
		'ckczppom'
	end
end

class String
	def md5
		Digest::MD5.hexdigest(self)
	end

	def startsWithZeros? i
		self.split('')[0...i].uniq == ['0']
	end
end

if __FILE__ == $0
	AOC4.new
end
