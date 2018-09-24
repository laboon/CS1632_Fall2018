def num_neighbors(x, y, arr)
  # Start counter at zero
  count = 0
  # Figure out size of array
  size = arr.size
  # Normalize left, right of x and below, above of y
  # This will mean that we will automatically check for "wraparound"
  # if we are the edge of the board
  left_x = (x - 1) % size
  right_x = (x + 1) % size
  up_y = (y - 1) % size
  down_y = (y + 1) % size
  # Now, for each of the neighbors, increment count if it is truthy
  # Recall that our array consists solely of true and false values
  count += 1 if arr[left_x][up_y]
  count += 1 if arr[x][up_y]
  count += 1 if arr[right_x][up_y]
  count += 1 if arr[left_x][y]
  count += 1 if arr[right_x][y]
  count += 1 if arr[left_x][down_y]
  count += 1 if arr[x][down_y]
  count += 1 if arr[right_x][down_y]
  # Return the final count of living neighbors
  count
end

# Perform one iteration

def iterate(arr)
  # Generate a new array
  # We can't re-use the old array because we would be writing over
  # cells that we depend upon to determine the status of new cells
  new_arr = []
  # For each row in the old array arr, generate a new array row
  (0..(arr.size - 1)).each do |x|
    # Ruby 2-d arrays are just arrays of arrays
    # Our new array should start empty
    new_arr[x] = []
    # For each column in the old array array, calculate the new value
    # Note that now x, y is the coordinate (row, column)
    (0..(arr.size - 1)).each do |y|
      # Figure out how living many neighbors the array arr has at location x, y
      n = num_neighbors x, y, arr

      # The following conditional is just a simplified version of the Conway rules:
      # Alive -> 2/3 living neighbors -> Alive
      # Alive -> <2 || >3 living neighbors -> Dead
      # Dead -> 3 living neighbors -> Alive
      # Dead -> <3 || >3 living neighbors -> Dead

      if n == 3
        # If n is 3, then no matter what, the new cell should be alive
        new_arr[x][y] = true
      elsif n == 2 && arr[x][y] == true
        # Otherwise, if the number of living neighbors is 2 and cell is
        # already alive, new cell should be alive
        new_arr[x][y] = true
      else
        # Otherwise, the new cell should be dead
        new_arr[x][y] = false
      end
    end
  end

  # Return the newly generated array
  new_arr
end

def create_arr(prng, size, percent)
  arr = []
  (0...size).each do |x|
    arr[x] = []
    (0...size).each do |y|
      if percent.zero?
        arr[x][y] = false
      else
        num = prng.rand(100) + 1
        arr[x][y] = num <= percent
      end
    end
  end
  arr
end

def print_arr(arr)
  (0...arr.size).each do |x|
    (0...arr.size).each do |y|
      arr[x][y] ? (print 'x') : (print '.')
     end
     puts
  end
  arr.size.times { print '*' }
  puts
end

# EXECUTION STARTS HERE

raise "Enter integers for size, percentage (1..100), and number of iterations at command line" unless ARGV.count == 3
size, percent, iters = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

# Raise an exception unless a valid size is passed in
raise "Enter valid size (>0) for size" unless size > 0
# Raise an exception unless a valid percent is passed in
raise "Enter valid percentage (0 to 100) for percentage" unless percent >= 0 && percent <= 100
# Raise an exception unless a valid number of iterations is passed in
raise "Enter valid number of iterations (>= 0) for number of iterations" unless iters >= 0

# Create a new pseudo-random number generator
prng = Random.new

# Create and print the array
arr = create_arr prng, size, percent
print_arr arr

# For _iters_ times, print the array, then iterate according to the Conway algorithm
(0...iters).each do
  print_arr arr
  arr = iterate arr
end
