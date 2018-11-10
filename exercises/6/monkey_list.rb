require_relative "monkey.rb"

class MonkeyList

  MAX_SIZE = 10000

  attr_reader :monkeys, :round, :curr_monkey_num, :normalized_offsets
  
  def initialize s
    @monkeys = []
    (s + 1).times { |x| @monkeys << Monkey::new(x) }
    @curr_monkey_num = s
    @curr_monkey = @monkeys[s]
    @normalized_offsets = get_normalized_offsets
    @round = 0
  end

  def get_normalized_offsets
    (1..MAX_SIZE).to_a.map { |x| x * MAX_SIZE }
  end
  
  def even n
    n.even?
  end

  def odd n
    n.odd?
  end

  def next_even n
    (n / 2).to_i
  end

  def next_odd n
    ((n * 3) + 1).to_i
  end

  def next_num curr_monkey_num
    if even(curr_monkey_num)
      next_even curr_monkey_num
    else
      next_odd curr_monkey_num
    end
  end
  
  def calculate_next_monkey curr_monkey_num
    normalizer = @normalized_offsets.max
    curr_monkey_num += normalizer
    raise "Invalid normalized monkey" unless curr_monkey_num.zero? || curr_monkey_num.positive?
    curr_monkey_num -= normalizer
    next_num curr_monkey_num
  end
           
  def add_monkey m
    raise "Nil monkey added to list!" if m.nil?
    raise "Invalid monkey added to list!" if m.invalid?
    @monkeys << m
  end

  def add_more_monkeys_if_necessary next_monkey_num
    num = @monkeys.size
    until num > next_monkey_num
      add_monkey Monkey::new num
      num += 1
    end
  end
  
  def print_throw round, prev_monkey, next_monkey
    "Round #{round}: Threw banana from Monkey #{prev_monkey.get_num} (ID: #{prev_monkey.get_id}) to Monkey #{next_monkey.get_num} (ID: #{next_monkey.get_id})"
  end
  
  def start curr_monkey_num
    raise "Starting monkey must be a positive integer" unless curr_monkey_num > 0
    count = 0
    until curr_monkey_num == 1
      @round += 1
      next_monkey_num = calculate_next_monkey curr_monkey_num
      add_more_monkeys_if_necessary next_monkey_num
      puts print_throw @round, @monkeys[curr_monkey_num], @monkeys[next_monkey_num]
      curr_monkey_num = next_monkey_num
    end
    @round
  end
  
end
