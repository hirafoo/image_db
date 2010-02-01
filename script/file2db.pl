#!/usr/bin/perl
use lib qw/lib/;
use ImageDB::Utils;

main(@ARGV);

sub main {
    my $file = shift or die "args: image_file";
    my $I = db('Image');
    $I->file2db($file);
}
