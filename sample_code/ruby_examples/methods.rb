# Methods can be declared with def...end

def yay_bill
  puts "Bill is great!"
end

# Defining a method is just another function!  So we can intermingle execution and
# function definition!

yay_bill

# Define another method
# Add parameters like so:

def yay(name)
  # Interpolate string - performs .to_s on variable name and adds it in
  # the appropriate place in the string
  puts "#{name} is great!"
end

# Note that we can pass in any kind of variable
# Note that parentheses are optional unless needed for syntactical reasons
# e.g yay("Joe").class
# ^- This may seem like a hard concept and it's difficult to have hard and fast
# rules because Ruby does not have an explicit BNF definition
# But it will be easier to use in practice

yay("Bob")
yay(1)
yay "Joe"

def double_yay(name_1, name_2)
  puts "#{name_1} and #{name_2} are great!"
end

double_yay "Jane", "Jill"

# Note that all methods are functions and return the result of the last function

def laboonify(a, b)
  puts "Laboonifying #{a} and #{b}"
  a * 2 + b
  return a, b
end

b = laboonify 1, 2
puts b

# You can have an explicit return for early exit
# It is optional if it is the last statement in a function
# In other words, if the last line was "return false", it would do the
# exact same thing
def is_great(name)
  if name == "Bill"
    return true
  elsif name.length > 6
    return true
  end
  false
end

# puts "Is Bill great? " + is_great("Bill").to_s
# puts "Is Veronica great? #{is_great("Veronica")}" # No need for .to_s if interpolated
# puts "Is Archie great? #{is_great("Archie")}"
