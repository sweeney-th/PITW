use strict;
use warnings;
use feature qw(say);

# let's get logical!

### IF/ELSIF/ELSE

# Perl uses a pretty traditional C-style approach to logic and control
# flow (with a few weird but manageable quirks for comparisons)
my $number = 7;

# if does what you think it does. the > operator is straight from
# your elementary school math class. nothing to fear here. isolate
# your commands with {}.
if($number < 10) {
  say("The number is less than 10");
}

# other intuitive operators:
# add: +
# divide: /
# multiply: *
# raise to power: **
# set equal to: =

# more exotic operators
# modulus: % (returns the remainder: we will see this soon)
# compare numbers: ==
# compare strings: eq

# else allows us to branch our logic to accounts for more options
if($number < 7) {
  say("It's less than 7");
} else {
  say("It is not less than 7");
}

# you might have notice there is something missing here
# it could be 7, or less than 7, but it could also just be 7
# enter 'elsif'

my $newNumber = 8;

if($newNumber < 8) {
  say("It is less than 8");
} elsif($number > 8) {
  say("It is more than 8");
} else {
  say("It is actually 8");
}

# note that if and elsif need a condition in ( ),
# and else does not, as it is where the logic "falls through"
# if neither condition is met. also not that you can have any
# number of elsifs - knock your self out

# while operations continue as long as a certain condition is met
# here is the classic example:

my $counter = 0;

while($counter < 10) {
  say($counter);
  $counter++; # this is shorthand for $counter + $counter
}

# note that if you don't increment the counter, this code will
# go until your computer dies ( or you hit ctrl-c :p )

### MULTIPLE CONDITIONS
# && is for "and", || is for "or"

my $newCounter = 0;

# this will skip right over 5,6,7, and 8 because they are
# less than are not less than five or greater than 8
while($newCounter < 10) {
  if($newCounter < 5 || $newCounter > 8) {
      say($newCounter);
  }
  $newCounter++; # this is shorthand for $counter + $counter
}

# this will do the opposite it only prints out 6,7
my $newerCounter = 0;

while($newerCounter < 10) {
  # notice it's greater than now
  if($newerCounter > 5 && $newerCounter < 8) {
      say($newerCounter);
  }
  $newerCounter++;
}

# the modulus operator returns the remainder of a division, so 5 % 4 is 1.
# four goes into 5 once and leaves one left over. It's often use to test
# if a number is divisible by something, ie leaves no remainder. This also
# demonstrates comparing to number:
my $modulusNumber = 6;

if($modulusNumber % 3 == 0 && $modulusNumber % 2 == 0) {
  say("The number is divisible by 2 and by 3");
} else {
  say("The number is not divisble by both numbers");
}

# strings
my $firstWord = "Here";
my $secondWord = "Here";

# compare them:
if($firstWord eq $secondWord) {
  say("The words are the same");
}

# also, you can put the whole expressions in braces on one line it it's short
if($firstWord eq $secondWord) { say("Brevity!"); }

# you don't strictly need the ";", but I leave it there out of habit because
# some languages do and if there where more then phrase you would need it
if($firstWord eq $secondWord) { say("Brevity?"); say("Cool!") }
