# Player class
class Player
  attr_accessor :lives, :code_cracked
  attr_reader :current_guess

  def initialize
    @lives = 5
    @code_cracked = false
  end

  def player_guess
    puts "you have #{@lives} guesses left"
    puts 'guess a letter'
    @current_guess = gets.chomp.downcase
  end
end
