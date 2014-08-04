#Gabriel Appleby
#6/23/14

#Introductions
def intro()
    puts "Welcome the secret number game! \nWhat is your name?"
    name = gets.chomp.to_s
    puts "Hi " << name << "!\nYou must guess a number between 1 and 10, and have only three tries to do so."
    
    
end


#Tests to see if guess is correct, returns if guess is higher, lower, or correct
def tester(random_number, guess)
    if random_number > guess
        return "Your guess was a bit too low"
    elsif random_number < guess
        return "Your guess was a bit too hight"
    else
        return "Correct!"
    end
end


#Main
intro
secret_number = 6 #Creates a variable with the value 6
x = 0 #Creates an variable with the value 0
while (x < 3) #While x is less than 3
    puts "You have " << (3-x).to_s << " guess(es) left."
    guess = gets.chomp.to_i #Grabs user input and converts to an integer
    if guess > 0 && guess < 11
        answer = tester(secret_number, guess) #finds out if the guess is higher, lower, or correct
        puts answer;
        if answer == "Correct!" #if the answer is correct, stop the loop
            x = 6
        end
        x = x + 1
    else
        puts "Please pick a number between 1 and 10..."
    end
end
if (x == 3)
    puts "Sorry, better luck next time. \nThe secret number was: " << secret_number.to_s << "."
end


