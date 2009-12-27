use strict;
use warnings;
use HTML::EFT;
use Test::More tests => 1;

my $eft = HTML::EFT->new(
    'GoogleAdSection'
);
my $ret = $eft->extract('http://example.com/', q{ppp<!-- google_ad_section_start -->hoge<!-- google_ad_section_end --><!-- google_ad_section_start -->fuga<!-- google_ad_section_end -->qqq});
is $ret, "hoge\nfuga";
