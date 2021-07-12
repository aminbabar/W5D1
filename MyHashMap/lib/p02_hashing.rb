class Integer
  # Integer#hash already implemented for you
end

# [1,2] => 1241245241
# [2,1] => 3244252431

# [1,2]
# [2,1]

class Array
  def hash
    new_num = 0
    self.each_with_index {|ele, i| new_num = (new_num ^ ele) * i}
    return new_num.hash
  end
end

class String
  def hash
    alph = ('A'..'z').to_a
    new_num = 0
    self.each_char.with_index {|ele, i| new_num = (new_num ^ alph.index(ele)) * i}
    return new_num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_num = 0
    self.each {|k, v| new_num = (new_num ^ k.hash) }
    return new_num.hash
  end
end
