# Should return the # of living neighbors of cell in location x, y
# in array arr

def num_neighbors(x, y, arr)
  nil
end

# Should perform one iteration of Conway's game of life

def iterate(arr)
  nil
end

# Given a pseudorandom number generator, a size, and a percentage
# of cells to be alive, make a size x size array (e.g., a 10 x 10 array
# if size = 10), and randomly assign percent % of them to be living.
# Return the newly created array to the caller.

def create_arr(prng, size, percent)
  arr = []
  (0...size).each do |x|
    arr[x] = []
    (0...size).each do |y|
      arr[x][y] = prng.rand(101) <= percent
    end
  end
  arr
end

# Print the array to the screen, with x representing a living
# cell and . representing a dead cell.
# Finish the printing with a single line of asterisks, exactly
# as long as the array is wide.
# There is no need to return anything
# Example:
# ...........
# ...........
# ...........
# ...........
# ...........
# ...........
# .........x.
# ........x.x
# .......x..x
# ........xx.
# ...........
# ***********

def print_arr(arr)
  nil
end

# EXECUTION STARTS HERE

raise "Enter integers for size, percentage (1..100), and number of iterations at command line" unless ARGV.count == 3
size, percent, iters = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

# If size is not >0, inform the user and exit
# If percent is not an integer between 0 and 100, inform the user and exit
# If number of iterations is not an integer that is 0 or greater, inform the user and exit

# Create the array

# Iterate for _iters_ iterations
