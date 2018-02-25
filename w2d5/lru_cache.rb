
class LRUCache

  attr_reader :cache, :max

   def initialize(max)
     @cache = []
     @max = max
   end

   def count
     cache.length
   end

   def add(el)
     if cache.include?(el)
       cache.delete(el)
       cache << el
     elsif cache.count == max
       cache.unshift
       cache.push(el)
     else
       cache.push(el)
     end
   end

   def show
     p cache
     nil# shows the items in the cache, with the LRU item first
   end

   # private
   # helper methods go here!

end
