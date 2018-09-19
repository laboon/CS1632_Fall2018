# Note - generally, you will want to _raise_ and _rescue_ exceptions,
# not _throw_ and _catch_ them.  Confusingly, Ruby also has _throw_ and
# _catch_ keywords but they operate differently!  I will discuss below.

def raise_an_exception
  puts "Going to cause an exception."
  # If you include a string, this is a generic RuntimeError
  # It is not rescued.
  # An un-rescued exception will cause the current Ruby process
  # to exit with error code 1 (error code 0 indicates normal
  # execution, anything else something anomalous)
  # You can view the error code of a process in most Unix-like
  # systems by typing echo $? at the prompt after execution.
  raise "I am the exception"
  puts "This line will never be executed"
end

# We will do something here which causes an exception - call a
# method which does not exist.
# Kernel is a module contains the "core" Ruby methods - e.g.
# puts, putc, exit, system, etc.
# It does not, sadly, contain a laboonify method.
# Thus, Ruby will raise a NoMethodError, even without an explicit
# raise as seen above.
def cause_an_exception_indirectly
  # method does not exist
  Kernel.laboonify
end

def raise_but_rescue

  # array full of commands we want to execute
  commands = ['puts "meow"', 'puts "bark"', 'lalala', 'puts "tweet"']
  # think of this as the equivalent of
  # try {
  #   ...
  # catch (Exception ex) {
  #   ...
  # }

  # Note that "rescue" is really just short for
  # rescue StandardError
  # or in other words, all general run-time errors
  begin
    # for each command, call eval on it
    # This means "execute the following string"
    # eval allows us to metaprogram - self-writing code!
    # Read "Metaprogramming in Ruby" or see my talk on some
    # of the cool things you can do with metaprogramming
    # https://vimeo.com/80366788

    # Since 'lalala' is not valid Ruby, a NameError will be
    # raised during the third command
    commands.each { |cmd| eval cmd }
  rescue
    # but we rescue here (kind of like catching in Java)
    puts "Could not execute a command!  Ending!"
  end

end

# There is some syntactic sugar, if you use rescue with no
# block above, it is the same as if you had "begin" at the
# beginning of the method
# In other words, the following two methods are exactly
# equivalent.

def method_one
  begin
    raise "some error"
  rescue
    puts "got an error"
  end
end

def method_two
  raise "some error"
rescue
  puts "got an error"
end

# You can reference the exception by the following syntax (just
# as you might do catch (Exception e) { e.printStackTrace() } in
# Java.

def see_exception
  raise "foo"
rescue StandardError => se
  puts "Found an error of type #{se.class}:"
  puts se.to_s # to_s converts it to a string
end

# Generally you want to only rescue StandardErrors (and their
# subclasses.  Why?
# Exception means ANY kind of exception, including a syntax error!
# If that happens, you generally want to just have your program
# exit (not always, of course!)

# Unless you have a REALLY good reason, such as writing your
# own REPL, you should never write:
# rescue Exception => e

# Let's see why...

def rescue_exception_bad
  argle bargle gaschnargle
rescue Exception => e
  puts "Got exception '#{e}', continuing..."
end

# You can make your own exceptions by subclassing StandardError
# (which is a subclass of Exception, but Exception covers things
# that are also more serious/system-oriented such as NoMemoryError.
# Generally, exceptions that you create should be subclasses of
# StandardError.

class BillError < StandardError
  # Boring class, nothing special about it
end


def raise_a_bill_error
  raise BillError::new
rescue StandardError => e
  puts "Got an error of type #{e.class}"
end

# You can do different things based on the type of exception

class BirdError < StandardError
end

class CatError < StandardError
end


def rescue_multiple_errors
  1 / 0
rescue CatError => ce
  puts "Got a CatError, meow meow"
rescue BirdError => be
  puts "Got a BirdError, tweet tweet"
rescue StandardError => se
  puts "Got an error of class #{se.class}"
  raise CatError::new
end

# As mentioned in the preface to this file, throw...catch do
# something different than in Java.  They are basically flow
# control - allowing you to break out of deeply nested loops,
# for instance.

# When you throw a symbol (like :end_prematurely), Ruby will
# go up the stack looking for a corresponding catch of that
# symbol and send execution there.

# This mechanism tends to be rarely used in the Ruby world
# but it can't hurt to know about it.

def throw_catch_example
  catch (:end_prematurely) do
    (0..100).each do |x|
      (0..100).each do |y|
        (0..100).each do |z|
          # When the following conditions hold, this will end the loop
          # as it will go the catch line above
          throw :end_prematurely if x == 9 && y == 9 && z > 10
          puts "x: #{x} y: #{y} z: #{z}"
        end
      end
    end
  end
end

# If you throw something which is not caught, you will get an
# UncaughtThrowError!  If this is not rescued, your program will
# then end with error code 1.

def throw_no_catch_example

  # Note typo here - "ed_prematurely"
  # Otherwise this method is the same as throw_catch_example, above
  # Note typos are a common issue in Ruby code!
  catch (:ed_prematurely) do
    (0..100).each do |x|
      (0..100).each do |y|
        (0..100).each do |z|
          # When the following conditions hold, this will end the loop
          # as it will go the catch line above
          throw :end_prematurely if x == 9 && y == 9 && z > 10
          puts "x: #{x} y: #{y} z: #{z}"
        end
      end
    end
  end
end
