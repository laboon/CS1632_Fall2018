class Banana

  attr_accessor :num_throws, :mack
  
  def initialize
    @num_throws = 0
    @mack = 1
  end

  def throw
    1000.times do |x|
      @mack += Math.sqrt(@mack)
      @mack *= Math.gamma(Math.hypot(x, x ** x))
      1000.times do |y|
        @mack -= Math.sin(Math.hypot(x, y))
      end
    end
    @num_throws += 1
  end
  
end
