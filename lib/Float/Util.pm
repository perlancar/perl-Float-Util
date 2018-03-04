package Float::Util;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Config;

use Exporter qw(import);
our @EXPORT_OK = qw(is_exact);

my $numsigfdigs = ($Config{usequadmath} ? 36 : 17)+1;
my $fmt = "%.${numsigfdigs}f";

sub is_exact {
    my $strdec = shift;

    $strdec =~ /\A-?[0-9]+(?:\.[0-9]+)?\z/
        or die "Invalid input '$strdec', please supply a decimal number string";

    my $fmtnum = sprintf $fmt, $strdec;
    for ($strdec, $fmtnum) { s/\.?0+\z// }
    #say "D: strdec=<$strdec>, fmtnum=<$fmtnum>";
    $strdec eq $fmtnum;
}

1;
# ABSTRACT: Utilities related to floating point numbers

=head1 SYNOPSIS

 use Float::Util qw(is_exact);

 is_exact("1.5"); # => true
 is_exact("0.1"); # => false


=head1 DESCRIPTION


=head1 FUNCTIONS

None exported by default, but they are exportable.

=head2 is_exact

Usage: is_exact($strdec) => bool

Test that a decimal number (a string) can be represented exactly as a floating
point number.


=head1 SEE ALSO

=cut
