#!perl6
use Test;
plan 2;

use lib 'lib';
use-ok 'URL::Find';
use URL::Find;
my $test-string =
Q{http://www.com/commaæ,
https://www.google.com/search?q=perl+6&oq=perl+6&aqs=chrome.0.69i59l3j69i60l3.742j0j1&sourceid=chrome&ie=UTF-8&,%
http://правительство.рф
ooooooooooooooo
http://실례.테스트/ель
http://παράδειγμα.δοκιμή/&};
my @correct =
'http://www.com/commaæ',
'https://www.google.com/search?q=perl+6&oq=perl+6&aqs=chrome.0.69i59l3j69i60l3.742j0j1&sourceid=chrome&ie=UTF-8',
'http://правительство.рф',
'http://실례.테스트/ель',
'http://παράδειγμα.δοκιμή/';

is find-urls($test-string), @correct, "Test finding URL's";
done-testing;
