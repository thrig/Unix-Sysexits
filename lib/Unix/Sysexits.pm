package Unix::Sysexits;

use 5.006000;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Unix::Sysexits ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
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
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

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

Unix::Sysexits - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Unix::Sysexits;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Unix::Sysexits, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.

=head2 Exportable constants

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

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

jmates, E<lt>jmates@ee.washington.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by jmates

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
