# If statements operate similarly to Java.
# They are checked for truthiness or falsiness.
# Parentheses are optional

bird_age = 18

if bird_age >= 25
  puts "This bird can be elected as a US Representative"
  puts "lalala"
else
  puts "This bird is ineligible to be a US Representative"
  puts "=("
end

if (bird_age >= 18)
  puts "This bird can vote"
end

# Note that this is TRUTHY but not true
# Doesn't matter to Ruby!
if bird_age
  puts "This bird has an age"
else
  puts "This bird is ageless"
end

# Ruby has "else if" like Java, but it is spelled "elsif"

if bird_age >= 5 && bird_age <= 18
  puts "This bird can go to public school"
elsif bird_age > 50
  puts "This bird can join the AARP"
else
  puts "This bird is living a boring life"
end

# Ruby also supports switch statements, but they are called case..when
# Note that there are no fall-throughs!
# That is, you do not need to worry about break statements
case bird_age
when 18..20
  puts "This bird just became an adult"
when 65
  puts "This bird can retire"
else
  puts "Nothing else interesting happening with this bird"
end

# Ruby also has unless, which acts as the opposite of "if"
# Generally avoid unless..else - this is difficult to understand

unless bird_age >= 35
  puts "This bird cannot be elected US President"
end

# You can do this on one line
# Ruby often reads like English
puts "This bird cannot retire" unless bird_age > 64
puts "This bird can meow" if nil

bird_credits = 89
puts "This bird cannot graduate" unless bird_credits >= 120
