package JSON::JOM::Plugins::YAML;

use JSON qw[from_json];
use JSON::JOM::Plugins::Dumper;
use YAML::Any;

our $VERSION   = '0.001';

sub extensions
{
	my ($class) = @_;
	# Round-trips via a JSON string. This is because YAML modules don't
	# support an equivalent of the TO_JSON magic method.
	return (
		['ARRAY', 'to_yaml', sub { return Dump(from_json($_[0]->dump)) }],
		['HASH',  'to_yaml', sub { return Dump(from_json($_[0]->dump)) }],
		);
}

1;

__END__

=head1 NAME

JSON::JOM::Plugins::YAML - YAML dump for JOM nodes

=head1 DESCRIPTION

This JOM plugin adds the following method to JOM objects and arrays:

=over 4

=item * C<to_yaml> - dumps the object as a YAML string.

=back

=head1 BUGS

Please report any bugs to L<http://rt.cpan.org/>.

=head1 SEE ALSO

L<JSON::JOM>, L<JSON::JOM::Plugins>, L<YAML::Any>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT

Copyright 2010 Toby Inkster

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

