good_dogs = ["Domino", "Remy",
             "Mr. Barkerson", "Schaeffer",
             "Hector", "Dozer"]

# We may want to operate on all of the elements inside and convert them to
# other elements by applying a function held in a block.

# Note the dog parameter surrounded by pipes (|'s).  This is Ruby's way of giving
# you access to the passed-in argument.
# Read this as: for all good_dogs, run the following method:
# def transform dog
#   dog.upcase
# end

uppercase_dogs = good_dogs.map { |dog| dog.upcase }
uppercase_dogs.each { |dog| puts "uppercase dog: #{dog}" }

# We can combine these elements using reduce.  You need to send the
# symbol for the operation in.
# It's map/reduce!
uppercase_dogs = good_dogs.map { |dog| dog.upcase }
combined_uppercase_dogs = uppercase_dogs.reduce(:+)
puts combined_uppercase_dogs

# We may want to select a random dog using sample
puts "Giving dog #{good_dogs.sample} a treat"

# We may want to select only dogs which match a specific pattern using select
puts "Short-named dogs:"
short_named_dogs = good_dogs.select { |dog| dog.size < 6 }
short_named_dogs.each { |dog| puts dog }

# Filter out dogs which match a specific pattern using reject
puts "Not-short-named dogs:"
not_short_named_dogs = good_dogs.reject { |dog| dog.size < 6 }
not_short_named_dogs.each { |dog| puts dog }

# Check if an array includes a value
puts good_dogs.include? "Bobby" # prints false
puts good_dogs.include? "Remy" # prints true
