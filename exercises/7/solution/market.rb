class Market

  STOCKS = ['BI', 'LL', 'LA', 'BO', 'ON']

  attr_accessor :prices

  def initial_price(seed = nil)
    r = nil
    if (seed.nil?)
      r = Random.new
    else
      r = Random.new(seed)
    end
    r.rand(1..30).to_f.round(2)
  end

  def initialize
    @prices = Hash.new
    STOCKS.each do |name|
      @prices[name] = initial_price
    end
  end

  def iterate(seed = nil)
    r = nil
    if seed.nil?
      r = Random.new
    else
      r = Random.new(seed)
    end
    @prices.each do |k, v|
      @prices[k] += r.rand(-5.0..5.0)
      @prices[k] = 0.01 if @prices[k] <= 0.0
    end
  end

  # Returns the price of a named stock
  # If the stock does not exist, return -1
  def price name
    p = @prices[name.upcase]
    if p
      p
    else
      -1
    end
  end

  # Calculate the cost to buy a certain number of shares
  # at a certain price
  # If a negative number is passed in for num_shares, assume they
  # mean a positive number (e.g., -5 shares -> 5 shares)
  def calculate_cost share_price, num_shares
    num_shares = num_shares.abs if num_shares < 0
    share_price * num_shares
  end

  def print
    puts "Stock market:"
    @prices.each do |k, v|
      puts "#{k.upcase}.... $#{v.round(2)}"
    end
  end

end
