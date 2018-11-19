# Exercise 7 - Property-Based Testing

In this exercise, we will:

1. Determine errors in our code via property-based testing
2. Become fabulously wealthy through stock trading

_not necessarily in that order_

In order to do so, we will use the Ruby gem __rantly__.  Rantly is a property-based testing framework which will allow us to use __stochastic testing__ in order to find errors in our code.

## Steps

1. Make sure that you run `bundle install` before running any tests.  One of the gems that will be installed is rantly.
1. I recommend you play around with the program a little (by running `ruby trade_engine.rb`) so that you understand how the program works.  I also advise you to examine the rantly GitHub page ( https://github.com/rantly-rb/rantly ) if you have any questions in terms of syntax.
3. We are going to test the `Market` class (in `market.rb`) using property-based testing.  There are already several property-based tests available - run them as you would any Minitest test.  There are also some commented-out tests which describe invariants which should hold.  Uncomment them and fill them in, and try to find some errors of your own.
5. Fix any errors that you find.

Note that there are some other files.  You do not need to perform any property-based testing or other testing on them.

Rantly GitHub page: https://github.com/rantly-rb/rantly

## Note on Errors

If you are having trouble using bundle install (such as an error saying `Gem::RemoteFetcher::UnknownHostError timed out` or something similar), I have included the rantly gem in this repository.  Ensure that it is in your current directory (you can download it from github directly)

`gem install --local rantly-1.1.0.gem`

## Grading

This is an exercise and is not graded.
