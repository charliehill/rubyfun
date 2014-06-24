print "some words, please: "
input = gets.chomp

frequencies = Hash.new (0)

# For every letter in the input, add 1 to the value of the key for that letter in the frequencies hash
for i in 0...input.length 
	frequencies[input[i]] += 1
end

# Sort the frequencies by count
frequencies = frequencies.sort_by do |letter, count| 
    count
end

frequencies.reverse!

# Print the histogram
frequencies.each do |letter, freq| 
    print letter + " " 
    # print histogram for frequency
    freq.times { print "=" }
    print "\n"
end

puts
