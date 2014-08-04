###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game. 
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
# 	-	Welcome the player to your game. Let them know who created the game. 
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################


## DEFAULTS

another_game = "y"
wins = 0.00
losses = 0.00
available_tries = 3


## DEFINE METHODS

def welcome
	puts "\n\nHi " + ENV['USER'] + "," +
	"\n\nWelcome to The Guessing Game, by Alfie.\n\nThe Rules: \n\n1) I'm going to pick a number between 1 and 10. \n2) You've got three tries to guess it. \n\nReady? Here we go...\n\n"
end

def set_random_number()
	secret_number = rand(1...10)
	# puts "hint: #{secret_number}"
	return secret_number
end

def get_guess(i)
	puts "Guess #{i+1}:\n\n"
	guess = gets.chomp.to_i
	return guess
end

def check_guess(secret_number, guess)
	if guess > secret_number
		response = "Too big!"
	elsif guess < secret_number
		response = "Too small!"
	elsif guess == secret_number
		response = "Right on!"
	end
	return response
end

def play_game
	welcome
	secret_number = set_random_number.to_i 
	i = 0
	response = ""
	while i < 3 && response != "Right on!"
		guess = get_guess(i).to_i
		response = check_guess(secret_number, guess)
		puts response 
		if i < 2 then puts "I'll give you #{2-i} more tries.\n\n"
		else puts "I'll give you 1 more try.\n\n"
		end
		i +=1
	end
	return response, secret_number
end

def show_stats(wins, losses)
	win_loss_ratio = ((wins/(wins+losses))*100).to_i
	play_count = (wins + losses).to_i
	puts "You've played #{play_count} games \n"
	puts "Your win/loss ratio is " + win_loss_ratio.to_i.to_s + "%\n\n"
end

def prompt_play_again
	puts "Care to play again? (y/n)"
	another_game = gets.chomp
	return another_game
end


## RUN GAME

while another_game == "y"
	game_outcome = play_game
	if game_outcome[0] == "Right on!"
		wins += 1
		puts "That's a win."
	else 
		losses += 1
		puts "Nice try. I was thinking of the number #{game_outcome[1]}.\n"
	end 
	show_stats(wins, losses) 
	another_game = prompt_play_again
end

## BYE

puts "Goodbye!"

