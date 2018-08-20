# All kinds of fun ways to determine a Fibonacci number
# You can choose!

class FibonacciSelect

  PHI = (1 + Math.sqrt(5)) / 2
  LOOKUP_TABLE = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811]

  # NOTE: the self. defines the following methods as class and not
  # instance methods (i.e. they are associated with class Fibonacci
  # and not a particular instance of it - like static methods
  # in Java)

  
  def self.recursive_fib(x)
    if (x == 0) then 
      0
    elsif (x == 1 or x == 2) then
      1
    else 
      recursive_fib(x - 1) + recursive_fib(x - 2)
    end
  end

  def self.loop_fib(x) 
    if (x == 0) then
      0 
    elsif (x == 1 or x == 2) then
      1
    else
       n1, n2, cur = 1, 1, 0
      (x - 2).times do 
        cur = n1 + n2
        n2, n1 = n1, cur
      end
      cur
    end
  end

  def self.lookup_table_fib(x)
    if (x < LOOKUP_TABLE.length) then
      LOOKUP_TABLE[x]
    else
      nil
    end
  end

  def self.closed_form_fib(x)
    ((PHI ** x) / (Math.sqrt(5))).round
  end

  def self.closed_form_no_rounding_fib(x)
    (((PHI ** x) / (Math.sqrt(5))) + 0.5).floor
  end

  def self.brute_force_fib(x)
    if (x == 0) then
      0
    elsif (x == 1 or x == 2) then
      1
    else
      cur = 1
      loop do
        cur += 1
        if (Math.log(((cur * Math.sqrt(5)) + 0.5), PHI).floor == x) then
          return cur
        end
      end
    end
  end

end

POSSIBLE_ALGOS = ['lookup', 'cf', 'cfnr', 'brute', 'loop', 'recursive']

def display_error_and_exit
  puts "Enter two arguments:"
  puts "1 - nonnegative integer equaling maximum Fibonacci number to generate"
  print "2 - algorithm to use ("
  POSSIBLE_ALGOS.each { |pa| print " #{pa} " }
  puts ")"
  exit 1
end


# EXECUTION STARTS HERE
display_error_and_exit unless ARGV.count == 2 && ARGV[0].to_i >= 0 && POSSIBLE_ALGOS.include?(ARGV[1])
max = ARGV[0].to_i
algo = ARGV[1]

case algo
when 'lookup'
  (0..max).each do |f|
    puts "#{f}: #{FibonacciSelect.lookup_table_fib(f)} Lookup table method"
  end
when 'cf'
  (0..max).each do |f|  
    puts "#{f}: #{FibonacciSelect.closed_form_fib(f)} Closed-form method"
  end
when 'cfnr'
  (0..max).each do |f|
    puts "#{f}: #{FibonacciSelect.closed_form_no_rounding_fib(f)} Closed-form (no rounding) method"
  end
when 'brute'
  (0..max).each do |f|
    puts "#{f}: #{FibonacciSelect.brute_force_fib(f)} Brute force method"
  end
when 'loop'
  (0..max).each do |f|
    puts "#{f}: #{FibonacciSelect.loop_fib(f)} Loop method"
  end
when 'recursive'
  (0..max).each do |f|
    puts "#{f}: #{FibonacciSelect.recursive_fib(f)} Recursive method"
  end
end

