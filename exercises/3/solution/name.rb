require_relative 'namer'

# EXECUTION STARTS HERE

raise "Enter one argument only" if ARGV.count != 1

namer = Namer.new ARGV[0]
puts "Uppercase name: #{namer.upcase}"
puts "Number of characters: #{namer.num_chars}"
puts "Excited name: #{namer.excite}"
puts "Is name long? #{namer.long? ? 'yes' : 'no'}"
puts "Is name futuristic? #{namer.futuristic? ? 'yes' : 'no'}"



