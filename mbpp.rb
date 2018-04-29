#!/usr/bin/env ruby

def process_include(source, from, to)
  if source.match('http')
    # Remote File
  else
    # Local file
    # file = File.open(source, "r")
    # puts file.read
    # file.close
    lines = IO.readlines(source)
    lines.each_with_index do |line, index|
      if index >= from - 1 && index <= to - 1
        puts line
      end
    end
  end
end

ARGF.each_line do |e|
  if e.match('!include')
    # Process the include.
    command = e.split(" ")
    process_include(command[1].delete('"'), command[2].to_i, command[3].to_i)
  else
    # Copy line as is.
    puts e
  end
end
