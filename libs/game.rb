require_relative 'dictionary'
require_relative 'player'
# Class for game rules.
class Game
  def initialize
    # @player = Player.new
    @dict = Dictionary.new
  end

  def new_game
    @player = Player.new
    @secret_code = @dict.word_list.sample
    @secret_code_array = @secret_code.chars
    @display_code = Array.new(@secret_code.length) { |index| " #{index + 1} " }
    puts 'lets play hangman'
    puts "The word to guess is #{@secret_code.length} letters long"
  end

  def play_game
    new_game
    until @player.lives.zero?
      puts @display_code
      @player.player_guess
    end
  end
end
