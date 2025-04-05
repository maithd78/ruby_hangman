require_relative 'dictionary'
require_relative 'player'
require_relative 'gamestate'
require 'yaml'
require 'pry-byebug'
# Class for game rules.
class Game
  def initialize
    @dict = Dictionary.new
  end

  def new_game
    @player = Player.new
    @secret_code = @dict.word_list.sample
    @display_code = Array.new(@secret_code.length) { |_index| ' _ ' }
    if File.exist?('save.yaml')
      puts 'to load game press[1] else press anything to start a new game'
      load_game if gets.chomp == '1'
    end
    @secret_code_array = @secret_code.chars
    puts "The word to guess is #{@secret_code.length} letters long"
    sleep(1)
  end

  def play_game
    new_game
    puts 'you may press 2 at any round to save the game'
    sleep(1)
    play_round until @player.lives.zero? || @player.code_cracked
    sleep(1)
    end_game
  end

  def play_round
    puts @display_code.join(',')
    @player.player_guess
    if @player.current_guess == '2'
      save
    elsif @secret_code_array.none?(@player.current_guess)
      not_in_secret_code
    elsif @secret_code_array.include?(@player.current_guess)
      matches_found
    end
  end

  def not_in_secret_code
    @player.lives -= 1
    puts 'not in code'
    sleep(0.5)
  end

  def matches_found
    @display_code.each_index do |index|
      @display_code[index] = @player.current_guess if @secret_code_array[index] == @player.current_guess
      @player.code_cracked = true if @display_code == @secret_code_array
    end
    return unless @player.code_cracked == true

    puts @display_code.join
    puts 'you cracked the code'
  end

  def end_game
    puts "The word was #{@secret_code}"
    puts 'play again?[y/n]'
    puts 'didnt get that' until %w[y n].include?(@play_again = gets.chomp.downcase)
    sleep(2) && play_game if @play_again == 'y'
  end

  def save
    @save = Gamestate.new(@secret_code, @player.lives, @display_code)
    File.truncate('save.yaml', 0)
    @save_file = File.new('save.yaml', 'w')
    @save_file.puts(@save.to_yaml)
    puts 'game saved'
  end

  def load_game
    @save_file = File.open('save.yaml', 'r')
    @data = YAML.load @save_file # rubocop:disable Security/YAMLLoad
    @secret_code = @data[:secret_code]
    @player.lives = @data[:lives]
    @display_code = @data[:display_code]
  end
end
