read = 0
count = 0
last = 0

input = File.open('1.input').each.map(&:to_i)

segments = (0 .. input.length - 3).map{|i| input[i, 3]}

segments.each_with_index do |segment, read|
	line = segment.sum

	#first line sets baseline
	if read == 0
		last = line 
	end

	#count increasing measurements
	if line > last
		count += 1
	end

	#remember previous
	last = line

	print "#{read}	#{line}	#{count}	#{segment}\n" 	
end

print count.to_s+"\n"


