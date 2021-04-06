require 'pry'

class PigLatinizer
  attr_accessor :phrase
  
  def piglatinize(phrase)
    @phrase = phrase
    phrase_ary = @phrase.split(" ")
    piglatin_ary = phrase_ary.collect do |word|
      handle_piglatin(word)
    end
    test = piglatin_ary.join(" ")
    test
    #binding.pry
  end
  
  def handle_piglatin(word)
    @word = word.chomp
    case word
      when /\A[aeiouAEIOU]/
        new_word = letters_after(0) + "way"
      when /\A[p](l|r)/
        new_word = letters_after(2) + first_letters(2) + "ay"
      when /\A[t][h]/
        new_word = letters_after(2) + first_letters(2) + "ay"
      when /\A[s][k]/
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