use v6;
my token protocol   { [http|https|ftp|git|ssh]                      }
my token baseascii  { [ <[a..z A..Z 0..9 \- . ]> ]+                 }
my token base       { [ <:Number + :Letter + [ . - ]> ]+            }
my token protected  { <[ $ + ! * ( ) , . ; ? @ = % & # ]>           }
my token allowed    { \S                                            }
my regex term       { <allowed>+ <!after <protected>>               }
my token after      { '/' <term>                                    }
my regex url        { <protocol> '://' <base> [<after>+]? '/'?      }
my regex urlascii   { <protocol> '://' <baseascii> [<after>+]? '/'? }
#| Accepts a string and returns a list of URL's. Optionally you can specify a limit to the number
#| of URL's returned, or whether you want to only match URL's with ASCII domain names
sub find-urls ( Str $string, Num :$limit? is copy, :$ascii?) is export returns List  {
    $limit = ∞ if ! $limit.defined;
    if $ascii {
        return $string.comb(/<urlascii>/, $limit);
    }
    else {
        return $string.comb(/<url>/, $limit);
    }
}
