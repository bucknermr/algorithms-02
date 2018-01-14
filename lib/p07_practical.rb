require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  letters = HashMap.new
  string.each_char do |ch|
    if letters.include?(ch)
      letters[ch] += 1
    else
      letters[ch] = 1
    end
  end

  odds = 0

  letters.each do |_, v|
    if v.odd?
      odds += 1
      return false if odds > 1
    end
  end

  true
end
