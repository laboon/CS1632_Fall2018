class Monkey

  attr_accessor :has_banana, :monkey_num

  MOD_VAL = 839

  def initialize n
    @has_banana = false
    @monkey_val = 1000
    @monkey_num = n
  end

  def get_id
    387494 + @monkey_num
  end

  def invalid?
    false
  end

  def get_num
    @monkey_num
  end
end
