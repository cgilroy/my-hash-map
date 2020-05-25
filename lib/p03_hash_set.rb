class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    num = key.hash
    if !self.include?(key)
      self[num] << num 
      @count += 1
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(num)
  end

  def remove(key)
    num = key.hash
    if self.include?(key)
      self[num].delete(num)
      @count += -1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets*2) { Array.new }

    old_store.each do |bucket|
      bucket.each do |el|
        self[el] << el
      end
    end
  end
end
