class Word
    # Stores the provided word in an instance variable and
    # setups up any other instance variables.
    # attr_accessor :word :lives :answers
    def initialize(word)
      @characters = word.split('')
      @displayed_character = @characters.map { |char| '_' }
      @guessed_letter = []
    end
  ​
    # Guess a letter in the word.
    # Should return a boolean. true if the letter is in the word, false if not.
    def guess?(letter)
      if @guessed_letter.include?(letter)
        puts "You already guessed that letter!"
        return
      end
      @guessed_letter << letter
  ​
      found = false
      if @characters.include?(letter)
        found = true 
        puts "Yes that letter is in the word!"
      else
        puts "Wrong answer!"
      end 
  ​
      @characters.each_with_index do |char, index|
        if char == letter
          @displayed_character[index] = letter
        end
      end
      found
    end
  ​
    # Whether all letters in the word have been guessed correctly.
    def guessed_all_correct?
      @displayed_character.all? { |char| char != '_' }
    end
  ​
    # Display the current state of the guessed word for the player.
    def output_word
      puts @displayed_character.join('')
    end
  ​
    # Check whether a provided character is a letter
    def self.is_letter?(character)
      !'qwertyuiopasdfghjklzxcvbnm'.include?(character)
  ​
      # or
      # !"#{(a..z)}".to_s.include?(character)
    end
  end
  ​
  class MysteryWordGame
    # Initialize any state in the game, and start the game loop.
    def initialize
      @lives_left = 10
      ask_for_word
      game_loop
    end
  ​
    def ask_for_word
      puts "What is the word? Player 2 look away..."
      word = gets.chomp
      @word = Word.new(word)
      50.times { puts }
    end
  ​
    # Run the game loop, which continues until the player wins or loses.
    def game_loop
      loop do 
        puts "The word is "
        @word.output_word 
        puts "You have #{@lives_left.to_s} lives left"
        puts "Guess a letter:"
        letter = gets.chomp
  ​
        if Word.is_letter?(letter)
          puts "You need to give me a letter!"
          next
        end
  ​
        if letter.length !=1
          puts "please guess one letter at a time!"
        end
  ​
        good_guess = @word.guess?(letter)
        if !good_guess
          @lives_left -= 1
        end
        if @lives_left == 0
          puts "You lost :("
          break
        end
        if @word.guessed_all_correct? 
          puts "You won! :) The word is: "
          @word.output_word
          break
        end
  ​
      end
  ​
    end
  end
  ​
  MysteryWordGame.new