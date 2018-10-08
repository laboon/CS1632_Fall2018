# CS 1632 - Software Quality Assurance
Fall Semester 2018 - Exercise 3

For this exercise, you and a partner will write unit tests for the `name` program.  This program will tell us the upper-case version of the passed-in name, the number of characters in the name, the excited version of the name (upper-case and followed by three exclamation points), whether or not the name is long, and whether or not the name is futuristic.

## Grading

This is an exercise and is thus not graded.

## Requirements

Note that unlike systems-level tests, unit tests do not need to map directly to requirements.  However, they are often useful for determine what needs to be done (and in this case, they do map pretty well to requirements).

1. The program shall accept one and only one argument from the command line.  If no arguments, or more than one argument, are passed in, the program shall exit.

1. If a single argument is passed in, the program shall display the upper-case version of the passed-in name, the number of characters in the name, the excited version of the name, whether or not the name is long, and whether or not the name is futuristic.

1. The upper-case version of the name shall be a version of the name where for any alphabetic character, it shall print the upper-case version.

1. The number of characters shall be the number of characters included in the name, not including end-of-string characters.  For example, 'Bob' shall be 3 and 'Mary' shall be 4.

1. The excited name shall be the passed-in name in upper-case, with three exclamation points after it.  For example, 'jan' should become 'JAN!!!'.

1. The name shall be considered long if it is longer than 15 characters, i.e. 0..15 characters shall be considered not long, and 16..infinity characters shall be considered long.

1. The name shall be considered futuristic if the total of the number of 'x' and 'z' characters (case-insensitive, that is, 'X' and 'Z' count as well) is greater than 25% of the entire number of characters.  For example, 'xXx' is futuristic, but 'aaaaax' is not.

## Running Tests

To run Minitest tests, first make sure that you have Minitest installed.  You should be able to do this by running `bundle install` if you have `bundler` installed.  If you don't, install `bundler` by typing `gem install bundler` at the command line.  You may also install Minitest directly by typing `gem install minitest`.

To run the tests, type "ruby main_test.rb".  You will note that there are two different "program" files, `name.rb` and `namer.rb`.  This is so we can include the Namer class WITHOUT executing the program.  Note that the `namer.rb` file only includes the Namer class definition - there is nothing to execute.  If we did a `require_relative` on `name.rb`, it would run the whole program - that is not what we want for the tests.

Note that we have a `main_test.rb` file which requires the namer_test.rb file.  This seems superfluous now, but it is a good idea to get in the habit of doing this, especially as we move to program with multiples files to test.

## Issues

There are at least three issues with the Namer code.  You should write automated unit tests that find these issues, and then fix them.  Your final code should have ZERO failing tests!

Please write at least two unit tests for each of the untested methods in Namer.rb.  You should do equivalence class partioning and think of edge/corner cases when writing these unit tests.
