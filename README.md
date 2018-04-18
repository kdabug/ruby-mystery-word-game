# Mystery Word Game Lab

Let's build a mystery word game in Ruby!

In Mystery word:

*   One player sets a MyStERy WoRD at the beginning of the game
*   The game shows the current mystery word, with underscores showing for each character that is still a mystery.
*   The second player guesses one letter in each round
*   If the letter is in the word, that letter is revealed in the word
*   If the letter is not in the word, the player loses one life

Here's what a game of Mystery Word should look like:

```
What is the word? Player 2 look away...
dog




The word is
___
You have 3 lives left
Guess a letter:
o
Yup, the word includes that letter!

The word is
_o_
You have 3 lives left
Guess a letter:
r
Oh no! The word doesn't include that letter!

The word is
_o_
You have 2 lives left
Guess a letter:
d
Yup, the word includes that letter!

The word is
do_
You have 2 lives left
Guess a letter:
g
Yup, the word includes that letter!
You won! The word is
dog
```

## Some technical requirements

*   Make a `MysteryWordGame` class, which takes care of the game loop
*   Make a `Word` class that is responsible for the state of the letter guesses, and displaying the current state of the mystery word

## Bonus

*   Validate the user's input. If the user enters a non-alphabetical character, ask them to.
*   If the user enters more than one letter at a time, tell them that's not okay.
