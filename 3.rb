count = 0
bits = Hash.new(0)

File.open('3.input').each do |line|
	count += 1
	line.split("").each_with_index do |n, i|
		if n == "1"
			bits[i] += 1
		end
	end
end
gamma = (0..bits.keys.max).map{|i| bits[i] > count / 2 ? 1 : 0}
epsilon = gamma.map{|i| 1 - i } #inverse 

print [gamma, epsilon].map{|s| s.join().to_i(2)}.inject(:*)
print "\n"
