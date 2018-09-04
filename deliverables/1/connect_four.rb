require_relative 'game.rb'

# Print the usage message to STDOUT and then exit the program
# Note that it exits with code 1, meaning there was an error
# (0 is generally used to indicate "no error")

def show_usage_and_exit
  puts 'Usage:'
  puts 'ruby connect_four.rb *x*'
  puts '*x* should be a nonnegative integer'
  exit 1
end

# Returns true if and only if:
# 1. There is one and only one argument
# 2. That argument, when converted to an integer, is nonnegative
# Returns false otherwise
# If any errors occur (e.g. args is nil), just return false - we are
# going to exit anyways, so no need for more detailed categorization
# of the error

def check_args(args)
  args.count == 1 && args[0].to_i > 0
rescue StandardError
  false
end

# EXECUTION STARTS HERE

# Verify that the arguments are valid

valid_args = check_args ARGV

# If arguments are valid, create a new game of size x (first and only argument)
# Then play it!
# Otherwise, show proper usage message and exit program

if valid_args
  x_size = ARGV[0].to_i
  g = Game.new x_size
  g.play
  g.show_results
else
  show_usage_and_exit
end
