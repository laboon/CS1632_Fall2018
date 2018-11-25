# Ruby Monkey Simulator

require 'flamegraph'

require_relative 'banana.rb'
require_relative 'monkey.rb'
require_relative 'monkey_list.rb'

# EXECUTION STARTS HERE

Flamegraph.generate('monkey_sim.html') do

  raise "Enter starting monkey number as an argument" unless ARGV.count == 1
  size = ARGV[0].to_i
  ml = MonkeyList::new size
  rounds = ml.start size
  puts "Took #{rounds} round#{'s' unless rounds == 1} to complete!"

end
