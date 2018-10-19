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

  # Check that an empty string still has three !'s appended.
  def test_empty_string_excite
    namer = Namer.new ''
    assert_equal "!!!", namer.excite
  end

  # Check that a regular name has three !'s appended.
  def test_regular_name_excite
    namer = Namer.new 'Madhvi'
    assert_equal "MADHVI!!!", namer.excite
  end

  # Check boundary values of long - 15 characters is the last non-long name
  def test_num_chars_long_boundary_15_chars
    namer = Namer.new '123456789012345'
    refute namer.long?
  end

  # Check boundary values of long - 16 characters is the smallest long name
  def test_num_chars_long_boundary_16_chars
    namer = Namer.new '1234567890123456'
    assert namer.long?
  end

  # Check that a name that has 0% X's or Z's is NOT futuristic
  def test_not_at_all_futuristic
    namer = Namer.new 'clemson applejack johnson'
    refute namer.futuristic?
  end

  # Check that a name that is all X's is futuristic
  def test_all_x_futuristic
    namer = Namer.new 'xXxXxXx'
    assert namer.futuristic?
  end

  # Check that a name that is all Z's is futuristic
  def test_all_z_futuristic
    namer = Namer.new 'zZzZzzzzzz'
    assert namer.futuristic?
  end

  # Check that a name that has > 0.25 X's and Z's is futuristic,
  # even if X's < 0.25 and Z's < 0.25 individually
  def test_mix_futuristic
    namer = Namer.new 'zzxx123456'
    assert namer.futuristic?
  end

end
