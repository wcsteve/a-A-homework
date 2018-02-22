def sluggish_octopus(fishes)
  longest = fishes[0]

  (0...fishes.length - 1).each do |idx|
    biggest = false
    (1...fishes.length).each do |idx2|
      if fishes[idx].length > fishes[idx2]
        biggest = true
      else
        biggest = false
      end
    end

    longeset = fishes[idx] if biggest == true
  end
end


class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| x <=> y }

    return self if count <= 1

    pivot = self.length / 2
    sorted_left = self.take(pivot).merge_sort(&prc)
    sorted_right = self.drop(pivot).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant_octopus(fishes)
  fishes.merge_sort.last
end

def clever_octopus(fishes)
  longest = fishes[0]

  fishes.each do |fish|
    longest = fish if fish.length > longeset
  end

  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def dancing_octpus(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if direction == tile
  end
end

TILES_ARRAY = {
  "up" => 0,
  "right-up" => 1,
   "right"=> 2,
   "right-down" => 3,
   "down" => 4,
   "left-down" => 5,
   "left" => 6,
   "left-up" => 7
 }

def constant_dance(direction)
  TILES_ARRAY[direction]
end
