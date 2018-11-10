require 'flamegraph'

def problematic_method n
  (0..1000).to_a.map { |y| y ** 300 }.reduce(:+)
end

def no_problem_here n
  n * 2
end


def calc n
  a = problematic_method n
  b = no_problem_here n
  a + b
end

def do_boring_stuff n
  @a = (0..n).to_a.map { |x| x ** 4 }.reduce(:+)
end

raise "Enter one positive integer argument" unless ARGV.count == 1
c = ARGV[0].to_i

Flamegraph.generate('flamegrapher.html') do

  5000.times do
    do_boring_stuff 5
  end

  puts @a

  c.times do |n|
    s = calc n
    puts s
  end

end
