#require 'byebug'
class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
  attr_reader :word, :guesses

  def initialize(word)
    @word = word
    @guesses = []
  end

  def lives_left
    wrong_guesses = @guesses.map { |char| !@word.include? char }
      .length
    @word.length - wrong_guesses + 1
  end

  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess!(letter)
    !word.include? letter
    @guesses.push(letter)
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
    @word.chars.all? { |char| @guesses.include? char }
  end

  # Display the current state of the guessed word for the player.
  def output_word
    @word.chars.map { |char| @guesses.include?(char) ? char : "_" }
      .join("")
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
    character.match(/[a-zA-Z]/)
  end
end

class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  def initialize
    @game_over = false
    @word = Word.new(ask_for_word)
    game_loop
  end

  def ask_for_word
    puts "Enter a word to start the game"
    gets.chomp
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    until @game_over
      puts "You have #{@word.lives_left} lives left"
      puts "The Current word guesses: #{@word.output_word}"
      puts "Take a guess"
      guess = gets.chomp
      @word.guess!(guess)
      puts "You guessed #{guess}"
      if @word.guessed_all_correct?
        puts "A Winner is You!"
        @game_over = true
      elsif @word.lives_left <= 0
        puts "You lost!"
        @game_over = true
      end
    end
  end
end

MysteryWordGame.new