#!/usr/bin/ruby

# Complete hangman game
# Open a Terminal window 80 x 25 characters in size
# Hiding the screen, User A enters a word and hands the computer to User B. 
# User B tries to guess the word with the usual rules. 
# Charlie Hill

# ==========================================================
# C O N S T A N T S   &   G L O B A L   V A R I A B L E S

Alphabet = "abcdefghijklmnopqrstuvwxyz"

# ==========================================================
# M E T H O D S

# Method to get a single, valid, letter
def get_letter (letters_used)
	last_input_was_good = false
	print "Guess a letter: "
	while true do  
		input = gets.chomp
		# Error if already tried
		if letters_used[input] 
			puts "You've already tried that letter!"
		# Error if more than one character
		elsif input.length != 1
			puts "Just one letter at a time, please!"
		# Error if not in alphabet, allowing for uppercase or lowercase
		elsif !Alphabet.include? input.downcase
			puts "Alphabetical characters only, please!"
		# Input is good, so return it
		else
			return input
		end
		# Input wasn't good so prompt the user to try again
		print "Try again! Guess a letter: "
	end
end

# Method to draw a text-only hangman matching the current progress
def draw_hangman(wrong_letters_count, hangman_string, margin)
	s = ""
	case wrong_letters_count
	when 0
		hangman_string[1] = margin + "   |    | "
	when 1
		hangman_string[2] = margin + "   |    O "
	when 2
		hangman_string[3] = margin + "   |    | "
	when 3
		hangman_string[3] = margin + "   |   -| "
	when 4
		hangman_string[3] = margin + "   |   -|-"
	when 5
		hangman_string[4] = margin + "   |   /  "
	when 6
		hangman_string[4] = margin + "   |   / \\"
	end
	hangman_string.each { |str| puts str }
end

# Method to draw the current state of the hangman, the letters used, and the puzzle word
def draw_state(letters_found, letters_used, wrong_letters_count, hangman_string, margin)
	12.times { puts }
	# Draw the hangman
	draw_hangman(wrong_letters_count, hangman_string, margin)
	1.times { puts }
	# Draw the letters used
	print margin + "  Letters used: "
	for s in letters_used do  
		if s[1]
			print s[0].upcase
		end 
	end
	2.times { puts }
	print margin + "  "
	# Print the letters found in the puzzle word
	letters_found.each { |s| print s.upcase + " " }
	4.times { puts }
end

# ==========================================================
# M A I N   P R O G R A M 

# Welcome message
puts "Welcome to Hangman"

# Get the word then clear the screen for the second user
print "What is the word? "
word = gets.chomp
25.times { puts } 

# Create an array matching the input word with an "_" in each slot 
letters_found = Array.new(word.length)
for i in 0...word.length
	letters_found[i] = "_"
end

# Make a hash of all letters and set the value of each letter to false
letters_used = Hash.new

for i in 0..26 
	letters_used[Alphabet[i]] = false
end

# Prepare to count the letters that are not in the puzzle word
wrong_letters_count = 0 

# Create the initial state of the hangman as an arrage of strings
margin = "                  "
hangman_string = Array.new(6)
hangman_string[0] = margin + "   ______"
hangman_string[1] = margin + "   |     "
hangman_string[2] = margin + "   |     "
hangman_string[3] = margin + "   |     "
hangman_string[4] = margin + "   |     "
hangman_string[5] = margin + "  _|_    "

# Draw the initial state
draw_state(letters_found, letters_used, wrong_letters_count, hangman_string, margin)

# Main input loop: 
# Get a letter from the user, redraw the hangman, and break when done or dead 
while wrong_letters_count <6 do 
	# Get a valid letter from the user
	guess = get_letter(letters_used)
	# Update the list of used characters 
	letters_used[guess] = true
	# If the guess is present in the string, update the letters_found, 
	# otherwise increment the wrong_letters_count
	if word.include? guess
		for i in 0...word.length
			if word[i] == guess
				letters_found[i] = guess
			end
		end
	else
		wrong_letters_count +=1
	end
	# Test whether the puzzle is done (if a single found_char is "_" then it's not) 
	complete = true
	letters_found.each { |char| 
		if char == "_"
			complete = false
			break
		end	
	}
	# If it is complete then it's time to exit the main loop, and wrap up
	if complete 
		break
	end

	# Draw the new state of the hangman, the letters used, and the puzzle string
	draw_state(letters_found, letters_used, wrong_letters_count, hangman_string, margin)
end

# Redraw the final state
draw_state(letters_found, letters_used, wrong_letters_count, hangman_string, margin)

# If the puzzle if complete then print a victory message
if complete 
	print "\n\n  You did it!"
# Otherwise, print a crushing message of defeat
else
	print "  Bummer. Your man is hanged!\n"
	print "  Correct answer: " + word
end

print "\n\n"
