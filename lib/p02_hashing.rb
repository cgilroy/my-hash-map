class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_sum = 0
    self.each_with_index do |el,idx|
      hash_sum += el.hash * idx.hash
    end
    hash_sum.hash
  end
end

class String
  def hash
    hash_sum = 0
    self.chars.each_with_index do |char,idx|
      hash_sum += char.ord.hash * idx.hash 
    end
    hash_sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_sum = 0
    self.each do |k,v|
      hash_sum += k.hash * v.hash
    end
    hash_sum.hash
  end
end
