
# [1,2,4,3]

# [false, true, true, true, true, false].include?() => O(1)

class MaxIntSet
  attr_reader :store
  def initialize(max=nil)
    @store = []
    if max > 0 && !max.nil?
      (0..max).each do |i|
        @store << false
      end
    end
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < @store.length
  end

  def validate!(num)
    
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        new_store[num % new_store.length] << num
      end
    end
    @store = new_store    
  end
end
