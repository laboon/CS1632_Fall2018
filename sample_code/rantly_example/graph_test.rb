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

  # We are using a dummy node which is just nil, because we don't
  # really care what happens to that node.  We're just adding something,
  # just as if we were adding a real node, but we are looking at it
  # from the Graph g's perspective and then graph G goes away at the
  # end of the method.
  # So now we are able to test this by passing in a dummy node and
  # see if no exception is raised.
 
  
  def test_has_node_dummy
    dummy_node = nil
    refute @g.has_node? dummy_node
  end

  # Since this can be confusing (what if you are actually testing
  # what happens if nil is sent in?), usually you will make an object
  # or a "plain mock" if you want a dummy.
 
  def test_has_node_dummy_with_obj
    dummy_node = Minitest::Mock.new("test node")
    refute @g.has_node? dummy_node
  end

  
  # Sometimes, though, a dummy isn't enough, because we need a real
  # object of the right class there.  This is where we can use a
  # test double with a stub.
  # This allows us to bypass any issues in the doubled class.
  # Even if id on node does not work, graph - the
  # actual code under test - can still be tested!
  # Create a double (many frameworks - including Minitest do not
  # make a big differentiation between mocks and doubles.  But
  # remember - a true mock is a subclass of test double which
  # does verification ("expects" calls)

  
  def test_add_node_double
    # Make a mock named "node"
    # This can be named anything you want
    n = Minitest::Mock.new("test_node")
    # Define a  method specifically for this object - this
    # method definition does NOT impact the class "Node"!
    def n.id; 1; end
    # Add node to graph.  When .id is called on n in the Graph
    # .add_node method, it will actually call our stub
    @g.add_node n
    # Assert 
    assert_equal 1, @g.num_nodes
  end

  # We may also want to verify that id gets called.
  # This is where we can use a mock.
  # A mock is a double which verifies that a method
  # is called a certain number of times.
  
  def test_add_node_mock
    # If you comment out the .id reference in
    # graph.add_node, this will fail
    mocked_node = Minitest::Mock.new("mocked node")
    # Expect id to be called and make a stub
    # which just returns true, similar to:
    # def mocked_node.id; true; end
    mocked_node.expect :id, true
    mocked_node.expect :id, true
    @g.add_node mocked_node
    assert_mock mocked_node
  end
  
end
