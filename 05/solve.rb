# frozen_string_literal: true

passports = read_input('./05/input.txt', false).map(&:chars)

highest = 0
seats = Array.new(128 * 8)

def find_position(direction, min, max)
  half = (min + max) / 2
  direction == 'F' || direction == 'L' ? [min, half] : [half + 1, max]
end

def find(tree, min = 0, max = 127)
  direction = tree.shift
  return find_position(direction, min, max)[0] if tree.empty?

  find(tree, *find_position(direction, min, max))
end

passports.each do |passport|
  row = find(passport[0...7])
  seat = find(passport[7..-1], 0, 7)
  seats[seat + 8 * row] = '.'
  seat_id = (row * 8) + seat
  highest = seat_id if seat_id > highest
end

p highest
seat = seats.find_index.each_with_index do |seat, index|
  next if index == 0

  seat.nil? && seats[index + 1] && seats[index - 1]
end
p (seat / 8) * 8 + (seat % 8)
