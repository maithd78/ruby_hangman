require_relative 'libs/dictionary'
require_relative 'libs/game'
puts Time.now

# when game.new is called get a word 5~12 letters long from the dictionary and assign it as the secret code.
# the secret will be cloned into an array.
# create a display_code with its size set to the lenght of the secret code
# until limbs(or something) == 0 do,
# the player will input a letter(case insensitive(can use .downcase?))
# loop_with_index through the secret code clone
# and each time the input is present in the secret_code
# remove the letter from the secret_code_clone and assign it to the display_code[index]
# index being the current index of the loop
# if there are any matches display the current display_code
# and any used letters
# if there were no matches limbs - 1

# create a class for the player that is initialized when game.new is called
# start the player with 5 lives or hp

# when game.new is initialized assign a variable called deciphered? ???

# how many classes? 2 is enough for hangman as it is very simple
# Game and Player
# maybe a class for drawing the hangmangi?

game = Game.new
game.play_game
