# Note that we require and start simplecov before
# doing ANYTHING else, including other require statements.
require 'simplecov'
SimpleCov.start

# Previous code starts here!

require 'minitest/autorun'

require_relative 'graph'

class GraphTest < Minitest::Test

  # Special method!
  # This will run the following code before each test
  # We will re-use the @g instance variable in each method
  # This was we don't have to type g = Graph::new in each test

  def setup
    @g = Graph::new
  end

  # Remember tests must start with test_ !

  # A very simple test to get you into the swing of things!
  # Creates a graph, refutes that it's nil, and asserts that it is a
  # kind of Graph object.

  def test_new_graph_not_nil
    refute_nil @g
    assert_kind_of Graph, @g
  end

  # This is a "regular" add node test.
  # We are checking to see if we add a node, does the graph report
  # the correct number of nodes.
  # Note though that we now have a dependency on the Node class now,
  # even though we are testing

  def test_add_node
    n = Node::new 1, [2,3]

    @g.add_node n

    assert_equal @g.num_nodes, 1

  end


  # Create a node which is not part of the graph and refute (opposite
  # of assert) that it is in the graph.  That is, if we do not add
  # to the graph, it should not be in there
  def test_has_node_dummy_with_obj
    nonexistent_node = Node.new 1, [2]
    refute @g.has_node? nonexistent_node
  end


  # Verify that adding one node makes our count one.

  def test_add_node_double
    n = Node.new 1, [1]
    @g.add_node n
    # Assert
    assert_equal 1, @g.num_nodes
  end

  # Verify that an empty node prints out "Empty graph!" when
  # print method is called.

  def test_print_empty
    assert_output(/Empty graph!/) { @g.print }
  end


end
