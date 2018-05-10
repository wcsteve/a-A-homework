class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}

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
    return [[1]] if n == 1
    return [[1, 1], [2]] if n == 2
    return [[1, 1, 1], [1, 2], [2, 1], [3]] if n == 3

    return  frog_hops_top_down_helper(n - 1) +
            frog_hops_top_down_helper(n - 2) +
            frog_hops_top_down_helper(n - 3)
  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
