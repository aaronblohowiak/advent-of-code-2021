horizontal = 0
depth = 0
aim = 0

File.open('2.input').each do |line|
	command, distance = line.split(" ")
	distance = distance.to_i

	case command
	when "forward"
		horizontal += distance
		depth += aim * distance
	when "up"
		aim -= distance
	when "down"
		aim += distance
	end

	print "#{command} #{distance}	x:#{horizontal} z:#{depth} aim:#{aim}\n"
end

print horizontal * depth



