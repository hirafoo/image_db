package ImageDB::Schema;
use base 'DBIx::Class::Schema::Loader';
use ImageDB::Utils;
$ENV{DBIC_TRACE} = 1;

package DBIx::Class::ResultSet;
use ImageDB::Utils;

1;
