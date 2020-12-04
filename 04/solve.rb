# frozen_string_literal: true

passports = read_input('./04/input.txt', false)
# throw an empty line for the last passport
passports << []

valid_passports = []
current_passport = {}

def valid_passport?(passport)
  missing_fields = (%w[byr iyr eyr hgt hcl ecl pid cid] - passport.keys)
  if missing_fields.empty? || (missing_fields.length == 1 && missing_fields[0] == 'cid')
    return true
  end

  false
end

passports.each do |info|
  if info.empty?
    valid_passports << current_passport if valid_passport?(current_passport)
    current_passport = {}
    next
  end

  fields = info.split
  fields.each do |field|
    key, value = field.split(':')
    current_passport[key] = value
  end
end

p valid_passports.length

def extra_valid?(passport)
  valid_count = 0
  valid_eyes = %w[amb blu brn gry grn hzl oth]

  valid_count += 1 if passport['byr'].to_i.between?(1920, 2002)
  valid_count += 1 if passport['iyr'].to_i.between?(2010, 2020)
  valid_count += 1 if passport['eyr'].to_i.between?(2020, 2030)
  valid_count += 1 if passport['pid'].length == 9
  valid_count += 1 if valid_eyes.include?(passport['ecl'])
  valid_count += 1 if passport['hcl'] =~ /#[\w]{6}/

  height, measure = passport['hgt'].split(/(cm|in)/)
  if measure == 'cm'
    valid_count += 1 if height.to_i.between?(150, 193)
  elsif measure == 'in'
    valid_count += 1 if height.to_i.between?(59, 76)
  end

  valid_count == 7
end

p valid_passports.select { |passport| extra_valid?(passport) }.length
