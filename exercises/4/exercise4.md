# CS 1632 - Software Quality Assurance
Fall Semester 2018 - Exercise 4

For this exercise, you and a partner will create a WolfPack simulator.  However, the Wolf class on which it depends is broken!  You will need to use stubs, dummies, doubles and mocks in order to write your own code and test it.

You are NOT to modify the Wolf class itself, i.e., wolf.rb should not be edited.  You may assume that it is a third-party library or code belonging to another team.

Note that the comments above each method state what it SHOULD do.

## Grading

This is an exercise and is thus not graded.

## Wolf Pack Simulator

The Wolf Pack Simulator allows you to add a wolf, determine the size of the biggest wolf in the pack, return the name of a random (technically pseudorandom) wolf, or make all the wolves in the pack howl.

You are going to modify the methods and write tests for these relatively simple methods, with your tests not referring directly to the class wolf.  Note that your CODE should not use doubles, only your tests.

You should write at least one test for each method, and stub or double when appropriate.  Ideally, you should do an equivalence class partioning and write a test for each equivalence class, but this is not necessary for this exercise.

## Why Do We Care?

Stubs, by removing dependencies to other classes, provide several benefits in software development:

1. When a unit test fails, it should point to the specific unit of code which is at issue.
2. They minimize complexity, allowing us to test a database interface, for example, without having to actually set up a real database with all the problems that entails.
3. It increases the speed of tests, especially if they rely on slow-running external code.  Unit tests are run quite often - they should be fast!
4. It minimizes failures in tests, especially for code which interacts with the outside world where networks go down, disks fail, third-party APIs go down, etc.

## Tips

1. Remember to run `bundle install` in the directory you are running this to make sure minitest is working.
2. Review `sample_code/minitest_example` and `sample_code/mock_example` directories in the class repo for syntax.