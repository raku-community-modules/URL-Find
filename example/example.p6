use lib 'lib';
use URL::Find;
sub MAIN ( Str $string ) {
    say find-urls($string);
}
