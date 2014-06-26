#!/usr/bin/ruby

# Complete hangman game
# Open a Terminal window 80 x 25 characters in size
# Hiding the screen, User A enters a word and hands the computer to User B. 
# User B tries to guess the word with the usual rules. 
# This version models the game by manipulating strings. 
# Charlie Hill

# ==========================================================
# C O N S T A N T S   &   G L O B A L   V A R I A B L E S

# The alphabet 
Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# Left margin when drawing the current game state 
Margin = "                  "

# ==========================================================
# M E T H O D S

# Method to get a single, valid, letter
def get_letter (letters_tried)
	last_input_was_good = false
	print "Guess a letter: "
	while true do  
		input = gets.chomp.upcase
		# Error if already tried
		if letters_tried.include? input
			puts "You've already tried that letter!"
		# Error if more than one character
		elsif input.length != 1
			puts "Just one letter at a time, please!"
		# Error if not in alphabet, allowing for uppercase or lowercase
		elsif !Alphabet.include? input
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
def draw_hangman(wrong_letters_count, hangman_string)
	s = ""
	case wrong_letters_count
	when 0
		hangman_string[1] = " |    | "
	when 1
		hangman_string[2] = " |    O "
	when 2
		hangman_string[3] = " |    | "
	when 3
		hangman_string[3] = " |   -| "
	when 4
		hangman_string[3] = " |   -|-"
	when 5
		hangman_string[4] = " |   /  "
	when 6
		hangman_string[4] = " |   / \\"
	end
	hangman_string.each { |str| puts Margin + str }
end

# Method to draw the current state of the hangman, the letters used, and the puzzle word
def draw_state(letters_found, letters_tried, wrong_letters_count, hangman_string)
	12.times { puts }
	# Draw the hangman
	draw_hangman(wrong_letters_count, hangman_string)
	2.times { puts }
	# Draw the letters used
	if letters_tried.length >0 
		print Margin + "Letters tried: " + letters_tried.upcase
	end
	2.times { puts }
	# Print the letters found in the puzzle word
	print Margin
	letters_found.each_char { |c| print c.upcase + " " }
	4.times { puts }
end

# ==========================================================
# M A I N   P R O G R A M 

# Run games repeatedly
while true

	# Welcome message
	25.times { puts } 
	puts "Welcome to Hangman"
	puts

	# Get the word then clear the screen for the second user
	last_input_was_good = false
	while !last_input_was_good
		print "What is the word? "
		word = gets.chomp.upcase
		last_input_was_good = true
		if word[/[^ABCDEFGHIJKLMNOPQRSTUVWXYZ]/] != nil
				puts "Please enter a single word with no spaces or special characters"
				last_input_was_good = false		
		end
	end

	25.times { puts } 

	# Create a string matching the input word, replacing every letter with an underscore 
	letters_found = String.new(word)
	for i in 0...word.length 
		letters_found[i] = "_"
	end

	# Make am empty string to hold the letters tried
	letters_tried = ""

	# Create counter for wrong letters
	wrong_letters_count = 0

	# Create the initial state of the hangman as an arrage of strings
	hangman_string = Array.new(6)
	hangman_string[0] = " ______"
	hangman_string[1] = " |     "
	hangman_string[2] = " |     "
	hangman_string[3] = " |     "
	hangman_string[4] = " |     "
	hangman_string[5] = "_|_    "

	# Draw the initial state
	draw_state(letters_found, letters_tried, wrong_letters_count, hangman_string)

	# Main input loop: 
	# Get a letter from the user, redraw the hangman, and break when done or dead 
	while wrong_letters_count < 6 do 
		# Get a valid letter from the user
		guess = get_letter(letters_tried).upcase
		letters_tried += guess
		# If the guess is present in the string, update the letters_found
		if word.include? guess
			for i in 0...word.length
				if word[i] == guess
					letters_found[i] = guess
				end
			end
		else
			wrong_letters_count += 1
		end
		# Test whether the puzzle is done (if letters_found includes "_" then it's not) 
		if letters_found.index("_") == nil
			complete = true
		else
			complete = false
		end	
		# If it is complete then it's time to exit the main loop, and wrap up
		if complete 
			break
		end

		# Draw the new state of the hangman, the letters used, and the puzzle string
		draw_state(letters_found, letters_tried, wrong_letters_count, hangman_string)
	end

	# Redraw the final state
	draw_state(letters_found, letters_tried, wrong_letters_count, hangman_string)

	# If the puzzle if complete then print a victory message
	if complete 
		print Margin + "You did it!"
	# Otherwise, print a crushing message of defeat
	else
		print Margin + "Bummer. Your man is hanged!\n"
		print Margin + "Correct answer: " + word
	end

	2.times { puts } 
	gets
	2.times { puts } 
end
puts "________________________________________________________________________________"
puts
