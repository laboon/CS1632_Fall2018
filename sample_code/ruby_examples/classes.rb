# Here is a class Dog.

class Dog

  # Here is the constructor for the object.  When you create a
  # Dog object via Dog::new, it will call this method.
  # Note that it accepts one argument, name, which it will set
  # as the name of this dog (stored in @name)
  # BUT you may not want to waste time thinking up dog names
  # all the time.  So if you do NOT pass in a name, the name
  # will be defaulted to "DEFAULT DOG".

  def initialize name="DEFAULT DOG"
    # Instance-level variable.  You can create instance-level
    # vars by prefixing them with @.
    @name = name
  end

  # Simple method with no parameters
  # Associated with Dog objects
  def bark
    puts "Bark bark bark"
  end

  # Sometimes you may not know how many arguments you are passing
  # in when constructing the method.  For instance, imagine a sum
  # function which accepts an arbitrary number of arguments and returns
  # their sum.  It will automatically convert them into an Array.

  def eat(*foods)
    foods.each { |f| puts "#{@name} is eating #{f}" }
  end

  # Used in string interpolation or can be explicitly called to
  # return a string version of this object
  # Similar to Java's .toString() method
  # Recall that methods do not need an explicit return value -
  # all statements in Ruby return SOMETHING and so the last
  # statement's value will be returned by the method as well

  def to_s
    "Doggy #{@name}"
  end

  private

  def play_candyland
    puts "I GET TO BE RED!"
  end

end

# Create a subclass of Dog, SuperDog, which eats in a super way.

# Note that class names are CamelCase, methods are snake_case.

class SuperDog < Dog

  # Overrides eat(*foods) in Dog superclass

  def eat(*foods)
    foods.each { |f| puts "#{@name} is SUPER eating #{f}" }
  end

end

# # EXECUTION STARTS HERE
# good_dog_1 = Dog::new
# good_dog_2 = Dog::new "Ms. Wooferson"

# puts "Good dog 1 (default): #{good_dog_1}"
# puts "Good dog 2: #{good_dog_2}"

# # Arbitary number of arguments here

# good_dog_1.eat "Dog food", "Crackers", "Pizza"
# good_dog_2.eat "Cereal"

# super_dog = SuperDog::new "Super Doggy"
# # Calls the .eat method on SuperDog, not Dog
# super_dog.eat "Superfood"

# # Calls the bark method on SuperDog, which does not exist
# # So Ruby goes to the superclass, Dog, and finds it there

# super_dog.bark

# # If Ruby goes all the way to BasicObject (top of object hierarchy) without
# # finding the method, it will raise a NoMethodError which will end the program.
# # Dogs don't meow.
# # super_dog.meow
