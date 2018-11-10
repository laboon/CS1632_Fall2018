require 'minitest/autorun'

require_relative 'banana.rb'
require_relative 'monkey.rb'
require_relative 'monkey_list.rb'


class MonkeySimTest < Minitest::Test

  # BANANA TESTS

  # Creating a new banana should create a banana with
  # certain default values.
  
  def test_banana_initialize
    b = Banana::new
    assert_equal 0, b.num_throws
    assert_equal 1, b.mack
  end

  # Throwing a banana should increment the num_throws
  # counter by one.
  
  def test_banana_throw
    b = Banana::new
    b.throw
    assert_equal 1, b.num_throws
  end

  # MONKEY TESTS

  # A newly generated monkey should NOT have a banana
  # and should have the number of 1
  def test_monkey_initialize
    m = Monkey::new 1
    refute m.has_banana
    assert_equal 1, m.monkey_num
  end

  # Monkey #8 should have ID 387502
  
  def test_monkey_get_id_8
    m = Monkey::new 8
    assert_equal 387502, m.get_id
  end

  # Monkey #160 should have id 387654
  def test_monkey_get_id_160
    m = Monkey::new 160
    assert_equal 387654, m.get_id
  end

  # No monkey is ever invalid

  def test_monkey_invalid
    m = Monkey::new 1
    refute m.invalid?
  end

  # A monkey created with number 1 should return 1
  def test_monkey_get_num_1
    m = Monkey::new 1
    assert_equal 1, m.get_num
  end

  # A newly-generated monkey list starting at 1 should
  # have 2 monkeys
  def test_monkey_list_initialize_num_monkeys
    ml = MonkeyList::new 1
    assert_equal 2, ml.monkeys.count
  end
  
  # A newly-generated monkey list starting at n should
  # have n + 1 monkeys
  def test_monkey_list_initialize_num_monkeys
    ml = MonkeyList::new 5
    assert_equal 6, ml.monkeys.count
  end

  # Normalized offsets should contain 10000 normalized offsets
  # and the last value should be 100000000
  def test_normalized_offsets
    ml = MonkeyList::new 1
    assert_equal 10000, ml.normalized_offsets.count
    assert_equal 100000000, ml.normalized_offsets.last
  end

  # Check that 5 is not even

  def test_even_5
    refute (MonkeyList::new 1).even 5
  end
  
  # Check that 4 is even
  def test_even_4
    assert (MonkeyList::new 1).even 4
  end

  # Check that 900 is not odd
  def test_odd_900
    refute (MonkeyList::new 1).odd 900
  end

  # Check that 901 is odd
  def test_odd_900
    assert (MonkeyList::new 1).odd 901
  end

  # For an even number 4, check that next number is 2 (n / 2)

  def test_next_even_4
    assert_equal 2, (MonkeyList::new 1).next_even(4)
  end
  
  # For an even number 100, check that next number is 50 (n / 2)

  def test_next_even_100
    assert_equal 50, (MonkeyList::new 1).next_even(100)
  end
  
  # For an odd number 5, check that next number is 16 (3n + 1)

  def test_next_odd_5
    assert_equal 16, (MonkeyList::new 1).next_odd(5)
  end
  
  # For an odd number 501, check that next number is 1504 (3n + 1)

  def test_next_odd_501
    assert_equal 1504, (MonkeyList::new 1).next_odd(501)
  end

  # Check main next_num method for an odd number, 7
  # Should return 3n + 1, or 22
  def test_next_num_7
    assert_equal 22, (MonkeyList::new 1).next_num(7)
  end
  
  # Check main next_num method for a large odd number, 9001
  # Should return 3n + 1, or 27004
  def test_next_num_7
    assert_equal 27004, (MonkeyList::new 1).next_num(9001)
  end
  
  # Check main next_num method for an even number, 8
  # Should return n / 2, or 4
  def test_next_num_8
    assert_equal 4, (MonkeyList::new 1).next_num(8)
  end
  
  # Check main next_num method for a large even number, 9000
  # Should return n / 2, or 4500
  def test_next_num_9000
    assert_equal 4500, (MonkeyList::new 1).next_num(9000)
  end

  # Calculating next monkey should raise invalid normalized
  # monkey if an invalid monkey passed in
  def test_calculate_invalid_normalized
    assert_raises "Invalid normalized monkey" do
      (MonkeyList::new 1).calculate_next_monkey -100000000000
    end
  end

  # If valid monkey passed in, should give us the same
  # result as next_num (e.g. 5 -> 3n + 1 -> 16)
  def test_calculate_invalid_normalized
    assert_equal 16, (MonkeyList::new(1)).calculate_next_monkey(5)
  end

  # Trying to add a nil monkey to a monkey list raises an exception
  def test_add_monkey_nil
    assert_raises "Nil monkey added to list!" do
      (MonkeyList::new 1).add_monkey nil
    end
  end

  # Trying to add an invalid monkey raises an exception
  # Note we are stubbing out invalid? method since current
  # method in Monkey class always returns true

  def test_add_monkey_invalid
    ml = MonkeyList::new 1
    m = Minitest::Mock::new "invalid monkey"
    def m.nil?; false; end # STUB
    def m.invalid?; true; end # STUB
    assert_raises "Invalid monkey added to list!" do
      ml.add m
    end
  end

  # Check that more monkeys will be added if necessary
  # Note that the final count is 11 and not 10 because
  # we have a "zeroth" monkey in our array who, sadly,
  # will never receive the banana
  def test_add_more_monkeys_necessary
    ml = MonkeyList::new 5
    ml.add_more_monkeys_if_necessary 10
    new_count = ml.monkeys.count
    assert_equal 11, new_count
  end

  # Check that no monkeys are added if not necessary

  def test_add_more_monkeys_not_necessary
    ml = MonkeyList::new 100
    orig_count = ml.monkeys.count
    ml.add_more_monkeys_if_necessary 5
    new_count = ml.monkeys.count
    assert_equal orig_count, new_count
  end

  # Check that we are printing each round's output correctly
  def test_output_correct
    ml = MonkeyList::new 100
    prev_monkey = Minitest::Mock::new "prev monkey"
    next_monkey = Minitest::Mock::new "next monkey"
    def prev_monkey.get_num; 1732; end
    def prev_monkey.get_id; 389226; end
    def next_monkey.get_num; 866; end
    def next_monkey.get_id; 388360; end
    round = 1
    str = ml.print_throw round, prev_monkey, next_monkey
    assert_equal "Round 1: Threw banana from Monkey 1732 (ID: 389226) to Monkey 866 (ID: 388360)", str
  end
    
  # Check that the correct number of rounds occurs
  # Starting at monkey #5, should take us 5 rounds to get
  # to monkey #1

  def test_start_5
    ml = MonkeyList::new 5
    num_rounds = ml.start 5
    assert_equal 5, num_rounds
  end

  # Check that the correct number of rounds occurs
  # Starting at monkey #6, should take us 8 rounds to get
  # to monkey #1

  def test_start_6
    ml = MonkeyList::new 6
    num_rounds = ml.start 6
    assert_equal 8, num_rounds
  end

  # Check that trying to start with a negative integer raises
  # an exception
  def test_start_negative
    ml = MonkeyList::new 1
    assert_raises "Starting monkey must be a positive integer" do
      ml.start -1
    end
  end
  
  # Check that trying to start with 0 raises an exception
  def test_start_negative
    ml = MonkeyList::new 1
    assert_raises "Starting monkey must be a positive integer" do
      ml.start 0
    end
  end
   
  
end
