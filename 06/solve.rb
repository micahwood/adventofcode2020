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

any_answered_yes = 0
all_answered_yes = 0
input.each do |group|
  answers = group.split("\n").map { |person| Set.new(person.chars) }
  any_answered_yes += answers.reduce(:union).size
  all_answered_yes += answers.reduce(:intersection).size
end
p [any_answered_yes, all_answered_yes]
