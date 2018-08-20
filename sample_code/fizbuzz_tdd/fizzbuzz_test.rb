require 'minitest/autorun'
require_relative 'fizzbuzz'

class FizzbuzzTest < Minitest::Test

  def setup
    @f = Fizzbuzz::new
  end
  
  def test_val_1
    assert_equal '1', @f.value(1)
  end

  def test_val_2
    assert_equal '2', @f.value(2)
  end

  def test_val_3
    assert_equal 'fizz', @f.value(3)
  end

  def test_val_5
    assert_equal 'buzz', @f.value(5)
  end

  def test_val_15
    assert_equal 'fizzbuzz', @f.value(15)
  end

  def test_val_invalid_value
    assert_nil @f.value("poodle")
  end
  
end
