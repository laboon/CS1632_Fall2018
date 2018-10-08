require 'minitest/autorun'
require_relative 'namer'

class NamerTest < Minitest::Test

  # Tests that our num_chars method works with short names like "Bob"
  def test_num_chars_short
    namer = Namer.new 'Bob'
    assert_equal 3, namer.num_chars
  end

  # Tests that our num_chars method works with long names
  def test_num_chars_long
    namer = Namer.new 'Wolfeschlegelsteinhausenbergerdorff'
    assert_equal 35, namer.num_chars
  end

  # Tests that our num_chars method works if the empty string is passed in
  def test_num_chars_empty_string
    namer = Namer.new ''
    assert_equal 0, namer.num_chars
  end

  # Tests that if the name is already uppercase, that upcasing it via the
  # .upcase method keeps it upper case
  def test_upcase_already_uppercase
    namer = Namer.new "JOE"
    assert_equal "JOE", namer.upcase
  end

  # Tests that if the name is all lowercase, that upcasing it via the
  # .upcase method makes it upper case
  def test_upcase_lowercase
    namer = Namer.new "gladys"
    assert_equal "GLADYS", namer.upcase
  end

  # Tests that if the name is mixed-case, that upcasing it via the
  # .upcase method makes it all upper case
  def test_upcase_mixed
    namer = Namer.new "zErOcOoL"
    assert_equal "ZEROCOOL", namer.upcase
  end

end
