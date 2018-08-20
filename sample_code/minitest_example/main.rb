# Inspired by https://github.com/fteem/minitest-intro

# Note that you should try to write Ruby in such a way that comments
# are unnecessary.  I am adding lots here but once you get the hang
# of Ruby, you will find that it reads much like English and you can
# comment much less than in Java!

# This is the equivalent of the "importing" in Java
# require_relative means "relative to the directory OF THIS FILE"
# require means "relative to the working directory"
require_relative 'predictor'

# raise is similar to "throw" in Java
# unless is the "opposite" of "if" in Java
# ARGV is like String[] args in Java
# So this says "raise a new exception entitled 'Enter a question'
# if ARGV.count is 0 (or less, although this should not happen)
# i.e., if no arguments are entered from the command line
raise "Enter a question" unless ARGV.count > 0

# ARGV is an array (note that we did not declare it, it just "magically"
# appears in every Ruby program.  We join together all of the elements
# in the array and separate them with spaces.  For example, assume
# ARGV is ["a", "b", "c"].  ARGV.join would return "a b c".
question = ARGV.join(" ")

# puts is the equivalent of System.out.println
# This is similar to:
# System.out.println("Your question is " + question);
# Note that we don't concatenate directly like we would do in Java -
# we use string _interpolation_ (i.e. inserting the string inside of
# #{} to print it out).  This is the "Ruby way", although you could also
# do this as:
# puts "Your question is " + question
# This is frowned upon, though, as it is slower and could be confusing

puts "Your question is: '#{question}'"

# Here we make a Predictor object.  This is similar to:
# Predictor p = new Predictor();
# in Java.
p = Predictor::new

# Call the shake and ask methods on the Predictor object p.
# Look, Ma, no parentheses!  They are not necessary if you only have
# one argument and it cannot be parsed any other way.  Generally avoid
# parentheses unless necessary.

puts p.shake
puts p.ask question
