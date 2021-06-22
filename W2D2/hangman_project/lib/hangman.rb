require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader(:guess_word, :attempted_chars, :remaining_incorrect_guesses)

  def initialize
    @secret_word = Hangman.random_word()
    p @secret_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end


  def self.random_word()        # !!!
    DICTIONARY.sample
  end


  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end


  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|ele, i| indices << i if ele == char}
    indices
  end


  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
    p @guess_word  
  end


  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      p @guess_word
      @attempted_chars << char
      self.fill_indices(char, self.get_matching_indices(char))
      @remaining_incorrect_guesses -= 1 if self.get_matching_indices(char).length == 0
      return true
    end
  end


  def ask_user_for_guess
    p "Enter a char:"
    try_guess(gets.chomp())
  end


  def win?
    # debugger
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    false
  end


  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    return false
  end


  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end
end
