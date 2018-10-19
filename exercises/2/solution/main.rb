require_relative "graph.rb"
require_relative "node.rb"

g = Graph::new

loop do
  g.print
  begin
    print "Enter new node id (or q to quit)> "
    id = gets.chomp
    if id == "q"
      break
    else
      id = id.to_i
    end
    print "Enter neighbors (separated by commas) > "
    neighbors = gets.chomp.split(',').map { |x| x.to_i }
    puts "main: n = #{neighbors}"
    n = Node::new id, neighbors
    g.add_node n
  rescue StandardError => se
    puts "I don't understand.  Try again."
  end
end

if g.pseudograph?
  puts "Congratulations, you created a pseudograph"
else
  puts "You did not create a pseudograph"
end
