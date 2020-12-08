# frozen_string_literal: true

def read_input(path, to_i = true)
  lines = File.readlines(path, chomp: true)
  lines = lines.map(&:to_i) if to_i
  lines
end

def read_groups(path)
  File.read(path).split("\n\n")
end
