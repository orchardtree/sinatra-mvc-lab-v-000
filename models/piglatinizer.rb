require 'pry'

class PigLatinizer
  attr_accessor :text
  
  def initialize(text = nil)
    @text = text
    binding.pry
  end
  
  def piglatinize(text)
    text_ary = @text.split(" ")
    piglatin_ary = text_ary.collect do |word|
      handle_piglatin(word)
    end
    piglatin_ary.join(" ")
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