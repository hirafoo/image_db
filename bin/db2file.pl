#!/usr/bin/perl
use lib qw{/var/www/image_db/lib};
use CGI qw/param/;
use ImageDB::Utils;

main(@ARGV);

sub main {
    my ($id, $ext) = (param('id'), param('ext'));
    my $I = db('Image');
    $I->db2file($id, $ext);
}
