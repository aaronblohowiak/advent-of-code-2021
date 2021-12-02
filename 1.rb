read = 0
count = 0
last = 0

File.open('1.input').each do |line|
	line = line.to_i

	#first line sets baseline
	if read == 0
		last = line 
	end
	read += 1

	#count increasing measurements
	if line > last
		count += 1
	end

	#remember previous
	last = line

	print "#{read}	#{line}	#{count}\n" 
	
end

print count.to_s+"\n"


