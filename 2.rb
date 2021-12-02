horizontal = 0
depth = 0

File.open('2.input').each do |line|
	command, distance = line.split(" ")
	distance = distance.to_i

	case command
	when "forward"
		horizontal += distance
	when "up"
		depth -= distance
	when "down"
		depth += distance
	end

	print "#{command} #{distance}	x:#{horizontal} z:#{depth}\n \n"
end

print horizontal * depth



