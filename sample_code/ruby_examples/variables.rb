# Variables act similar to variables in Java.
# In Ruby, though, all variables hold objects.  There are no "primitives" like
# int, char, etc.
# Variables are case-sensitive.  FOO, fOo, and foo are all different variables.
# Variables are generally snake_case (all lowercase, words separated by underscores)
# Use single-equals (=) for assignment, double-equals (==) for comparison

my_name = "Bill" # String
my_age = 39 # Integer
num_children = 1.0 # Float
likes_hoodies = true # TrueClass - Booleans are a little weird in Ruby!

# Ruby is dynamically typed - types are inferred at runtime
# Note there is nothing stopping us from doing the following:

my_age = 39

# This will print out (PUT String) the class of the my_age object
puts my_age.class # Will print out Integer

my_age = "XXXIX"

# my_age used to store an Integer, but now it stores a String
# This is actually very dangerous and a common cause of issues in complex
# Ruby programs!  You send an Integer when it expects a Float, for instance.
puts my_age.class # Will now print out String

# Arithmetic operates generally as you expect from Java
a = 1
b = 2
c = 3
puts a + 2 # prints 3
puts b - 2 # prints 0
puts a * b # prints 2
puts c / b # prints 1

# !!!- to force floating point division, make sure you have a Float
# This is similar to casting as a float in Java, e.g.
# int a = 1; int b = 2;
# float f = (float) a / b;
# In Ruby, can convert to Float with .to_f
# can convert to Integer with .to_i
puts c / b # prints out 1
puts c.to_f / b # prints 1.5
puts c % 2 # prints 1

# There are no ++ or -- operators - use "a += 1"
# a-- would result in a syntax error
puts a
a += 1
puts a # prints 2

# Any variable can also be nil, which is similar to Java's null
# I do not have a dog, so this reference is nil
my_dog = nil

# Unlike Java's null, though, nil is a true object which has its own methods!
puts nil.class # prints NilClass

# Convert to Float
puts my_dog.to_f # prints 0.0

# Arrays are just like any other object and have numerous helper methods

good_birds = ["Jazzy", "Tonic", "Ton-Dog", "Method"]
num_good_birds = good_birds.count # returns number of elements in array
puts "Number of good birds = #{num_good_birds}"
puts "Even more good birds = #{num_good_birds + (100.to_f / 2 - 6)}"

# Ranges are a set of values from one number to another
num_range = 1..10
puts num_range.count # prints 10
puts "My range is : #{num_range.to_a}"

# You can convert a range to an array using .to_a
# This will be useful since you can do many more things with an array
# than a range, but we will discuss those later

num_range_arr = num_range.to_a

puts num_range_arr

# Hashes (aka HashMaps, aka dictionaries, aka associative arrays) are used
# quite often in Ruby.  Hashes act like arrays, except instead of indexing
# by number,
# 0 -> "Dog"
# 1 -> "Cat"
# 2 -> "Bird"
# you can index them by anything, e.g.:
# Person -> Integer (age)
# Integer (id number) -> Cat
# Course -> Instructor

instructors = Hash::new
instructors["CS1632"] = "Laboon"
instructors["CS1530"] = "Chang"
instructors["CS1501"] = "Farnan"
a1502_instructors = Hash::new
a1502_instructors["class1"] = "Tan"
a1502_instructors["class2"] = "Max"
instructors["CS1502"] = a1502_instructors
puts "Who teaches CS1632?"
puts instructors["CS1632"]
puts "List of classes and instructors"
puts instructors
puts "1502-class2 #{instructors["CS1502"]["class2"]}"

# Booleans are kind of odd.  TrueClass and FalseClass are two separate classes.
t = true
puts t.class # prints TrueClass
f = false
puts f.class # prints FalseClass

# This is fine, though, because Ruby does not check for boolean values directly
# It checks if something is _truthy_ or _falsy_
# true is truthy, and false is falsy, but there are all kinds of other things that
# Ruby can interpret as truthy or falsy!  Unlike Java, which will yell at you
# if you try to check the truthiness or falsiness of a value.
# In Ruby, generally EVERYTHING counts as true EXCEPT false and nil - even things like
# the empty string and 0, which in other language may be considered falsy.

# Note that we are introducing conditionals here (if statements) which operate
# very similar to Java.  See conditionals.rb for more details.

if true
  puts "true is truthy"
else
  puts "true is falsy"
end

if false
  puts "false is truthy"
else
  puts "false is falsy"
end

if nil
  puts "nil is truthy"
else
  puts "nil is falsy"
end

if 0
  puts "0 is truthy"
else
  puts "0 is falsy"
end

if 1
  puts "1 is truthy"
else
  puts "1 is falsy"
end

empty_string = ""

if empty_string
  puts "empty_string is truthy"
else
  puts "empty_string is falsy"
end

if (1 + 1)
  puts "2 is truthy"
else
  puts "2 is falsy"
end
