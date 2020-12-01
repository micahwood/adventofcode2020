# frozen_string_literal: true

nums = read_input('./1.txt')

until nums.empty?
  x = nums.pop
  y = nums.find { |y| x + y == 2020 }
  p x * y if y
end

puts 'part 2'
nums = read_input('./1.txt')

until nums.empty?
  x = nums.pop
  nums.each do |y|
    z = nums.find { |z| x + y + z == 2020 }
    p x * y * z if z
  end
end
