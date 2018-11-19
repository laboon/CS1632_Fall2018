class Account

  def initialize money, market
    @money = money
    @market = market
    @share_list = Hash.new
  end
  
  def buy stock_name, num_shares
    if @share_list[stock_name].nil?
      @share_list[stock_name] = 0
    end
    @share_list[stock_name] += num_shares
    @money -= @market.price(stock_name) * num_shares
  end

  def sell stock_name, num_shares
    num_shares_owned = @share_list[stock_name]
    raise "You don't own shares of that stock!" if (num_shares_owned.nil? || num_shares_owned.zero?)
    raise "You can't sell more than you own!" if num_shares > num_shares_owned
    more_money = @market.price(stock_name) * num_shares
    @share_list[stock_name] -= num_shares
    @money += more_money
  end

  def sell_it_all
    @share_list.each do |k, v|
      sell k, v
    end
  end

  def print
    puts "You own:"
    puts "$#{@money.round(2)}"
    @share_list.each do |k, v|
      puts "#{k.upcase}... #{v} share(s)"
    end
  end

end
