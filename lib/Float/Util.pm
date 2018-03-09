package Float::Util;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Config;

use Exporter qw(import);
our @EXPORT_OK = qw(is_exact);

my $numsigfdigs = (
    $Config{nvsize} == 16 ? 36 :
        $Config{nvsize} == 8 ? 17 :
        die "Can't handle nvsize=$Config{nvsize}")+1;
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

L<https://en.wikipedia.org/wiki/Double-precision_floating-point_format>

L<https://en.wikipedia.org/wiki/Quadruple-precision_floating-point_format>

L<https://stackoverflow.com/questions/21146203/checking-if-floating-point-number-is-completely-convertibal-to-binary>

=cut
