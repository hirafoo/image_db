package ImageDB::Utils;
use base qw/Exporter/;
use strict;
use warnings;
use Data::Dumper;
use ImageDB::Schema;
use Path::Class;
use Path::Class::Dir;
use Path::Class::File;
use YAML::Syck;

our @EXPORT = qw/
    p
    db
/;

sub import {
    strict->import;
    warnings->import;
    __PACKAGE__->export_to_level(1, @_);
}

sub p {
    local $Data::Dumper::Indent = 1;
    local $Data::Dumper::Terse  = 1;
    warn Dumper shift;
    my @c = caller;
    print STDERR "  at $c[1]:$c[2]\n\n";
}

sub db {
    my $name = shift;
    my $dist = $INC{"ImageDB/Utils.pm"};
    my $file = dir($dist)->parent->parent->parent->subdir('config')->file('database.yaml');
    my $config = LoadFile($file);
    my ($dsn, $username, $password) = (
        $config->{dsn},
        $config->{username},
        $config->{password},
    );

    ImageDB::Schema->connection($dsn, $username, $password)->resultset($name);
}

1;
