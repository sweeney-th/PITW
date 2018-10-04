use strict;
use warnings;
use feature qw(say);



### regular expressions and pattern matching



# regular expressions are probably Perl's more celebrated feature, and one
# of the reasons it's found favor in Bioinformatics. they allow patterns to
# be extracted from text even if they vary at certain points, or any point,
# in ways that searching for equality never could. it also allows them to be
# extracted as subgroups of a broader pattern. they are a little tricky and
# getting one to work just how you want it to might take a bit, but you can
# do just about anything with them once you get them working.



### does a string contain a pattern?

# let's say we have some messy text and we want to see if it contains
# the word "text"
my $string = "hereissometextthathasbeenobfustcated";

# define our target
my $textTarget = "text";

# use the tilde at the end of = to call regex
if($string =~ $textTarget) { say("Found $textTarget in $string"); }

# in this context, you can think of the =~ as meaning "contains"
# "if the string contains the target, say the target is in the string"

# you can also use the "!" operator to assert that a string doesn't contain
# a pattern:

# test vibes
my $firstVibes = "goodvibes";

# test for bad vibes: if we find them, tell them to get lost

# if they're not bad...
if($firstVibes !~ "bad") {
  say("I like the vibes!");
} else {
  say("no bad vibes!");
}



### variations in strings

# this is nothing special yet really, but it starts to become handy
# when you have room for variation. let's say we want to extract text
# from a name even if there is a variation in how it's spelled:

# "is that Kate with a 'K' or 'C'?"
my $firstSpelling = "Kate";
my $secondSpelling = "Cate";

# we don't know if we're looking for a C or K. since this is a pattern that
# varies predictably (regular expression), not just checking for the presence
# of something static in a string, we use / / to denote that it's a regex.
# putting the variations  inside of [ ] will allow us to catch both cases.
# it can be seen as 'either'.
if($firstSpelling =~ /[KC]ate/) { say("It contains a K or a C!"); }

if($secondSpelling =~ /[KC]ate/) { say("It contains a C or a K!"); }

# we've basically said, "either a C or a K and then 'ate'"

# we can apply this "or" effect to full stings, not just characters, with the
# "|" character
my $negative = "no";
my $ambiguous = "maybe";
my $affirmative = "yes";

# see if the above strings contain either a yes or a no
if($negative =~ /(yes|no)/) { say("It contains a definite answer: $1"); }
if($ambiguous =~ /(yes|no)/) { say("It contains a definite answer: $1"); }
if($affirmative =~ /(yes|no)/) { say("It contains a definite answer: $1"); }



### pulling the matches out

# here is some annoying text:
my $messyTest = "hereismyTARGEThiddenbystuff";

# let's say we want to get TARGET out of the string to do some kind of
# operation on it. Perl's provides default "numbered capture" variable
# to manipulate it. to use them, enclose the pattern in ( )
if($messyTest =~ /(TARGET)/) { say($1); }

# we can further enclose using another set of ( ), and use the next number
# to access the results
if($messyTest =~ /(TAR(GET))/) { say("found $1, which contains $2"); }

# in larger passages it is handy to assign the numbers to variables
if($messyTest =~ /(TAR(GET))/) {
  my $firstHit = $1;
  my $secondHit = $2;
}



### substitutions

# regexes can be used to systematically replace things that match their
# criteria. let's replace 'terrible' with 'awesome'

my $characterStatement = "I am a terrible person!";

# putting an 's' in front of the regex denotes substitution behavior. the
# target comes first, then the desired replacment
$characterStatement =~ s/terrible/awesome/;

say($characterStatement);



### number of occurences

# regexes can also specify a number of characters to look for using { }.
# if we want to match between 4 and 5 times, for instance, we can use
# {2,4} in our expression

                  # 3 As   # 4 As    # 5 As     # 6 As
my @weirdWords = ("QAAAQ", "QAAAAQ", "QAAAAAQ", "QAAAAAAQ");

# iterate through the words and test our condition
foreach my $word(@weirdWords) {
  # print it contains a run of 4 or 5 "A"s
  if($word =~ /A{4,5}/) { say($word); }
}

# more general versions of this operation could be also be achieved using
# "*", "+", and "?" operators (collectively knows as "quantifiers").

my $yes = "yessssssss!";

# the "*" operator matches "zero of more" of the character it follows,
# so, y, e, and and zero or more "s"s.
if($yes =~ /(yes*)/) { say($1); }

# the "+" operator matches "one or more" so, y, e, and and one or more "s"s.
if($yes =~ /(yes+)/) { say($1); }

# the "?" operator matches "one or zero"
if($yes =~ /(yes?)/) { say($1); }

# notice the first two, "or more", operators keeo going as long as they can.
# this is known as "greediness"



### the "." operator

# the "." character matches anything that isn't a newline. for example, if
# we want to match something where the middle might vary, we could do this

my @spellingsOfTwo = ("Two", "Too", "To");
# only get those that have a "T", then something, then "o"
foreach my $spelling(@spellingsOfTwo) {
  if($spelling =~ /T.o/) { say($spelling); }
}


### modifiers

# modifiers appear after the final / in a regex pattern and change the way
# the function behave. for example, the "g" modifier allows for finding
# all occurences, and the "i" modifier causes the match to be case in-sensitive

# using the case inensitivity modifier to match CAPS to caps
if("CAPS" =~ /caps/i) { say("I found it anyway!"); }



### find all the occurences of a string with the global modifier

# this is one of the more common operations, so I am giving it it's own
# section. let's say we want to get all the WHEAT out of a pesky chaff

my $wheatAndChaff = "thisischaffwhereistheWHEATwhootlookmoreWHEATyay";

# we will store them in an array
my @wheat;

# use while while a global modifier to get all the matches
while($wheatAndChaff =~ /(WHEAT)/g) { say($1); }



### more escaped/metacharacters

# what happens if we want to match a metacharacter like a .? we can escape
# it with a preceeding "\"

# a string with a .
my $hasPeriod = "there is an actual . in this";

# escape the .
while($hasPeriod =~ /(\.)/g) { say($1); }



# regexes can take more meta characters (newlines, etc) to fine tune their
# behavior. for example, let's say we were trying to match some characters
# with spaces in them:

# note two spaces, each preceeded by an "e" and followed by an "s"
my $stringWithSpace = "Thereisone spacehere,onemore spacehere";

# match "e", space, "s"
while($stringWithSpace =~ /(e\ss)/g) { say($1); }

# what about digits?
my $stringWithDigits = "1thing 2things 3things";

# the \d matches any digit
while($stringWithDigits =~ /(\d)/g) { say($1); }

# a more in context example to out things together: this regex matches
# any digit with any number of non-newline character, then a space. note
# that the last entry, '3things', doesn't satisfy this criteria
while($stringWithDigits =~ /(\d.*\s)/g) { say($1); }

# getting any alpha numerics and underscore characters is possible with
# the \w :
my $alphaNumerics = "*alpha_num3r1cs*";

# escape the "*" chatacters, and then find any number or alpha numerics
# in between them
while($alphaNumerics =~ /\*(\w.*)\*/g) { say($1); }



### practical example: parsing website urls

my $websites = "xwww.hello.comxxxwww.pythoninthewyld.comxxxwww.python.org";

# working example (we will go over it step by step afterwards)
while($websites =~ /www\.(.*?)(\.com|\.org)/g) {
  say("$1 is a $2");
}

# first order of buisiness: avoid the "x"s and get the www. we can simply use
# the string "www" at first, which gives us:

# /www/

# then need to catch the "." literally, not as a a modifier, so we escape it

# /www\.

# I've opted to pull the name of the site out only, ie "python" out of
# "www.python.org", so we want to match all the stuff in between the www
# and ".com". We don't, however want to go all the way until the LAST .com
# or we would get "hello.comxxxwww.pythoninthewyld", see we use the g modifier
# with the ? to get all the individual occurences of the string. that's the
# first part of the match, so it's enclosed in ( ).

# /www\.(.*?)     /g

# next is the twist: some of the sites are .coms and some are .orgs. this means
# it's time to bust out the "|" operator. in the next group of ( ) we signify we
# want either \.com or \.org (remember to escape the ".")

# (\.com|\.org)/

# this gives us:

# /www\.(.*?)(\.com|\.org)/g

# which basically translates to "find every occurence in the whole string where
# something is between 'www.' and either a '.com' or '.org', then bring be the
# thing after the 'www.' but before the '.whatever' and the '.whatever itself'
