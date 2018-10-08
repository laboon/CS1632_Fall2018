class Namer

  # Constructor - store the name passed in as an argument
  def initialize(name)
    @name = name
  end

  # Return the number of characters
  def num_chars
    @name.split('').count
  end

  # Return the uppercase version of the name
  # Examples:
  # "bob" should be returned as "BOB"
  # "JaNeT" should be returned as "JANET"
  # "SUZIE" should be returned as "SUZIE"
  def upcase
    @name.upcase
  end

  # Return the name in uppercase with three exclamation points behind it
  # Example:
  # "joe" should be return "JOE!!!"
  def excite
    @name.upcase + '!!'
  end

  # If name is longer than 15 characters, it is considered long,
  # and should return true.  Otherwise return false.
  # Examples:
  # "Anna" has 4 characters, should return false
  # "Jimbornikantano" has exactly 15 characters, should return false
  # "Picadillyslimbobdoodly" has 22 characters, should return true
  def long?
    @name.length >= 15
  end

  # If > 25% of all characters are Z or X (case-insensitive), it is futuristic
  # Examples:
  # Bubba is not futuristic (0/5 letters, 0%, are Z or X)
  # Bozo is not futuristic (1/4 letters, exactly 25% are Z or X.. must be > 25%)
  # Zax is futuristic (2/3 letters, 66%, are Z or X)
  # Zaxa is futuristic (2/4 letters, 50%, are Z or X)
  # Zzzxx is futuristic (5/5 letters, 100%, are Z or X)
  def futuristic?
    num_zs = @name.split('').select { |c| c.downcase == 'z' }.count
    num_xs = @name.split('').select { |c| c.downcase == 'x' }.count
    total = num_chars
    (num_zs.to_f / total) > 0.25 || (num_xs.to_f / total) > 0.25
  end
end
