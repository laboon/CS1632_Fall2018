# EXERCISE 8

Congratulations, console jockey.  You're about to punch deck and crack through the blackest ice in cyberspace. _*_

All you have to do is enter the secret word and untold riches (or at least some extra credit) are yours.

You may work with a partner or by yourself.

_*_ If you don't get any of these references, you should really read _Neuromancer_ by William Gibson.

## Instructions

I advise you to first examine the Security class in ./example.  The secret word for this file is `catfish`.

```
(20109) $ java Security
Establishing connection to mainframe.....
Developing Visual Basic GUI to track IP.....
Decrypting mutexes for object-oriented analysis.....
ENTER SECRET WORD > loopback
ACCESS DENIED!!!
ENTER SECRET WORD > rabbit
ACCESS DENIED!!!
ENTER SECRET WORD > catfish
ACCESS GRANTED: CATFISH
```

How should you figure it out?  That's up to you.

## Hints

1. Note that word entry is case-insensitive (e.g., it would have accepted `CATFISH` or `CaTfIsH` (but not, sadly, `c4tf15h`).
2. The password is an actual English word (i.e. it would exist in an online dictionary like the one found here: https://github.com/laboon/CS1632_Fall2018/blob/master/deliverables/4/wordlist.txt), although it may or may not be a common one.
3. There are a variety of ways to figure this out.  I urge you to "think outside the box" on this exercise.  Think about what knowledge you DO have of the problem and how you can take advantage of that.

# GRADING

If you can come up with the secret word and demonstrate it to me by the END OF CLASS, you will get 1.0 point of extra credit for the course.
