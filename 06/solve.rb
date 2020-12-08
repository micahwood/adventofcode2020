# frozen_string_literal: true

require 'set'

input = read_groups('./06/input.txt')

total = input.reduce(0) do |totals, answers|
  all_answers = Set.new(answers.gsub("\n", '').chars)
  totals += all_answers.length
end

puts total

total = input.reduce(0) do |totals, answers|
  all_answers = answers.split("\n").map(&:chars).reduce { |all, current| all & current }
  totals += all_answers.length
end

puts total
