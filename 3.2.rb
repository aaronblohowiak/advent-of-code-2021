
lines = File.open('3.input').map(&:strip)

length = lines.first.length

oxygen = Proc.new{|tied, common, uncommon| tied ? 1 : common }
co2 = Proc.new{|tied, common, uncommon| tied ? 0 : uncommon }


ratings = [oxygen, co2].map do |handler|
 candidates = lines

 #build the answer by accumulating a prefix
 accumulator = ""

 #for each bit, extend the prefix according to the rules 
 (0..length-1).each do |i|
  candidates = candidates.select{|l| l.start_with?(accumulator)}.sort
  if candidates.length == 1
    accumulator = candidates.first
    break
  else
   tied = candidates.length % 2 == 0 && candidates[candidates.length / 2 - 1][i] != candidates[candidates.length / 2 ][i] 
   common_bit = candidates[ candidates.length / 2][i].to_i

   uncommon_bit = if candidates.first[i] == candidates.last[i]
     common_bit
   else
     1 - common_bit
   end

   next_bit = handler.call(tied, common_bit, uncommon_bit)

   accumulator += next_bit.to_s
  end
 end
 accumulator
end

print ratings.map{|r| r.to_i(2)}.inject(:*).to_s + "\n"
