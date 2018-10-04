use strict;
use warnings;
use feature qw(say);

# Perl has a quirky type system the main types we work with are Scalar, Array,
# and Hash

# because of 'strict', we declare variables using "my" the first time we use
# them

### SCALAR

# scalars are denoted with the "$"
my $exampleScalarString = "A string of text!";

# scalar "context" (status) can be used for strings or numbers
my $exampleScalarNumber = 1;

say("$exampleScalarNumber is a scalar");
say("so is $exampleScalarNumber");

# you may have noticed that perl "interpolates" (makes part of a string)
# the variables we've declared into the string. this is because I used " "
# if you realy wanted to say the phrase '$exampleScalarNumber', you could do:
say('$exampleScalarNumber is a scalar');

# and yes, you can mix them:
say('$exampleScalarNumber', "is $exampleScalarNumber");

### ARRAY

# the next type, used all the time, is array, basically a list of information.
# it's type is denoted with the @ symbol, which Rubyists will recognize from
# class attributes. not the same here!
my @sampleArray = ("Here", "There", "Everywhere");

# you can print the whole list like this:
say(@sampleArray);

# you will notice there are no spaces and they are all on one line if we can to
# print them with spaces we can use the join, which connects each item of the
# list on a character of your choosing. we can store the result in a variable,
# or just print it out directly. we'll just use spaces but we can join on other
# things like tabs, too.

# note that it's a string now
my $newList = join(" ", @sampleArray);
say($newList);

# we will get into common operations of arrays in another script

### HASH

# the last type, less common but very useful is a "hash", denoted by the %
# this works just like a dictionary (which is why in Python it's just called
# a dict), storing "key" and "value" pairs to associate two things like a
# first and a last name. It is sometimes called an "associative array" for
# this reason. If you're coming from Java of C++ its like a Map

# the "=>" or "fat comma", points a key to it's value like we're looking it up
# in a dictionary
my %exampleHash = ("Atul" => "Gawande", "Martin" => "Odersky");

# now, if we call any of the first elemtes (keys), the hash gives back it's
# value - this prints "Gawande", not "Atul"
say($exampleHash{"Atul"});

# we will get into the operations you might see on a hash in another script
