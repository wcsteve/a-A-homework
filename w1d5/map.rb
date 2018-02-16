class Map
#As you saw in the videos for tonight, a map can be implemented using a 2D array.
# Let's write a Map class (following a similar pattern to Stack and Queue)
# that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys
# are always unique. When implemented with arrays, a map might look
# something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods:
# assign(key, value), lookup(key), remove(key), show. Note that the assign
# method can be used to either create a new key-value pair or update the
# value for a pre-existing key. It's up to you to check whether a key
# currently exists!


  def initialize
    @dict = []
  end

  def element_index(key)
    @dict.each_index do |idx|
      return idx if @dict[idx][0] == key
    end
  end

  def assign(key, value)
    if @dict.none?{|pair| pair[0] == key}
      @dict << [key,value]
    else
      index_to_change = element_index(key)
      @dict[index_to_change] = [key, value]
    end
  end

  def show
    @dict
  end

  def remove(key)
    index_to_delete = element_index(key)
    @dict.delete_at(index_to_delete)
  end

end
