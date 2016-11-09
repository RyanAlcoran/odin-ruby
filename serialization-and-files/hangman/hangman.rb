class Hangman
  puts "Welcome to Hangman!"
  attr_accessor :correct_guesses, :incorrect_guesses, :answer, :turns

  def intialize
    @correct_guesses = []
    @incorrect_guesses = []
    @answer = []
    @turns = 6
  end

  def get_word
    word_list = []
    File.open("5desk.txt").readlines.each do |line|
      if line.strip.length >= 5 && line.strip.length <= 12
        word_list << line.strip
      end
    end
    word_list.sample.split("")
  end

  def display(answer)
    answer.each do |letter|
      if @correct_guesses.include? letter
        print "#{letter} "
      else
        print "_ "
      end
    end
    puts
    puts "Incorrect guesses: #{incorrect_guesses.join(', ')}"
    puts "Number of tries left: #{num_of_guess}"
  end

  def guess
    print "Guess a letter: "
    input = gets.chomp
  end

  @answer = get_word

  display(@answer)
end