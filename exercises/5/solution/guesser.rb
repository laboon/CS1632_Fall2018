require 'sinatra'
require 'sinatra/reloader'

# The secret number to guess.  This will start as an invalid value
number = -1

# Generate a secret number from 1 to 100
def secret_num
  rand(1..100)
end

def get_test_num(init_test)
  final_test = init_test.to_i
  if final_test <= 0 || final_test > 100
    final_test = 50
  end
  final_test
end

# Determine the message to send depending on whether the guess is higher,
# lower, or the same as the secret number
def determine_msg(number, guess)
  to_return = ""
  if guess == number
    to_return = "That's exactly right!"
  elsif guess > number
    to_return = "That's too high!"
  else
    to_return = "That's too low!"
  end
  if guess != number
    if (number - guess).abs > 10
      to_return += " You're way off!"
    end
    if (number - guess).abs <= 5
      to_return += " You're really close!"
    end
  end
  to_return
end

# If a GET request comes in at /, do the following.

get '/' do
  # Get the parameter named guess and store it in pg
  pg = params['guess']
  test = params['test']
  # Setting these variables here so that they are accessible
  # outside the conditional
  guess = -1
  got_it = false
  # If there was no guess parameter, this is a brand new game.
  # Generate a secret number and set the guess to nil.
  if pg.nil? && test.nil?
    number = secret_num
    guess = nil
  elsif pg.nil? && test
    number = get_test_num test
    guess = nil
  elsif pg && test.nil?
    guess = pg.to_i
    msg = determine_msg number, guess
    got_it = guess == number
  else
    number = get_test_num test
    guess = pg.to_i
    msg = determine_msg number, guess
    got_it = guess == number
  end
  erb :index, :locals => { number: number, guess: guess, got_it: got_it, msg: msg }
end

not_found do
  status 404
  erb :error
end
