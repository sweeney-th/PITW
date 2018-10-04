use strict;
use warnings;
use feature qw(say);

# A subroutine is a block of code that can be called over and over again.
# writing functions well is essential to writing good code. Here is how it
# is done in Perl

# here is a simple function:

# the keyword "sub" starts a subroutine definition, and the
# code inside it defines the behavior. it starts and ends with { }
sub saySomething
{
  say("I use functions");
}

# a function is "called" using it's name with ().
saySomething();

# we can get more robust behavior from subs if we give them "arguments",
# to provide data to them or instruct them to do things
sub saySpecificThings
{
  my $specifcThing = shift; # the shift command is like those used on arrays
  say($specifcThing)        # it sees the arguments passed as a list, and
}                           # uses shift to get the argument

saySpecificThings("Whatver you like");

# you can shift more than oncee to pass more than one thing...
sub sayTwoThings
{
  my $first = shift;
  my $second = shift;
  say($first, $second);
}

sayTwoThings("First", "Second");

# ... but it is more idiomatic and clean to use a list:
sub sayThreeThings
{
  # use ( ) to group declarations, and default list variable "@_"
  my ($first, $second, $third) = @_;
  say($first, $second, $third);
}
sayThreeThings("Here", "There", "Everywhere");

# so far we've been using "void" functions that do an action (say things),
# but functions often "return" things, ie give us back the result of their
# calculations. Here is a simple example:
sub addOne
{
  my $number = shift; # take the number
  $number++; # increment it
  return $number; # use the 'return' keyword to get it
}

# we can then use the function
my $testNumber = 9;
say(addOne($testNumber));

# be sure to use shift if you're only going to be passing a single argument
# because, while passing the default array ( @_ ) to a function that assigns
# it to a single scalar variable is perfectly legal, it will give you the scalar
# context of that array (a number representing the length of the list), which
# probably isn't what you want. this illustrates this concept with a function
# based on the excellent explanation in "Modern Perl", which you should read.

# the author of a sub like this probably thinks they're going to to get a
# string. they're not.
sub haveMisunderstanding
{
  my $notAString = @_; # this is a list, so it's scalar context is a number!
  say($notAString);
}

say(haveMisunderstanding("What is happening?")); # RIP

# keep in mind there is nothing stopping you from calling a sub from within
# a sub (in fact, you'll almost certainly need to) like this:
sub addressMiscommunication
{
  say("I tried to say...");
  sayThreeThings("Here", "There", "Everywhere");
  say("but I accidentally said...");
  haveMisunderstanding("Here", "There", "Everywhere");
}

# clear the whole thing up
addressMiscommunication();
