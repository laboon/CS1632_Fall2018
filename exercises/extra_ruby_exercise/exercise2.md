# CS 1632 - Software Quality Assurance
Summer Semester 2018 - Exercise 2 

For this exercise, you and a partner will put on your cryptographer's hats and make a modern-day implementation of an ancient cipher!

## Grading

This is an exercise and is thus not graded.  However, if you complete it BEFORE THE NEXT class and your code can both encode the file `makesecret.txt` and decode the `secret.txt` file, you will win +1 extra credit for D1.  The first three groups to write the code to do it will win a special prize.

## The Caesar Cipher

A cipher is like a code, except instead of individual characters mapping to some other character, there is an algorithm which states how characters are transformed.  For example, if I had a system where A = 13, B = 9, C = 987, etc., where the mapping itself is the way to encrypt/decrypt, I have a code.

A simple cipher might be: to encrypt, shift the character up by two; to decrypt, shift down by two, both modulo the number of possible characters.  Furthermore, assume for simplicity's sake that our alphabet consists only of the letters A-Z, all capital.  Now to encrypt, any A will be shifted up to a C, any B shifted up to a D, any C to an E, etc., all the way to a Z, which will become a B (and Y will become A).

For example, assume we are encrypting the word DINOSAUR.  D would be shifted to F, I to K, N to P, etc.

```
DINOSAUR
FKPQUCWT
```

To decrypt, we would just do the opposite - shift the F to a D, K to an I, etc.

```
FKPQUCWT
DINOSAUR
```

The _key_ to this cipher is 2; if you know that you have to shift the characters up by two to encrypt and down by two to decrypt, you can encrypt/decrypt any text.  Another key might be 4 - then you would shift by four to encrypt/decrypt.  For example, A would become E, B would become F, C would become G, etc.

This is known as a Caesar cipher.  Although this is a valid cipher, do not rely on its effectiveness!  It is easily broken, even by hand.  Even if you were to brute-force it, there are only 26 possibilities to try.  See http://practicalcryptography.com/ciphers/caesar-cipher/ if you are interested in the cryptographics details of the Caesar cipher.

## Pretty Cromulent Privacy

We are going to make a program, PCP (Pretty Cromulent Privacy), which will use a slight variation of the Caesar cipher.  Given three arguments - a password, an e or d (for encrypt or decrypt), and a filename, it will output an encrypted or decrypted version of the file.

You may assume for our purposes that the password is alphanumeric (A-Z0-9, no spaces or anything else) and that the file is located in the same directory as the `pcp.rb` program.

PCP will first generate a key according to the following algorithm: take the ASCII value of each element of the password and multiply it by two.  Then the program will add all of these numbers up and add one.  This will be the key which is "stored" by the password.  Let's step through generating a key using "meow" as the password.

```
Characters in "meow":
["m", "e", "o", "w"]
ASCII values of characters:
[109, 101, 111, 119]
ASCII values of each character multiplied by 2:
[218, 202, 222, 238]
Sum of all values:
218 + 202 + 222 + 238 = 880
Add one
880 + 1 = 881

KEY IS 881
```

Now, read in each line from the file to encrypt.  We will NOT encrypt EOL characters (carriage return / line feed), so the number of lines in our encrypted file should equal the number of lines in our decrypted file.

For each character in a line, add the key to the original character value, modulo 128, then print out the character value of the generated value.  For example, let us walk through the first character `T` in `test.txt`.

```
ASCII value of T = 84
KEY = 881
84 + 881 = 965
965 % 128 = 69
Character value of 69 = 'E'
```

So the first character in our encrypted file should be 'E' - and as you can see in `test_encrypted.txt`, it is.

To decrypt, follow the same algorithm, but subtract the key instead of adding it.

```
ASCII value of E = 69
KEY = 881
69 - 881 = -812
-812 % 128 = 84
Character value of 84 = 'T'
```

And now we have decrypted back to our original character.

If we had entered a different password, the key would most likely be different and we would generate garbage.  Note that this is not a great cipher - there are practically only 128 different possibilities for a key value (since we calculate modulo 128).

Note - some of the characters generated may not be visible at the terminal or in your text editor (e.g. control characters).  You can either set your text editor to hex mode (e.g. `M-x hexl-mode` in Emacs, vim should handle this by default, `Toggle Hex View` in Sublime Text, etc.) or `xxd *filename*` at the Unix prompt.  If you are using Windows, Notepad++ has a hex editor plugin.

Of course, you don't have to use a hex editor, you should be able to read/write just fine, you just may not see all of the characters when you print out the file.

## Ruby Help

The following methods/techniques might be useful to you.  I will show them in the Ruby REPL, `irb`.

Given some string `str`, `str.split('')` will convert it to an array of Strings of one single character.  These Strings can be treated as characters in terms of `.ord` to get their ASCII value.

```
irb(main):008:0> foo = "modern major-general"
=> "modern major-general"
irb(main):009:0> foo.split('')
=> ["m", "o", "d", "e", "r", "n", " ", "m", "a", "j", "o", "r", "-", "g", "e", "n", "e", "r", "a", "l"]
irb(main):010:0> foo_arr = foo.split('')
=> ["m", "o", "d", "e", "r", "n", " ", "m", "a", "j", "o", "r", "-", "g", "e", "n", "e", "r", "a", "l"]
irb(main):011:0> foo_arr.count
=> 20
```

To do the opposite and combine all of the characters in an array together to make a single string, you can use the `join('')` method.

```
irb(main):001:0> foo = "modern major-general"
=> "modern major-general"
irb(main):002:0> foo_split = foo.split('')
=> ["m", "o", "d", "e", "r", "n", " ", "m", "a", "j", "o", "r", "-", "g", "e", "n", "e", "r", "a", "l"]
irb(main):003:0> foo_again = foo_split.join('')
=> "modern major-general"
irb(main):004:0> foo == foo_again
=> true
```

If you are wondering what the ticks `('')` mean, they are simply saying that the characters themselves are the delimiters, as opposed to some other characters.  For example, assume a comma-delimited list of names "joe,jane,jill" in a single string.  I want to split this into an array of three strings, "joe", "jane", and "jill".  I can use `.split(',')` to use the comma as a delimiter.

```
irb(main):005:0> names = "joe,jane,jill"
=> "joe,jane,jill"
irb(main):006:0> names_arr = names.split(',')
=> ["joe", "jane", "jill"]
irb(main):007:0> names_arr.count
=> 3
```

Given some string or character `str`, `str.ord` will return the ASCII value of str.  For example, `'Z'.ord` would return 90, `' '.ord` would return 32, `'A'.ord` would return 65, etc.

```
irb(main):012:0> foo[0]
=> "m"
irb(main):013:0> foo[0].ord
=> 109
```

Given some value `n`, `n.chr` will return the ASCII character corresponding to that number.  For example, 90 is capital Z, 32 is space, 65 is capital A, etc.

```
irb(main):001:0> 90.chr
=> "Z"
irb(main):002:0> 32.chr
=> " "
irb(main):003:0> 65.chr
=> "A"
```

Want to convert a String into its ASCII values?  The `.map` method is very useful.  You will probably end up using `map` quite often - given some enumerable (e.g., an array, a linked list, a hash... anything that you can travel from one "end" to another), it will transform each element in it.  A related method is `reduce`, which will convert all of the elements in the enumerable into a single element.

For example, here I will convert all of the individual characters of foo into their ASCII equivalents, and then multiply all of them together to get one value.

```
irb(main):014:0> split_foo = foo.split('')
=> ["m", "o", "d", "e", "r", "n", " ", "m", "a", "j", "o", "r", "-", "g", "e", "n", "e", "r", "a", "l"]
irb(main):015:0> split_foo.map { |c| c.ord }
=> [109, 111, 100, 101, 114, 110, 32, 109, 97, 106, 111, 114, 45, 103, 101, 110, 101, 114, 97, 108]
irb(main):016:0> foo_ascii_vals = split_foo.map { |c| c.ord }
=> [109, 111, 100, 101, 114, 110, 32, 109, 97, 106, 111, 114, 45, 103, 101, 110, 101, 114, 97, 108]
irb(main):017:0> foo_ascii_vals.reduce(:*)
=> 4319523143171083498633244603837337600000
```

Remember - `map` will evaluate to the same number of elements as the original enumerable.  `reduce` will always return a single value.

## Test Files

The file `test.txt` has been encrypted with the password `meow` and the output piped to `test_encrypted.txt`

## Secret Files

You should use the password `bonbon` to decrypt `secret.txt` and encrypt `makesecret.txt`.

## Sample Output

To put the output of the program to a new file, use the file input redirector, `>`.  This should work in Windows command shell, Powershell, and Unix shells.

```
(1266) $ ruby pcp.rb kittykat e test.txt > encrypted_with_kittykat.txt

(1267) $ more encrypted_with_kittykat.txt 
"encrypted_with_kittykat.txt" may be a binary file.  See it anyway? 
?34>^K4>^K,^K?0>?
_ST^^KT^^KL^K_P^_
?34>^K4>^K,^K?0>?
_ST^^KT^^KL^K_P^_

(1268) $ xxd encrypted_with_kittykat.txt 
0000000: 3f33 343e 0b34 3e0b 2c0b 3f30 3e3f 0a5f  ?34>.4>.,.?0>?._
0000010: 5354 5e0b 545e 0b4c 0b5f 505e 5f0a 3f33  ST^.T^.L._P^_.?3
0000020: 343e 0b34 3e0b 2c0b 3f30 3e3f 0a5f 5354  4>.4>.,.?0>?._ST
0000030: 5e0b 545e 0b4c 0b5f 505e 5f0a            ^.T^.L._P^_.
```

```
(1257) $ ruby pcp.rb meow d test_encrypted.txt 
THIS IS A TEST
this is a test
THIS IS A TEST
this is a test

(1258) $ ruby pcp.rb meow e test.txt 
E9:D:D2E6DE
eYZdZdReVde
E9:D:D2E6DE
eYZdZdReVde

(1259) $ ruby pcp.rb WRONGPASSWORD d test_encrypted.txt 
D89C9C1D5CD
dXYcYcQdUcd
D89C9C1D5CD
dXYcYcQdUcd
```


