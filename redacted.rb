puts "Words to process:"
input = gets.chomp

puts "Words to redact separated by a comma (no space):"
redact_input = gets.chomp.downcase

words = input.split(" ")
redact_words = redact_input.split(",")
redacted_string = "REDACTED"
redacted_output = "" 

words.each do |word|
    redacted = false
    for redact in redact_words do
        if word.downcase == redact then
            redacted_output += redacted_string
            redacted = true
            break
        end
    end
    if !redacted 
        redacted_output += word
    end
    redacted_output += " "
end

puts redacted_output