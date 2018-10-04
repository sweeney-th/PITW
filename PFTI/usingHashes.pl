use strict;
use warnings;
use feature qw(say);

# it's hash time

# some preliminaries:
# 1) Hashes are lit of "key", "value" pairs
# 2) they are inherently UNORDERED thus you can't count on them being printed
# in the same order form one execution to the next this seems weird at first,
# but you're using it to look them up by a key, not a value, so it doesn't
# matter

# we make a hash with the fat comma (=>)
my %radPeopleHash = ("Atul", => "Gawande", "Martin" => "Odersky",
                     "Ada" => "Lovelace", "Maureen" => "Achebe");

# also, search these people if you don't know who they
# are because they freaking rule

# call in scalar context with {}
say($radPeopleHash{"Martin"});

# what if we want to set a new value?
$radPeopleHash{"Greatest"} = "Ever";

say($radPeopleHash{"Greatest"}); # <- like a sprained ankle -_-

# want to see all the keys?
foreach my $key(keys(%radPeopleHash)) {
  say("First name: $key, Last name: $radPeopleHash{$key}");
}

# does something exist in my hash? sometimes you'll want to see if
# something is in the hash and proceed accordingly as calling for
# something that isn't there will crash you out. we can avoid this
# using the 'exists'  and a conditional

if(exists $radPeopleHash{"Russ"}) {
  say($radPeopleHash{"Russ"});
} else {
  say("There is no entry for Russ");
}

# note in some cases there might be a key in a hash, but the value isn't
# defined yet (perhaps you read in an array of some sort) in this case
# it pays to check that the key "exists", and the hash is "defined"

# and an undefined value
$radPeopleHash{"Russ"} = undef;

# && is Perl's logical operator for "and"
if(exists($radPeopleHash{"Russ"}) && defined($radPeopleHash{"Russ"})) {
  say($radPeopleHash{"Russ"});
} else {
  say("There is a key for Russ but no entry");
}
