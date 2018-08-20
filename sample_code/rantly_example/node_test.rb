require 'minitest/autorun'
require 'rantly'
require 'rantly/minitest_extensions'

require_relative 'node'

# Review rantly syntax here: https://github.com/rantly-rb/rantly

class NodeTest < Minitest::Test
  
  def test_id_no_neighbors
    property_of {
      integer
    }.check(100) { |i|
      n = Node.new i, []
      assert(n.id == i, "id not set properly")
    }
  end
end
