# All kinds of fun ways to determine a Fibonacci number

require 'flamegraph'

class Fibonacci

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

# EXECUTION STARTS HERE
raise "Enter a single nonnegative integer i to determine the Fibonacci sequence up until the ith number" unless ARGV.count == 1 && ARGV[0].to_i >= 0
max = ARGV[0].to_i

Flamegraph.generate('flamefile.html') do

  (0..max).each do |f|
    puts "#{f}: #{Fibonacci.lookup_table_fib(f)} Lookup table method"
    puts "#{f}: #{Fibonacci.closed_form_fib(f)} Closed-form method"
    puts "#{f}: #{Fibonacci.closed_form_no_rounding_fib(f)} Closed-form (no rounding) method"
    puts "#{f}: #{Fibonacci.brute_force_fib(f)} Brute force method"
    puts "#{f}: #{Fibonacci.loop_fib(f)} Loop method"
    puts "#{f}: #{Fibonacci.recursive_fib(f)} Recursive method"
    20.times { print '*' } ; puts
  end

end
