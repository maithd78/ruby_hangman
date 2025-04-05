# Player class
class Player
  attr_accessor :lives

  def initialize
    @lives = 5
  end

  def player_guess
    puts "you have #{@lives} guesses left"
    puts 'guess a letter'
    @current_guess = gets.chomp.downcase until @current_guess.length(1) && current_guess.match?(/\A[a-z]\z/)
  end
end
