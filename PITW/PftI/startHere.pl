# Welcome to Perl for the Impatient!
# seeing as we're in a hurry this is a comment, denoted with #

# Generally, Perl programs shoud starts like this:
use strict;
use warnings;

# this gives us feedback and helps Perl check us on using
# variables that haven't been declared yet to reduce bugs

# you need to add the "\n" explicity, and mind the ;
print "Hello World\n";

# you can add  ( ) if you like, to help comparmentalize
print("Hello Again World!\n");

# personally I like to use the "say" feature, like "puts" from Ruby or "print"
# form Python, it adds the new line for you.
use feature qw(say);

say("Hello World, Once more with feeling!");

# if you're wondering, qw() puts quotes around things for you
say(qw(Hello));

# next, we will looke at types in Perl
