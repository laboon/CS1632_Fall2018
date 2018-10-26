require 'minitest/autorun'

require_relative 'wolf'
require_relative 'wolf_pack'

class WolfPackTest < Minitest::Test

  def setup
    @wolf_pack = WolfPack::new
  end
  
  # Test all_howl
  # If all_howl is called, every wolf should have
  # their .howl method called.

  def test_all_howl
    w1 = Minitest::Mock::new "wolf 1"
    w2 = Minitest::Mock::new "wolf 2"
    w1.expect :howl, nil
    w2.expect :howl, nil
    @wolf_pack.add_wolf w1
    @wolf_pack.add_wolf w2
    @wolf_pack.all_howl
    assert_mock w1
    assert_mock w2
  end
  
  # Test one_wolf
  # Ensure that the wolf returned is one of the wolves
  # added to the pack.

  def test_one_wolf
    w1 = Minitest::Mock::new "wolf 1"
    w2 = Minitest::Mock::new "wolf 2"
    def w1.name; "Joe"; end
    def w2.name; "Jane"; end
    @wolf_pack.add_wolf w1
    @wolf_pack.add_wolf w2
    name = @wolf_pack.one_wolf
    assert_includes ["Joe", "Jane"], name
  end
  
  # Test add_wolf
  # If you add one wolf to the pack, the size
  # of the pack should be incremented by one.

  def test_add_wolf
    w1 = Minitest::Mock::new "wolf 1"
    @wolf_pack.add_wolf w1
    assert_equal 1, @wolf_pack.wolves.count
  end

  # Test biggest_wolf
  # Return the size of the biggest wolf in the wolf pack.
  # If there is one small wolf and one large
  # wolf, return the size of the large wolf.

  def test_biggest_wolf
    w1 = Minitest::Mock::new "wolf 1"
    w2 = Minitest::Mock::new "wolf 2"
    def w1.size; 1; end
    def w2.size; 10; end
    @wolf_pack.add_wolf w1
    @wolf_pack.add_wolf w2
    biggest = @wolf_pack.biggest_wolf
    assert_equal 10, biggest
  end
  
end
