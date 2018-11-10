# Exercise 6 - Performance Testing Exercise

For this exercise, you and a partner will profile some monkey simulation software, and improve its performance by refactoring one method (to be determined by the results of the profiling).  This will consist of several parts:

1. Timing and profiling (before any changes) to determine which methods are the most CPU-intensive
3. Refactoring one method to be more performant (from a CPU and time perspective)
4. Timing and Profiling (after) showing that your rewrite helped make your method more performant

Code is available in the file monkey_sim.rb in this directory.

This code runs MonkeySim, which simulates a group of monkeys throwing a banana back around until it gets to the first monkey.  It accepts one argument, which states which monkey has the banana initially.

The game shall continue until the first monkey gets the banana, at which point the simulation shall end.

The monkey who has the banana shall throw it to another monkey during each round.

If a monkey is even-numbered (e.g., monkey #2, monkey #4, etc.), then the monkey with the banana shall throw the banana to the monkey equal to one-half of that initial monkey's number.  For example, monkey #4 shall throw the banana to monkey #2, and monkey #20 shall throw the banana to monkey #10.

If a monkey is odd-numbered (and not monkey #1), the monkey with the banana shall throw it to the monkey equal to three times the number of that monkey plus one `(3n + 1)`.  For example, monkey #5 shall throw the banana to monkey #16 `((3 * 5) + 1)`.

If Monkey #1 catches the banana, the system shall display the number of rounds it took for Monkey #1 to catch the banana and then the program shall exit.

At each round, the current status of who is doing the throwing and who is catching shall be displayed, along with the round number (which should start at 1).  It should use the following format: "Round 1: Threw banana from Monkey (#54 / ID 387548) to Monkey (#27 / ID 387521)"

Each monkey has an ID; this ID shall remain constant.  For instance, Monkey #5 shall always have ID 387499, and Monkey #160 shall always have ID 387574.  Any changes to the code should not modify the ID value (that is, you can't just say that monkey #5 now has ID 5 - IDs should be a constant for a given monkey)

Output for a given input should be EXACTLY the same as the initial output (i.e., you cannot just give each  monkey a random identifier).  Sample runs are shown in the sample_runs.txt file.  Please be sure that your code operates the exact same way as the initial code.

I have included a file of unit tests (`monkey_sim_test.rb` - run with `ruby monkey_sim_test.rb`).  If all of these tests pass, you have probably not caused any regression failures.  If any fail, you most certainly did!

In case of ambiguity in the requirements, the sample_runs.txt file shall be considered the correct implementation.

If you encounter an infinite loop (where, if the algorithm is implemented correctly, the first monkey NEVER gets the banana), you will receive a __sizable__ amount of extra credit, assuming you let me know the initial number you entered.

Some good numbers to try for long-running tests are 54, 3711, 10971, or 13255, any of which will take quite a few iterations to complete and should take at least 2 - 10 seconds on the non-optimized code to run (depending on your computer).  The smallest number of iterations can be found with the value 1. Some medium-sized tests are starting with numbers 11, 13, and 160 (all will take around 10 iterations to complete).

In order to determine the "hot spots" of the application, you will use the flamegraph gem.  Using a profiler, determine a method you can use to measurably increase the speed of the application without modifying behavior.

Flamegraph works by sampling the call stack (i.e. doing a stack trace) numerous times per second.  This ends up looking a little bit like a fire (thus, flame graph).  By running flamegrapher.rb, you can see how `problematic_method` is taking up most of the CPU time.

By viewing the generated "monkey_sim.html" flame graph, you can see which method(s) are taking up the most CPU time.  

This program should work EXACTLY the same as before, except it should be faster and take up less CPU time.  You can prove this by running the monkey_sim unit tests (in monkey_sim_test.rb).   If any tests fail, you have introduced a regression failure!  You can check that it takes less time to run by using the `time` command (or `Measure-Command` command in Windows powershell).

## Steps

1. Run `time ruby monkey_sim.rb 54` (if you are on OS X / Linux / FreeBSD or have access to a bash shell).  If you are on Windows, you can either use the Windows Subsystem for Linux ( https://docs.microsoft.com/en-us/windows/wsl/install-win10 ) OR use PowerShell with the following command `Measure-Command { ruby monkey_sim.rb 54 }` Note that you will NOT get any output to STDOUT when using Measure-Command.  I recommend you run the monkey_sim by itself first if you are using Windows so you can see the correct output.
2. Mark down the time this took to run.
3. Run `bundle install`.  If you get an error installing stackprof, try installing fast_stack via the command line - `gem install fast_stack`.  If you get an error doing this, install DevKit ( https://rubyinstaller.org/add-ons/devkit.html ).  Make sure you are using Ruby 2.4 or greater (which you should be, make sure you install the MSYS2 version).  If you are still getting an error, see me.
4. Run `ruby monkey_sim.rb 13`.  This will generate a small flamegraph file (larger flamegraph files sometimes cause your browser to run out of memory and not display it) in `monkey_sim.html`.
5. Open the monkey_sim.html file in your favorite browser.  This is a graphical view of the stack over time - flamegraph does this by looking at the stack trace approximately once per millisecond (varies based on computer and stack profiling gem, stackprof or fast_stack... note that, despite its name, fast_stack is actually slower than stackprof). To figure out which methods are using up the most CPU, look at the TOP of the stack over time.  Is there a method at the top that is staying there?  Note: if you are using fast_stack, ignore any `**` methods.
6. Find the method that is causing some much CPU to be used up.  Try to understand what it is doing.  Modify it so that it takes up much less CPU.  Once you understand the issue, it should be a relatively simple process - you will not need to know any advanced math to make the modifications.  You may want to view how monkey numbers line up with monkey IDs for a clue.
7. After making the modifications, run `ruby monkey_sim_test.rb` to ensure that you did not cause any regression failures.
8. Run step 1 again and compare the original times to the new times.  You should have caused a significant speed-up.

