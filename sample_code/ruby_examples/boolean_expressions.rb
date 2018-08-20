# Boolean expressions in Ruby work similar to Java.
# You can use == for equality check, != for not equals, <, <=, >=, > etc.

if 2 > 1
  puts "2 is greater than 1"
else
  puts "math is broken!"
end

if 1 != 8
  puts "1 is not the same as 8"
else
  puts "eating one cookie and eight cookies is the same thing!"
end

# Note that strings are compared, even if they are separate string.
# This is unlike non-interned strings in Java which may be separate objects
# and thus not "==" even if they are .equals() to each other.
if "Bill" == "Bill"
  puts "Tautologies are true!"
else
  puts "logic is broken!"
end

# You can use the and (&&), or (||), and not (!).

if !false
  puts "the opposite of false is true"
else
  puts "the opposite of false is false"
end

awesome = true
cool = true

if awesome && cool
  puts "I am awesome and cool"
else
  puts "Well, I am missing at least one attribute."
end

cold = true
snowing = false

if cold || snowing
  puts "I should put on a coat"
else
  puts "It's not cold and not snowing, no need for a coat"
end

# Ruby also has xor (^) but its activity depends on the classes of the operands.
# If used on Numeric types, it acts as a bitwise xor (xor's the bits of the values)
puts 2 ^ 3

# If used on other types, it acts as a Boolean xor
puts true ^ false # prints true
puts true ^ true # prints false
