package ImageDB::Schema::Image;
use ImageDB::Utils;

__PACKAGE__->resultset_class('ImageDB::ResultSet::Image');
__PACKAGE__->resultset_attributes({
    alias => 'image',
    from  => [{image => 'image'}],
});

package ImageDB::ResultSet::Image;
use base qw/DBIx::Class::ResultSet ImageDB::Model::Image/;
use ImageDB::Utils;

1;
