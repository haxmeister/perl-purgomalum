#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Webservice::Purgomalum::API;

my $api = Webservice::Purgomalum::API->new();

print $api->contains_profanity(
        text => "what the hell?",
    )."\n";

print $api->get(
    text => "what the heck dude?", #required
    add => "heck",             #optional
    fill_text => "really long replacement text", #optional
    fill_char => '-',          #optional
)."\n";

# output debugging data to STDERR
$api->debug(1);
print $api->get(
    text => "what the heck dude?", #required
    add => "heck",             #optional
    fill_text => "really long replacement text", #optional
    fill_char => '-',          #optional
)."\n";

