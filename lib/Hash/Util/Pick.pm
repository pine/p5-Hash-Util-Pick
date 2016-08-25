package Hash::Util::Pick;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use Exporter qw/import/;
our @EXPORT_OK = qw/pick pick_by/;

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=encoding utf-8

=head1 NAME

Hash::Util::Pick - It's new $module

=head1 SYNOPSIS

    use Hash::Util::Pick;

=head1 DESCRIPTION

Hash::Util::Pick is ...

=head1 LICENSE

Copyright (C) Pine Mizune.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Pine Mizune E<lt>pinemz@gmail.comE<gt>

=cut

