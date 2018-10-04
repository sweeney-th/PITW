use strict;
use warnings;
use feature qw(say);

# let's talking about using arrays

# declare one that is empty
my @empty;

# here we make one
my @sampleArray = ("Here", "There", "Everywhere");

# what if we need to add another element?
push(@sampleArray, "Knowing");

# there is another element now AT THE END
say(@sampleArray);

# what removal? pop takes the last off
pop(@sampleArray); # RIP "Knowing"

say(@sampleArray);

# the operations both use the end of the array use shift and pop to do these
# operations to the front
unshift(@sampleArray, "care");
say(@sampleArray);

# and remove it...
shift(@sampleArray);
say(@sampleArray);

# you can access array elements using indexing starting at 0 note that this
# operation is performed in scalar context
say($sampleArray[0]);

# you can also slice them using the .. is in array context!
say("1-2: ", @sampleArray[1..2]);

# you can also "negative-index" an array to get "the first from the back"
say($sampleArray[-1]);

my @secondSampleArray = ("Knowing", "That", "Love", "Is", "To", "Share");

# join these two bad larrys into one array
my @beatlesLyrics = (@sampleArray, @secondSampleArray);
say(@beatlesLyrics);

# iterating over an array involves using either a declared or default variable
# to perform an operation on each list

# this is the Perliest way to do it. It can be seen as kinda like slang: obvious
# to the initiated who use it every day, but without much context to outsiders

# call the "foreach" keywords, open braces, use "default variable"
foreach(@sampleArray) {
  say($_);
}

# the default variable just means "whatever scalar I throw at you, just roll
# with it". another, more modern way to do it is:

# call foreach, declare a scalar or your choice (name it sensibly!) and then do
# your digital deeds to it as you iterate through
foreach my $item(@sampleArray) {
  say($item);
}

# it's worth noting the default variable is fractionally faster if you're trying
# to squeeze every bit of speed out of your code but it's not something you are
# going to notice in most computations.

# want to sort an array? this will be alphabetical
say(sort(@beatlesLyrics));

# what about the other way?
say(reverse(@beatlesLyrics));

# Perl can do TONS of weird but occasionally useful sorting and parsing of
# things and this is by no means a full list

# how long is my array? it depends on how many things are in it! use the scalar
# function to answer this burning question
say(scalar(@beatlesLyrics));

# my experience is that most day-to-day work will involve declaring an empty
# array and pushing things you want into it so if you've got that down, you can
# look up the nitpicky stuff later. I highly reccomend "Modern Perl" as a
# general reference text. google the PDF version; that tis libre
