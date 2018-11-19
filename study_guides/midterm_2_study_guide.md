# CS 1632 Midterm 2 Exam Study Guide - Fall 2018

The midterm is on 28 NOVEMBER 2018.  You will have the entire class period to complete it.

The midterm will cover everything since the last midterm up until the last class before this midterm.  I recommend you review the slides and the textbook (see syllabus.md for reminders of which chapters were required reading).


## ADVANCED UNIT TESTING
* Unit tests
  * Know how to make doubles, mocks, stubs
  * Know how to use expects (verification)
  * Understand when to use the above, and why they are beneficial
  * Be able to write Minitest tests which use doubles/mocks/stubs
  * You may want to review basic unit testing structure as this will be necessary in order to write Minitest tests which use doubles, mocks, and stubs

## WEB TESTING
* Be able to explain how you would test a web page with Katalon
* Understand difficulties of web testing and automated system testing in general
* You should know basic Selenese (Katalon/Selenium scripting language), e.g.
  * Opening a URL
  * Clicking on a link
  * Testing for text
  * You will not need to know about specifying target selection, but do need to know what target selection is and recognize it (i.e. if I show you a webpage, I will note specific target values for different elements - you will not need to read raw HTML)

## PERFORMANCE TESTING
* Understand concepts on how to test performance
* Be able to write test plans for different performance indicators and systems
* Terminology: Service-Oriented vs Efficiency-Oriented Indicators
* Availability, Response Time, Throughput, Utilization
* Performance targets, performance thresholds, KPIs - understand and be able to generate!
* Measuring response time - methodologies
* Understand different concepts of time: user, system, total, real
* Measuring availability, concurrency, scalability, throughput
* Understand n 9's (e.g., 5 9s vs 6 9s)
* Load testing - baseline, soak/stability, stress tests

## PROPERTY-BASED TESTING
* Be able to write simple property-based tests with Rantly
* Be able to name invariants given a function and sample input/output
* Be able to show how invariants are broken
* Understand what shrinking is and be able to shrink an input given an error
* For what kinds of functions is property-based testing useful?  For what kinds is it less useful?

## INTERACTING WITH STAKEHOLDERS
* Be able to name some stakeholders and what is important to them (upper management, project management, testers, other developers)
* Be prepared for some "fake" interaction with various stakeholders
* Be able to put together a red-yellow-green template report

## TESTING STRATEGY
* Understand the testing pyramid
* Understand common anti-patterns (ice cream cone, cupcake)
* Given a description of a program, be able to develop your own testing strategy