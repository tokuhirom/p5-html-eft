package HTML::EFT::GoogleAdSection;
use strict;
use warnings;

sub new { bless {}, shift }

sub extract {
    my ($self, $url, $html) = @_;
    if ($html =~ m{<!--\s+google_ad_section_start\s+-->(.+)<!--\s+google_ad_section_end\s+-->}) {
        return $1;
    } else {
        return; # not matched!
    }
}

1;
