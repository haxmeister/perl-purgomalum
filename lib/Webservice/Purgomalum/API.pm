use strict;
use warnings;

package Webservice::Purgomalum::API;

our $VERSION = 1.000;
use HTTP::Tiny;
use Carp;
use Data::Dumper;

my $base_url = 'https://www.purgomalum.com/service/';

sub new{
    my ($package) = @_;
    my $self = {
        'ua' => HTTP::Tiny->new(),
        'debug'=> 0,
    };
    bless $self, $package;
    return $self;
}

sub contains_profanity{
    my ($self, %params) = @_;
    return $self->fetch('containsprofanity?', %params);
}

sub get{
    my ($self, %params) = @_;
    return $self->fetch('plaisn?', %params);
}

sub fetch{
    my ($self, $endpoint, %options) = @_;
    my $params = $self->ua->www_form_urlencode( \%options );
    my $response = $self->ua->get($base_url.$endpoint.$params) or croak "$!";

    print STDERR Dumper($response) if $self->{debug};

    return $response->{content};
}

sub ua{
    my $self = shift;
    return $self->{ua};
}

sub debug{
    my ($self, $toggle) = @_;
    if (defined $toggle){
        $self->{debug} = $toggle;
    }
    return $self;
}
1;
