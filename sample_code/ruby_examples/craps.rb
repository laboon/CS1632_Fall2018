# craps.rb

# Create a class Die, with one method, roll, which will return a value
# from the range of 1..6

# Aside from minor syntactic differences, this is just like a regular
# Java class.  We have a constant POSSIBLE_VALUES and a method
# roll.

class Die

  # Turn the Range object (1..6) to an array with .to_a
  # This will allow us to use the Enumerable methods such as
  # .sample, which gives us a random element selected from
  # the POSSIBLE_VALUES array

  # Another way to do this would be rand(6) + 1
  
  POSSIBLE_VALUES = (1..6).to_a

  def roll
    POSSIBLE_VALUES.sample
  end
  
end

# Here are several methods that are not part of a class
# They can be called directly from anywhere in this file.  Think of them
# as "super-static" methods.

# Print a line of 20 asterisks followed by a carriage return

def print_line

  # print is like System.out.print (no carriage return)
  # puts is like System.out.println (implicit carriage return at end)
  
  # Print the '*' character 20 times to make a line
  20.times { print '*' }
  # Now add a carriage return
  # Note that EVERY statement in Ruby return something - this
  # returns "nil" and we can ignore it, but it is returned
  puts
end

# Print the results of a roll and return

def print_roll
  # Check this out - we are returning multiple values from roll!
  # Note that we are declaring and initializing the results here
  d1_val, d2_val = roll
  val = d1_val + d2_val
  print_line
  puts "Die 1 roll: #{d1_val}"
  puts "Die 2 roll: #{d2_val}"
  puts "Total     : #{val}"
  print_line
  # Note that the result of this statement - which is just the value of
  # val - will be return automatically
  val
end

def roll
  # Create two die instances and roll each one
  # Note that d1.roll is a _different_ method than just roll
  # d1.roll calls the role method on the d1 object (which is of class Die)
  # roll calls the regular method roll

  # Really there is no need to make two Die objects here, but it is
  # more in keeping with the spirit of the game of craps
  d1 = Die::new
  d2 = Die::new
  d1_val = d1.roll
  d2_val = d2.roll
  
  # Note you need an explicit return to return multiple values
  # You can do an implicit return of a single value by just having a line
  # at the end which results in the correct value, but this does not
  # work for multiple values.
  return d1_val, d2_val
end

# EXECUTION STARTS HERE

# Prints a prompt, then accepts a name from the user and trims off any
# leading/trailing whitespace (includes carriage returns, which are added
# when you press enter).  Almost always a good idea to include .chomp
print "Enter your name > "
name = gets.chomp

# game_status is of type symbol
# Think of symbols as "ad hoc enums" - they are like strings that
# are never displayed to the user but are used internally
# You could use strings but a) it is much slower b) it breaks semantic
# understanding - symbols are used to represent possible values, they
# are not really strings
game_status = :not_over

# Standard Boolean value
come_out = true

# The "point" is the value you need to reproduce if you do not win or
# lose in the first round of craps.
# At the beginning of the game, there is no point, so we set it to nil
# (similar to Java's null)
# Note that EVERYTHING is a class in Ruby, so even though this will
# eventually be an Integer, there is no need to worry about things like
# the difference between a Java primitive like int and a java.lang.Integer.
# It's fine to set something to nil that might later be just an integer
# or other "primitive" value since even "primitive" values are objects.
# This can be proven by typing 1.class in the irb REPL.
point = nil

# until is the "opposite" of a while loop
# It will continue looping _until_ the statement is truthy
# Another way to think of it - while (not statement) - keep looping
# while the statement is falsy
until (game_status != :not_over) do

  val = print_roll 
  
  if come_out
    come_out = false
    # case..when is similar to Java's switch..case, with some differences
    # 1: Use else instead of default
    # 2: No fall-throughs
    # 3: when statements can include lists (see below)
    # 4: when statements can be more complex (e.g. regular expressions)
    case val
    when 2, 3, 12
      game_status = :lose
    when 7, 11
      game_status = :win
    else
      point = val
    end
  else
    if val == 7
      game_status = :lose
    elsif val == point
      game_status = :win
    else
      # Do nothing, game is still in play
    end
  end
    
end

if game_status == :win
  puts "You win, #{name}!"
else
  puts "You lose, #{name}!"
end
