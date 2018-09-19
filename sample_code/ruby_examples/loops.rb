# loop loops around forever until you break
# This is kind of like a while(true) in Java.

# Note the do..end.  This is a code block.  Think of it as similar to { ... } in Java.
j = 1

puts "loop loop"
loop do
  puts j
  j = j + 1
  break if j > 10
end

# Ruby has while loops
# This will keep doubling j until it is 100 or more

j = 2
puts "while loop"
while j < 100
  puts j
  j *= 2
end

# Ruby has "anti-while" loops called "until" loops
# These will execute while the expression is FALSE

j = 10

# Keep subtracting and printing UNTIL j is 0

puts "until loop"
until j == 0
  puts j
  j -= 1
end

j = 10

puts "while not loop"
while !(j == 0)
  puts j
  j -= 1
end

# There are for loops, with nicer syntax than Java.
# Note that 1..10 is a special class of object called a Range.
# Also note that technically this for loop is actually a foreach, we are
# just "hiding" that by using a range - we will talk about that below.
puts "for loop"
for j in 1..10 do
  puts j
end

# We can make this exclude the final value (acting like a standard Java
# loop by using three dots instead of two.

puts "for loop - only counts to 9"
puts "for loop"

for j in 1...10 do
  puts j
end

# All Ruby for loops are actually foreach loops - they enumerate over a
# set of values.  We simply used a range in the previous example to be
# the set of value to enumerate over.

# Note the following uses string interpolation.  String interpolation
# allows you to print variables as part of a larger string.

good_dogs = ["Domino", "Remy", "Mr. Barkerson"]

for dog in good_dogs do
  puts "#{dog} is a good dog!"
end

# That said, for loops tend to be not very Ruby-like.  Instead, we will
# often _enumerate_ on a list (such as an array) and do things to do it.
# This can be done by using .each and then a block of how we want to
# operate on the data

good_dogs.each { |dog| puts "#{dog} is a good dog!" }

good_dogs.each_with_index { |dog, n| puts "#{n}: #{dog} is a good dog!" }
