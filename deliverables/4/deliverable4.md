# CS 1632 - Software Quality Assurance
Fall Semester 2018

DUE 5 DECEMBER 2018 - *NO LATE ASSIGNMENTS ACCEPTED*

## Deliverable 4

In this deliverable, you and a partner will write software which will take in a file which represents a directed acyclic graph.  Each node in the graph will contain a letter.  You must then determine all possible paths from every node in the graph, and represent the path with the letters that each node has included.  Finally, you should output what the longest possible word(s) you can make is from the permutations of all these lettered paths.

This program MUST be written in two parts and with at least two commits to GitHub.  For the second part, you will take the information you have gleaned from performance testing to make AT LEAST one change to improve performance of your application.

Under _no_ circumstances should the program crash or should the user see an exception or stack trace directly.  You should handle all edge cases that might be thrown at you, such as a non-existent file, no arguments, different failure modes, etc.

The program shall accept one argument, which is the name of a file which includes a description of a directed acyclic graph.  Note that all input is case-insensitive.

```
NODE_ID;LETTER;NEIGHBORING_NODES
```

EXAMPLE:
```
1;C;2,3
2;A;3,4,6
3;K;5
4;T;
5;E;
6;B;
```

Note that IDs must be numeric, but may not be in numeric order in the file (e.g., node ID 10 may come before node ID 9).

Graphs may be entirely connected or unconnected.  That is, there may be entirely separate sub-graphs.

In this case, from node 1, you can go to node 2 or 3.  From node 2, to 3, 4, or 6.  From node 3, the only possible node to go to is 5.  For nodes 4, 5, and 6, there are no nodes, and so all traversals must end.  Since this graph is acyclic, you are guaranteed to eventually reach a node which marks the end of the line, no matter what the starting point is.  All paths must go all the way until they reach an end-node (i.e., a node that has no neighbors to head to).

```
1(C) --->  2(A) ---> 4(T)
  |       /  \
  |      /    \
  |     /      ----> 6(B)
  |    /
  |   /
  | _/
  Vv
3(K) ---> 5(E)
```

Here are all the possible paths:

```
Starting from node 1: CAT, CAB, CKE, CAKE
Starting from node 2: AT, AB, AKE
Starting from node 3: KE
Starting from node 4: T
Starting from node 5: E
Starting from node 6: B
```

After determining all possible strings from following all paths from all nodes in the graph, you must then determine all of the permutations of the possible strings.  For example, in the above graph, all possible paths are CAT, CAB, CKE, CAKE, AT, AB, AKE, KE, T, E, and B.  Here all the possible permutations of the strings representing the paths:

```
CAKE
CAEK
CKAE
CKEA
CEAK
CEKA
ACKE
ACEK
AKCE
AKEC
AECK
AEKC
KCAE
KCEA
KACE
KAEC
KECA
KEAC
ECAK
ECKA
EACK
EAKC
EKCA
EKAC
CAT
CTA
ACT
ATC
TCA
TAC
CAB
CBA
ACB
ABC
BCA
BAC
AKE
AEK
KAE
KEA
EAK
EKA
AT
TA
AB
BA
KE
EK
T
E
B
```

Based on this, you should find the longest valid word or words.  For this exercise, a valid word is one that is defined in the `wordlist.txt` file included in this directory.  If there are multiple words that are the longest (e.g. "BIRD" and "NERD"), you should display all of them.

The longest valid word in this example is "CAKE".

The program shall be called `word_finder.rb` and should be run with `ruby word_finder.rb *name_of_file*`.  Your repository shall be named D4.  This program must be written in Ruby and use minitest for the unit tests.  You may use whatever gem you like, provided it builds on my machine.  This program must also use rubocop with the attached .rubocop.yml configuration and SimpleCov as described in class.

You should work on making this program execute as quickly as possible (i.e., minimize real execution time).  You may use all computing resources available to you.  This will be run on a four-core system with eight gigabytes of RAM.  No other programs will be running at the time (except standard background processes, the terminal program, etc.).

You must use the flamegraph gem to determine execution "hot spots" and  the `time` command (or Measure-Command for Windows) to determine total execution time, both before and after any changes you make.

In other words, I would like you to first get this to work *correctly*, and commit this to GitHub.  You must then refactor the code to improve performance in some way and commit again.

You will tag the initial (working but non-optimized) commit with the tag INITIAL.  I should then be able to do "git diff INITIAL" to see the changes that you made to refactor the program.  I should be able to run the code on BOTH commits (INITIAL and the final commit on the master branch).  However, I will only check rubocop, tests, and statement coverage on the final commit on the master branch.

You should explain how your program has been sped up in your summary.  You should see some significant speed-up in real time from your initial commit to the final commit.

## Format
Every assignment should have a title page with:
* The name of the students in the group and their GitHub usernames
* A link to your repository
* The title "CS 1632 - DELIVERABLE 4: Performance Testing "

ENSURE THAT THE THE TA AND I ARE ADDED AS A COLLABORATOR ON GITHUB!  My username is `laboon`.  The TA's username is `chenranli`.  You will lose an automatic 10 points if either I or the TA cannot access your repository.

There is no need to print out the code BUT YOU MUST PRINT OUT AND HAND IN THE DELIVERABLE PAPERWORK.  The code should be available on GitHub BY THE BEGINNING OF CLASS.

For the summary, describe how you profiled and improved the application in approximately one page.  You should answer the following questions in your summary:

1. What was most challenging aspect of this deliverable?
1. What kind of edge cases and failure modes did you consider?
1. Using the flame graph, what methods were taking up the most CPU time?
1. Explain the changes that you made based on the flame graph or timing?

The summary should be approximately one to two pages.

On a separate page, you should include a screenshot of the flame graph.  You should  _also_ include the generated .html file in your repository.

You may experience issues rendering very large flamegraphs on your browser.  If so, I recommend using a smaller graph file.

There must be at least sixteen unit tests and statement coverage of at least 80%.  It is up to you if you would like to use more, use mocks/doubles/stubs or not, etc.  There just must be at least sixteen valid unit tests and statement coverage of 80% or greater.

The FASTEST program in the class (which is also correct!) will receive an automatic score of 120/100 on the assignment, regardless of any other issues with the assignment.

The second-fastest program in the class will receive +10 bonus points and the third-fastest will receive +5 bonus points.

Note that the graph files I will run on it will be similar to, but different, than the example graph files included in this directory.  The examples are included to give you an idea of the kinds of files that will be run.

The graph that I will be using specifically for the competition will be similar to the ultra_big_graph.txt file.

As this is due the last day of class, NO late assignments will be accepted.

## Tagging

You must "tag" the initial (unoptimized) commit you want to have graded with the tag "INITIAL".  Make sure you make an annotated and not a lightweight tag.  Also be sure you push the tag up to GitHub specifically!  Pushing up the branch to origin will NOT automatically push up the tag as well, you must do so separately.  If you want to tag the current commit, you may do so with the following commands:

```
git tag -a INITIAL -m "INITIAL"
git push origin INITIAL
```

Further details on tagging are here: https://git-scm.com/book/en/v2/Git-Basics-Tagging


## Grading
* Summary - 10%
* Flame graph - 5%
* Final times (>= 3 of each + mean) included - 5%
* Performance improvement - 10%
* Functionality - 35%
* Unit Tests (including statement coverage) - 30%
* -2 for each Rubocop error past three, up to -10 points off
