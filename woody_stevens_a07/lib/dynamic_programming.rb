class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {1=>[[1]], 2=>[[1,1],[2]], 3=>[[1, 1, 1], [1, 2], [2, 1],[3]]}
    @super_cache = {1=>[[1]], 2=>[[1,1],[2]], 3=>[[1, 1, 1], [1, 2], [2, 1],[3]]}
  end

  def blair_cache(n)
    cache = {1 => 1, 2 => 2}

    (3..n).each do |num|
      next_blair = cache[num - 1] + cache[num - 2] + ((2 * (num - 1)) - 1)
      cache[num] = next_blair
    end

    cache
  end

  def blair_nums(n)
    return 1 if n == 1
    return 2 if n == 2
    cache = blair_cache(n)

    cache[n]
  end

  def frog_hops_bottom_up(n)
    return [[1]] if n == 1
    return [[1, 1], [2]] if n == 2
    return [[1, 1, 1], [1, 2], [2, 1], [3]] if n == 3

    cache = frog_cache_builder(n)

    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
              1 => [[1]],
              2 => [[1, 1], [2]],
              3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
            }

    (4..n).each do |num|
      cache[num] = []

      (1..3).each do |steps_jumped|
        prev_row = cache[num - steps_jumped]
        prev_row.each do |prev_step_count|
          new_prev_row = prev_step_count.dup
          new_step_count = new_prev_row << steps_jumped
          cache[num] << new_step_count
        end

      end

    end

    cache
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]
    cache_1 = frog_hops_top_down(n-1).map {|arr| arr + [1] }
    cache_2 = frog_hops_top_down(n-2).map {|arr| arr + [2] }
    cache_3 = frog_hops_top_down(n-3).map {|arr| arr + [3] }
    @frog_cache[n] = cache_1 + cache_2 + cache_3
    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    return 1 if n === 1
    return frog_hops_top_down_helper(n - 1)
  end

  def super_frog_hops(n, k)
      return [[1]*n] if k == 1
      k = n if k > n
      frog = frog_hops_top_down_helper(n)
      return nil if n > 999
      return @super_cache[n] if @super_cache[n]
      value = []
      n.downto(2) do |idx|
        if k >= (n-idx+1)
          value += super_frog_hops(idx-1,k).map {|arr| [n-idx+1] + arr }
        end
      end
      @super_cache[n] = value
      @super_cache[n]
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
