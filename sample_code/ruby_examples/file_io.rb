# If argument count (from command line) is not equal to 2, then raise
# an exception (which will end the program)
raise "Enter input and output file" unless ARGV.count == 2

# Otherwise, set first file as input and second as output
input_file, output_file = ARGV[0], ARGV[1]

# create an empty array, lines

lines = []

# Open file input_file in read-only mode

File.open(input_file, "r").each_line do |line|
  # For each line read from the file, append that line ( << ) to
  # the lines array.
  # We also chomp, which trims carriage returns
  lines << line.chomp
end

# Inform the user if the number of lines to be converted are

if lines.count.even?
  puts "Processing an even number of lines! (#{lines.count})"
else
  puts "Processing an odd number of lines! (#{lines.count})"
end

# For each line, print it to the console after:
# 1. Converting the entire line to upper-case
# 2. Reverse it
# 3. 'Squeezing' all 'runs' of letters (e.g., doggy -> dogy,
# bookkeeper -> bokeper, mooooooooooooo -> mo)

converted_lines = lines.map { |line| line.upcase.reverse.squeeze }

def anonymous_fn line
  return line.upcase.reverse.squeeze
end

# Open output file write-only access
File.open(output_file, "w") do |file|
  # For each line in the array, write it to the file
  converted_lines.each do |line|
    file.write(line)
    file.write("\n")
  end
end
