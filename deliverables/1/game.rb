# This is the actual game class for the connect_four game
class Game
  # Game class constants

  X_PLAYER = 'X'.freeze              # X Player indicator
  O_PLAYER = 'O'.freeze              # O Player indicator
  BLANK_SPACE = '.'.freeze           # Blank spot indicator

  # Initialization of game
  # Create a new blank board and have the X_PLAYER start the game
  def initialize(size)
    @size = size                  # size of board
    @board = generate_board(size) # board itself (2-d array)
    @turn = X_PLAYER              # whose turn is it?
  end

  # Creates a board with x rows and x columns
  # The board at the start of game consists entirely of blank spaces
  def generate_board(size)
    board = []
    size.times do |x1|
      board[x1] = []
      size.times do |y1|
        board[x1][y1] = BLANK_SPACE
      end
    end
    board
  end

  # Check to see if anybody won on a row..
  def horizontal_winner?
    current_player = nil

    @board.each do |row|
      counter = 0

      row.each do |spot|
        if spot == BLANK_SPACE
          counter = 0
          current_player = nil
        elsif spot == current_player
          counter += 1
          return true if counter == 3
        else
          current_player = spot
          counter = 0
        end
      end
    end
    false
  end

  # Check to see if anybody won on a column..
  def vertical_winner?
    current_player = nil

    @size.times do |x|
      counter = 0

      @size.times do |y|
        spot = @board[y][x]
        if spot == BLANK_SPACE
          counter = 0
          current_player = nil
        elsif spot == current_player
          counter += 1
          return true if counter == 3
        else
          current_player = spot
          counter = 0
        end
      end
    end
    false
  end

  # Check an upper-left to lower-right diagonal starting at location
  # start_x, start_y
  def check_upper_left_diagonal(start_x, start_y)
    x = start_x
    y = start_y
    counter = 0
    current_player = nil
    @size.times do
      spot = @board[x][y]
      return false if spot.nil?
      if spot == BLANK_SPACE
        counter = 0
        current_player = nil
      elsif spot == current_player
        counter += 1
        return true if counter == 3
      else
        current_player = spot
        counter = 0
      end
      x += 1
      y += 1
    end
    # We got to the end of the longest diagonal but found no connect-four
    false
  rescue NoMethodError
    # We walked past the edge
    false
  end

  # Check to see if somebody won on a diagonal.
  # Note that diagonals can be from upper-left to lower-right OR
  # upper-right to lower-left.
  # The following is a diagonal connect-four for X going from
  # upper-left to lower-right.
  # X
  # OX
  # OOX
  # OOOX
  # The following is a diagonal connect-four for X going from
  # upper-right to lower-left.
  #    X
  #   XO
  #  XOO
  # XOOO
  # This algorithm will check all of the diagonals starting from the
  # 0th column and the 0th row.  Example:
  #  012345
  # 0ABCDEF
  # 1GABCDE
  # 2HGABCD
  # 3IHGABC
  # 4JIHGAB
  # 5KJIHGA
  # Note the A diagonal, B diagonal, C diagonal, etc.
  # Note this method will even check rows where it is impossible to
  # have a connect four since they do not have four spots in the
  # diagonal.  Optimization is left as an exercise for the reader.
  def diagonal_winner?
    # Look diagonally (upper-left to lower-right) along the top row
    # Return true if connect four found
    @size.times do |start_y|
      return true if check_upper_left_diagonal(0, start_y)
    end

    # Look diagonally (upper-left to lower-right) along the left column
    # Return true if connect four found
    @size.times do |start_x|
      return true if check_upper_left_diagonal(start_x, 0)
    end

    # All possible diagonals have been checked, but no connect-fours
    # found, so just return false
    false
  end

  # Returns true if a connect-four has been found on the board, false
  # otherwise
  def winner?
    horizontal_winner? || vertical_winner? || diagonal_winner?
  end

  # Returns true if all spots are filled by checkers, false otherwise
  def all_spots_filled?
    @board.each do |row|
      row.each do |spot|
        return false if spot == BLANK_SPACE
      end
    end
    true
  end

  # Get input from player from standard input
  # Note that if ARGV.size == 0, STDIN is not necessary
  def input_move
    print "Player #{@turn}, enter move > "
    STDIN.gets.chomp
  end

  # Determines whether or not a move string _s_ is valid
  # To be valid, it must be a valid integer, referring to a valid column
  # (0..@board[0].size), and that column has to have space to drop a
  # checker (i.e., @board[0][move] is still blank)
  # The other possibility is that it is a 'flip' or 'rot' (rotate) command
  # these are also valid
  # If not a valid integer, flip, or rot, then it is invalid
  # This method returns true for valid and false for invalid
  def move_valid?(move_s)
    return true if move_s.casecmp('flip').zero? || move_s.casecmp('rot').zero?
    move = Integer(move_s)
    (move >= 0) && (move < @board[0].size) && (@board[0][move] == BLANK_SPACE)
  rescue StandardError
    false
  end

  # Drop a piece in a column.  It will "fall" until it hits the last
  # blank space.
  # Note that the algorithm for this in the method is actually the
  # opposite direction - it will look "up" from the bottom of the
  # board until it finds the first blank space.
  def drop_piece(column)
    row = @size - 1
    found = false
    until found == true
      if @board[row][column] == BLANK_SPACE
        @board[row][column] = @turn
        found = true
      else
        row -= 1
        raise "Could not drop piece in column #{column}" if row < 0
      end
    end
  end

  # Returns a deep duplication of the array passed in as an arg
  # NOTE: This assumes that arr is a 2-d array (like @board should be)
  def deep_dup_array(arr)
    to_return = []
    arr.each_with_index do |row, x|
      to_return[x] = []
      row.each_with_index do |spot, y|
        to_return[x][y] = spot
      end
    end
    to_return
  end

  # Flips the board so that all pieces end up in their opposite locations
  # vertically.  Pieces then fall down to the "floor".
  def flip_board
    temp_board = deep_dup_array @board
    @size.times do |x|
      @size.times do |y|
        @board[x][y] = temp_board[@size - x - 1][y]
      end
    end
    pieces_fall
  end

  # Rotates the board 90 degrees so that all pieces end up "rotated".
  # Pieces then fall down the "floor".
  def rotate_board
    temp_board = deep_dup_array @board
    @size.times do |x|
      @size.times do |y|
        @board[x][y] = temp_board[@size - y - 1][x]
      end
    end
    pieces_fall
  end

  # Shift all pieces in a column down one location.
  # The top location becomes a blank.
  def shift_down(column)
    above_saved_spot = BLANK_SPACE
    saved_spot = BLANK_SPACE

    @size.times do |x|
      saved_spot = @board[x][column]
      @board[x][column] = above_saved_spot
      above_saved_spot = saved_spot
    end
  end

  # Returns true if for the column specified, it consists only of blank spaces
  # Returns false otherwise
  def all_blanks_in_column?(column)
    @size.times do |x|
      return false if @board[x][column] != BLANK_SPACE
    end
    true
  end

  # Causes all pieces to "fall" to the "floor" after a rotation or flip
  def pieces_fall
    bottom_row = @size - 1
    @size.times do |column|
      if @board[bottom_row][column] != BLANK_SPACE || all_blanks_in_column?(column)
         # Skip this column, it is either full or entirely empty
      else
        # Shift column down until the lowest checker is in the bottom spot
        shift_down column until @board[bottom_row][column] != BLANK_SPACE
      end
    end
  end

  # Make a move - either flip, rot, or a column number
  def make_move(move)
    if move.casecmp('flip').zero?
      flip_board
    elsif move == 'rot'
      rotate_board
    else
      drop_piece move.to_i
    end
  end

  # Change the player - if it's currently the X_PLAYER, change to O_PLAYER
  # and vice-versa
  def swap_turn
    @turn = if @turn == X_PLAYER
              O_PLAYER
            else
              X_PLAYER
            end
  end

  # Displays a message to the user stating the move was invalid
  def display_invalid(move)
    puts "#{move} is an invalid move."
    puts 'Please enter one of the following:'
    puts '1. A valid column number'
    puts '2. \'flip\' to flip the board'
    puts '3. \'rot\' to rotate the board'
  end

  # Play the game!
  def play
    # Play until either there is a winner or there are no more spots to
    # drop checkers
    until winner? || all_spots_filled?
      display_board
      move = input_move
      if move_valid?(move)
        make_move move
        swap_turn
      else
        display_invalid move
      end
    end
  end

  # Show the results of the game - it is one of the following:
  # 1. It's a tie
  # 2. Player X won!
  # 3. Player O won!
  def show_results
    display_board
    if all_spots_filled?
      puts 'It\'s a tie'
    elsif winner?
      # Note that appears backwards, since it is O's turn to go but
      # they can't go because X just won "after" their turn
      if @turn == O_PLAYER
        puts 'Player X won!'
      else
        puts 'Player O won!'
      end
    end
  end

  # Pretty-print a 2-dimensional array
  def display_2d_array(arr)
    arr[0].size.times do |x|
      print x
    end
    puts

    arr.each do |row|
      row.each do |spot|
        print spot
      end
      puts
    end
  end

  # Specifically print out the board used in the game
  def display_board
    display_2d_array @board
  end
end
