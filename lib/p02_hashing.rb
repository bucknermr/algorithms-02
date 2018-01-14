class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    map(&:hash).join.hash
  end
end

class String
  def hash
    chars.map(&:ord).join('0').to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.map(&:hash).inject(:+).hash
  end
end
