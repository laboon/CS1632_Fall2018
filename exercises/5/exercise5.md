# CS 1632 - Software Quality Assurance

## Exercise 5

For this assignment, you and a partner will update the "guessing game" in `/sample_code/sinatra_example` and add systems-level, automated black-box tests using Katalon Automation Recorder.  Your tests should focus on the functionality you will add (below).

I recommend you do a minimum of six tests, checking various base, edge, and corner cases.  However, do not focus on the number of tests too heavily; I am more concerned that you cover a broad variety of cases, and ones which are focused and still likely to find defects.

I also recommend that you write the code for the test mode first, as it will make your other testing much easier.  Then write the Katalon tests for the test mode.  Then you can work on the code for the second requirement, then finally the Katalon tests for the second requirement.

## Functionality to Add

1. Add a "test" mode.  If a param called "test" with any integer value is passed in, the secret number should be set to whatever the test value is.  If the test parameter cannot be interpreted as an integer or is an invalid integer (i.e., one greater than 100 or less than 1), the secret number should be set to 50.
2. If the user is within 5, inform the user that they are close (e.g., if the secret number is 10 - 11, 12, 13, 14, or 15, or 5, 6, 7, 8, or 9, would all show the message, other numbers would not) with the message "You're really close!", unless they have the number exactly right.  Otherwise display nothing.

## Tips

1. I recommend you keep the "cheat mode" in the ERB file (which shows you the secret number), at least at first.  It will help you when doing exploratory testing.

## Grading

This is an exercise and thus not graded.  Please feel free to speak to or email me to discuss any problems that you have.
