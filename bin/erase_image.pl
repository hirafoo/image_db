#!/usr/bin/perl
use lib qw{/var/www/image_db/lib};
use CGI qw/:standard/;
use ImageDB::Utils;

main(@ARGV);

sub main {
    my @files = </var/www/image_db/htdocs/images/*>;
    unlink @files;

    print header(-type=>'text/html',
                 -charset=>'utf-8');
    print start_html('画像消したよ');
    print '<p>画像を全部消したよ</p>';
    print q{<a href="/">TOPに戻る</a>};
    print end_html;
}
