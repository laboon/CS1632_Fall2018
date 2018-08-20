class Fizzbuzz

  # Given a value n, returns a string representation of what
  # the fizzbuzz-ified version of that number should be
  # If number is evenly divisible by 3 and 5, should return "fizzbuzz"
  # If number is evenly divisible by 3 but not by 5, should return 'fizz'
  # If number is evenly divisible by 5 but not by 3, should return 'buzz'
  # If number is not evenly divisible by 3 or 5, return a string representation of that number
  # If something other than an integer is passed in, return nil
  
  def value n
    return nil unless n.is_a? Integer
    fizzy = (n % 3).zero?
    buzzy = (n % 5).zero?
    if fizzy && buzzy
      'fizzbuzz'
    elsif fizzy
      'fizz'
    elsif buzzy
      'buzz'
    else
      n.to_s
    end
  end
  
end
