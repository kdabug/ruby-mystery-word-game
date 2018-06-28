class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
  def initialize(word)
  end

  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess!(letter)
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
  end

  # Display the current state of the guessed word for the player.
  def output_word
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
  end
end

class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  def initialize
  end

  def ask_for_word
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
  end
end

MysteryWordGame.new
