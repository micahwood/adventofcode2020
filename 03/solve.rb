# frozen_string_literal: true

map = read_input('./03/input.txt', false).map(&:chars)

# trees = map.each_with_index.reduce(0) do |count, (row, index)|
#   count += 1 if row[index * 3 % row.length] == '#'
#   count
# end
def traverse(map)
  trees = map.each_with_index.reduce(0) do |count, (row, index)|
    count += 1 if row[yield(index, row)] == '#'
    count
  end
  trees
end

skip_two_rows_map = map.select.with_index { |_, i| i.even? }

totals = [
  traverse(map) { |index, row| index * 3 % row.length },
  traverse(map) { |index, row| index * 1 % row.length },
  traverse(map) { |index, row| index * 5 % row.length },
  traverse(map) { |index, row| index * 7 % row.length },

  traverse(skip_two_rows_map) { |index, row| index * 1 % row.length }
]
p totals.reduce(:*)
