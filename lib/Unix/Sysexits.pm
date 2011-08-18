package Unix::Sysexits;

use 5.006000;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

our @EXPORT = qw(
	EX_CANTCREAT
	EX_CONFIG
	EX_DATAERR
	EX_IOERR
	EX_NOHOST
	EX_NOINPUT
	EX_NOPERM
	EX_NOUSER
	EX_OK
	EX_OSERR
	EX_OSFILE
	EX_PROTOCOL
	EX_SOFTWARE
	EX_TEMPFAIL
	EX_UNAVAILABLE
	EX_USAGE
	EX__BASE
	EX__MAX
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Unix::Sysexits::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Unix::Sysexits', $VERSION);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Unix::Sysexits - Perl extension for sysexits.h

=head1 SYNOPSIS

See sysexits(3) for details on the constants.

  use Unix::Sysexits;
  exit EX_USAGE;

or

  use Unix::Sysexits ();
  exit Unix::Sysexits::EX_USAGE;

=head1 DESCRIPTION

No really, just a thin wrapper around sysexits(3) for those constants,
presumably for exit codes.

=head2 EXPORT

  EX_CANTCREAT
  EX_CONFIG
  EX_DATAERR
  EX_IOERR
  EX_NOHOST
  EX_NOINPUT
  EX_NOPERM
  EX_NOUSER
  EX_OK
  EX_OSERR
  EX_OSFILE
  EX_PROTOCOL
  EX_SOFTWARE
  EX_TEMPFAIL
  EX_UNAVAILABLE
  EX_USAGE
  EX__BASE
  EX__MAX

=head1 SEE ALSO

sysexits(3)

=head1 AUTHOR

jmates, E<lt>jmates@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by jmates

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
