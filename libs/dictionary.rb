# Class to hold words for game
class Dictionary
  attr_reader :word_list

  def initialize
    @word_list = []
    File.foreach('google-10000-english-no-swears.txt') do |line|
      @word_list.push(line) if line.chomp!.length.between?(5, 12)
    end
  end
end
