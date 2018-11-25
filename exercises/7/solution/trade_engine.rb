require_relative 'account'
require_relative 'market'

class TradeEngine

  def initialize money, market, account
    @money = money
    @market = market
    @account = account
  end

  def buy_a_stock
    print 'Stock ticker > '
    stock = gets.chomp.downcase
    print 'Number share(s) > '
    num_shares = gets.chomp.to_i
    @account.buy stock, num_shares
  end

  def sell_a_stock
    print 'Stock ticker > '
    stock = gets.chomp.downcase
    print 'Number share(s) > '
    num_shares = gets.chomp.to_i
    @account.sell stock, num_shares
  end

  
  def iterate
    
    @account.print
    @market.print
    print "Command (Buy, Sell, Quit) > "
    cmd = gets.chomp.downcase
    case cmd
    when 'buy'
      buy_a_stock
      @market.iterate
    when 'sell'
      sell_a_stock
      @market.iterate
    when 'quit'
      return true
    else
      puts "what?"
    end
    false
  rescue StandardError => e
    puts e
    @market.iterate
  end

  def run
    quit = false
    until (quit)
      quit = iterate 
    end

  end
  
end

STARTING_MONEY = 10_000
m = Market.new
a = Account.new STARTING_MONEY, m
t = TradeEngine.new STARTING_MONEY, m, a
t.run


