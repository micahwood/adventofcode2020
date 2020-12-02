# frozen_string_literal: true

passwords = read_input('./02/input.txt', false)

valid_count = 0

def valid_password?(min, max, letter, password)
  count = password.count(letter)
  count >= min && count <= max
end

def valid_password_take_2?(first, second, letter, password)
  found_first = password[first - 1] == letter
  found_second = password[second - 1] == letter
  found_first ^ found_second
end

passwords.each do |password|
  rule, password = password.split(': ')
  rule, letter = rule.split(' ')
  min, max = rule.split('-')
  # valid_count += 1 if valid_password?(min.to_i, max.to_i, letter, password)
  valid_count += 1 if valid_password_take_2?(min.to_i, max.to_i, letter, password)
end

p valid_count
