def sum_to(num)
  if num < 1
    return nil
  end

  return 1 if num == 1
  num + sum_to(num - 1)
end

def add_numbers(arr)
  return arr.last if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  if num == 1
    return num
  end
  # puts num
  gamma = num - 1
  gamma * gamma_fnc(num - 1)
end


def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.last == favorite

  ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(str)
  return str if str.length <= 1

  reverse(str[1..-1]) + str[0]
end
