class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
  def initialize(word)
    @word = word
    @letter = letter
    @output = output
  end
  attr_accessor :word
  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess!(letter)
    self.word.include? letter
    self.letter = letter
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
       if self.output == self.word 
        puts "You have guessed the word"
       end
  end

  # Display the current state of the guessed word for the player.
  def output_word
    self.output = "_ "*@word.length
    puts self.output
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
    character.match(/[a-zA-Z]/)
  end
end

class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  def initialize
    @game_word = Word.new(word)
  end

  def ask_for_word
    puts "P1, what is your word?"
    @game_word = gets.chomp
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    while self.game_word.guessed_all_correct? == false
      puts "P2, guess a letter"
      letter = gets.chomp
      game_word.guess!(letter)
      puts game_word.output_word
  end
end

MysteryWordGame.new
