require 'minitest/autorun'
require 'rantly/minitest_extensions'

require_relative 'market'

class MarketTest < Minitest::Test

  # Create a new market before each test
  def setup
    @market = Market.new
  end

  # This is a traditional unit test - used solely
  # to show the difference between property-based
  # testing and "traditional" testing
  # This test verifies that buying a 10 shares of a
  # stock that costs $100.00 will equal $1000.00
  def test_traditional_unit_test
    assert_equal @market.calculate_cost(100.0, 10), 1000.00
  end

  # Each of the following two tests should find an error!


  # Calculating the cost to buy a stock should always
  # result in a positive result (>0).

  def test_cost_always_positive
    property_of {
      share_price = float
      num_shares = integer
      [share_price, num_shares]
    }.check { |share_price, num_shares|
      value = @market.calculate_cost(share_price, num_shares)
      assert value >= 0
    }
  end

  # Generating an initial value of a stock should always
  # create a stock value of between $1.00 and $30.00
  # (inclusive)

  def test_starting_price_in_correct_range
    property_of {
      integer
    }.check { |seed|
      initial_price = @market.initial_price(seed)
      assert initial_price >= 1.0 && initial_price <= 30.0
    }
  end


  # The price of a stock should always result in a Numeric
  # value.  If a stock doesn't exist, should return -1, which
  # is still a Numeric

  def test_price_always_numeric
    property_of {
      string
    }.check { |name|
      assert_kind_of Numeric, @market.price(name)
    }
  end


  # After iteration, the values of the stock market should
  # always be positive (there should never be a negative-value
  # stock)
  # Note - this is going to be a little more difficult
  # because of the statefulness; luckily you have an
  # access to the prices hash.
  def test_stock_price_always_positive
    property_of {
      integer
    }.check { |seed|
      10.times do
        @market.iterate(seed)
        @market.prices.values.each do |price|
          assert price >= 0
        end
      end
    }
  end


end
