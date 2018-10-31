# CS 1632 - Software Quality Assurance

Fall Semester 2018

ASSIGNED 31 OCT 2018, DUE 12 NOV 2018 (Late Due Date 14 NOV 2018: -20 points)

## Deliverable 3

For this assignment, you (NOT with a partner) will create a simple web application and test it using automated systems-level testing with Katalon.  This web application will accept three parameters, entered via textboxes, on the main page.  These three parameters will be the symbol you wish to use for "true", the symbol you wish to use for "false", and the size of the truth table (in terms of 2 ^ x, e.g., entering three will create three binary digits which means the size of the truth table is 2 ^ 3 == 8).

If invalid data is entered (i.e., a multi-character true or false symbol, the same character used for true and false, or anything other than an integer >= 2 for the size), an error page should be displayed.

If the user attempts to go to a URL other than one specified, a separate error page specifying the issue, along with a 404 status code, should be displayed.

I am not interested in how "pretty" you can make the output; there is no need to add CSS or style the page in other ways.  For those of you who have done web development before and for whom this may seem painful, simply imagine that you have time-travelled back to 1995, before CSS was invented.  This is also good practice in case you do end up time-travelling to the mid-1990s (the first version of Ruby was released in 1995, so you will still be good on that score, although the documentation was originally written only in Japanese).

Requirements for this program are in the `requirements.md` file in this directory.  In case of ambiguity, please see the sample output as an example of what to display and how the system should work.

All code and tests should be on GitHub in a private repository accessible to me and the TA.

Your repository MUST be named D3.

## Format
You should turn in a title page with:

* The title "CS 1632 - DELIVERABLE 3: Automated System Testing of a Web Application"
* Yuur name and your GitHub username
* The URL of your code and tests on GitHub

ENSURE THAT THE THE TA AND I ARE ADDED AS A COLLABORATOR ON GITHUB!  My username is `laboon`.  The TA's username is `chenranli`.  You will lose an automatic 10 points if either I or the TA cannot access your repository.

Before turning this assignment in, I HIGHLY recommend you double-check that all of the code that you think is committed is in fact committed by (1) looking at the code on the GitHub web interface and (2) cloning it down to a new directory on your machine and trying to run it from there.

Add a short ( < 1 page ) description of issues you faced when writing this code and tests.  If any tests you wrote fail, they should be included here, along with why you think that they are failing.

After this, ON A SEPARATE PAGE, include a screenshot of the executed unit tests (this means a SCREENSHOT of the Katalon tool after execution of the test suite).  If a test doesn't pass, it should be included in the concerns section above.  Ideally, for a perfect grade, all tests should be green (passing).  However, if you have what you think is a valid test and it is not passing, I would prefer that you include a defect report (in the proper template!) rather than just deleting it.  Knowing that a defect exists and reporting it is much better than having it discovered by the customer (me)!

There is no need to print out the code itself.  It should be on GitHub BY THE BEGINNING OF CLASS.

There should be a minimum of sixteen (16) Katalon tests, checking all requirements (as measured by the traceability matrix).  Note that this is an ABSOLUTE MINIMUM value.  You may have more tests if you like.

Keep in mind some of the things we learned when doing manual testing; you should be cognizant of equivalence classes, boundary values, etc. and focus on them.

For this project, you should endeavour to get a good sampling of different equivalence classes and success/failure cases.

You should be able to handle any invalid input coming into the program and should test for such situations.  Invalid input could include bad parameter values, bad parameter names, bad URLs, etc.  It is up to you to think of proper edge and corner cases and how to respond to these failures!

## Grading

Just like in D1, you should line up requirements with test cases and develop a traceability matrix to let me know which Katalon tests line up with which requirement.

```
* Summary and Testing concerns - 10%
* Screen shot of test results - 5%
* Functionality - 40%
* Katalon tests - 40%
* Traceability matrix - 5%
```
## Tips

1. Although reloader will work on the main file you call (i.e., `truth.rb`) and any views, it will NOT reload any helper files you may have `require_relative`'d!  You will have to restart the Sinatra server to reload them.
2. You will find this assignment much easier if you learn the `<table>` HTML tag along with its related tags, `<tr>`, `<td>`, `<th>`.
3. Remember that `erb` allows you to run any Ruby code you want in the .erb file.  However, I recommend you do most of the "heavy lifting" elsewhere, because 1) adding the `<%` and `%>` gets annoying and 2) it's good practice to separate your calculations and data ("model") from how it is displayed ("view").

Please feel free to email me or come to office hours to discuss any problems you have.
