package App::ZofCMS::Plugin::AutoEmptyQueryDelete;

use warnings;
use strict;

our $VERSION = '1.001001';

sub new { bless {}, shift }

sub process {
    my ( $self, $t, $q ) = @_;

    my @delete;
    for ( keys %$q ) {
        push @delete, $_
            unless defined $q->{$_}
                and $q->{$_} =~ /\S/;
    }

    delete @$q{ @delete };
}

1;
__END__

=encoding utf8

=head1 NAME

App::ZofCMS::Plugin::AutoEmptyQueryDelete - automatically delete empty keys from query parameters

=head1 SYNOPSIS

    plugins => [
        { AutoEmptyQueryDelete => 100 },
        # plugins that work on query parameters with larger priority value
    ],

=head1 DESCRIPTION

The module is a plugin for L<App::ZofCMS> that I made after I got sick and tired of
constantly writing this (where C<$q> is query parameters hashref):

    do_something
        if defined $q->{foo}
            and $q->{foo} =~ /\S/;

By simply including this module in the list of plugins to run, I can save a few keystrokes
by writing:

    do_something
        if exists $q->{foo};

This documentation assumes you've read L<App::ZofCMS>, L<App::ZofCMS::Config> and L<App::ZofCMS::Template>

=head1 WHAT DOES THE PLUGIN DO

The plugin doesn't do much, but simply C<delete()>s query parameters that don't contain non-whitespace characters. With that being done, we can use a simple C<exists()> on a key.

=head1 USING THE PLUGIN

Plugin does not need any configuration. It will be run as long as it is included
in the list of the plugins to run:

    plugins => [
        { AutoEmptyQueryDelete => 100 },
        # plugins that work on query parameters with larger priority value
    ],

Make sure that the priority of the plugin is set to run B<before> your other code
that would check on query with C<exists()>

=head1 AUTHOR

'Zoffix, C<< <'zoffix at cpan.org'> >>
(L<http://haslayout.net/>, L<http://zoffix.com/>, L<http://zofdesign.com/>)

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-zofcms-plugin-autoemptyquerydelete at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-ZofCMS-Plugin-AutoEmptyQueryDelete>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::ZofCMS::Plugin::AutoEmptyQueryDelete

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-ZofCMS-Plugin-AutoEmptyQueryDelete>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-ZofCMS-Plugin-AutoEmptyQueryDelete>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-ZofCMS-Plugin-AutoEmptyQueryDelete>

=item * Search CPAN

L<http://search.cpan.org/dist/App-ZofCMS-Plugin-AutoEmptyQueryDelete/>

=back



=head1 COPYRIGHT & LICENSE

Copyright 2009 'Zoffix, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

