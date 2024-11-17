use URL::Find;

sub MAIN ( Str $string ) {
    say $string;
    say find-urls($string);
}

# vim: expandtab shiftwidth=4
