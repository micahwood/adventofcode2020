# frozen_string_literal: true

nums = read_input('./01/input.txt')

until nums.empty?
  x = nums.pop
  y = nums.find { |y| x + y == 2020 }
  if y
    p x * y
    break
  end
end

puts 'part 2'
nums = read_input('./01/input.txt')

until nums.empty?
  x = nums.pop
  nums.each do |y|
    nums - [y]
    z = nums.find { |z| x + y + z == 2020 }
    if z
      p x * y * z
      break
    end
  end
end

puts 'Joe\'s memo solution'
nums = read_input('./01/input.txt')

memo = {}

nums.each do |x|
  y = 2020 - x
  if memo[x]
    p x * y
    break
  end
  memo[y] = y
end
