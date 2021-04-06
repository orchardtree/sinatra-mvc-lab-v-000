require 'pry'

class PigLatinizer
  attr_accessor :phrase
  
  def initialize(phrase = nil)
    @phrase = phrase
  end
  
  def piglatin
    @t
  end
  
  def piglatinize(phrase)
    phrase_ary = phrase.split(" ")
    piglatin_ary = phrase_ary.collect do |word|
      handle_piglatin(word)
    end
    @t = piglatin_ary.join(" ")
  end
  
  def handle_piglatin(word)
    @word = word
    case word
      when /\A[aeiouAEIOU]/
        new_word = letters_after(0) + "way"
      when /\A[p](l|r)/
        new_word = letters_after(2) + first_letters(2) + "ay"
      when /\A[t][h]/
        new_word = letters_after(2) + first_letters(2) + "ay"
      when /\A[s][p][r]/
        new_word = letters_after(3) + first_letters(3) + "ay"
      else
        new_word = letters_after(1) + first_letters(1) + "ay"
    end    
  end
  
  def first_letters(i)
    i -= 1
    @word[0..i]
  end
  
  def letters_after(i)
    ii = @word.length
    @word[i..ii]
  end
end