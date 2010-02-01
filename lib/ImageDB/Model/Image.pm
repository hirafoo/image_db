package ImageDB::Model::Image;
use ImageDB::Utils;
use Digest::SHA1;
use MIME::Base64;

sub file2db {
    my ($self, $filename) = @_;

    open my $fh, "<", $filename or die $!;
    my $sha1 = Digest::SHA1->new;
    $sha1->addfile($fh);
    close $fh;

    my $id = $sha1->hexdigest;

    $self->find($id) and do {
        print "duplicate !\n";
        return;
    };

    open $fh, "<", $filename or die $!;
    my $data;
    for my $i (<$fh>) {
        $data .= $i;
    }
    close $fh;

    my $ext = (split /\./, $filename)[-1];
    $filename = (split /\//, $filename)[-1];

    $self->create({id => $id, filename => $filename, ext => $ext, data => $data});
}

sub db2file {
    my ($self, $id, $ext) = @_;
    p "db2file called";

    my $I = db('Image');
    my $file = $I->search({id => $id})->next or do {
        p "not found !";
        return;
    };

    print "Content-type: image/$ext\n\n";
    print $file->data;

    open my $fh, ">", "/var/www/image_db/htdocs/images/$id.$ext";
    print $fh $file->data;
    close $fh;
}

1;
