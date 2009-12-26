package HTML::EFT::LDRFullFeed;
use strict;
use warnings;
use HTML::TreeBuilder::XPath;

sub new {
    my ($class, $data) = @_;
    unless ($data) {
        require LWP::UserAgent;
        require JSON;
        my $ua = LWP::UserAgent->new();
        my $res = $ua->get('http://wedata.net/databases/LDRFullFeed/items.json');
        if ($res) {
            $data = JSON::decode_json($res->decoded_content);
        } else {
            die $res->status_line;
        }
    }
    bless {data => $data}, $class;
}

sub extract {
    my ($self, $url, $html) = @_;

    for my $row (@{$self->{data}}) {
        if ( $url =~ /$row->{data}->{url}/ ) {
            my $tree = HTML::TreeBuilder::XPath->new();
            $tree->parse($html);
            $tree->eof;
            my @contents = $tree->findnodes( $row->{data}->{xpath} );
            if (@contents) {
                my $res = join "\n",
                    map { $_->as_XML(q{<>&"'}) } @contents;
                $tree = $tree->delete;
                return $res;
            }
            else {
                $tree = $tree->delete;
                next;
            }
        }
    }
    return;
}

1;
__END__

=head1 NAME

HTML::EFT::LDRFullFeed - make html as full content by LDRFullFeed metadata

=head1 SYNOPSIS

    my $ldrfullfeed = HTML::EFT::LDRFullFeed->new();
    $ldrfullfeed->extract($url, $html);

=head1 DESCRIPTION

=head1 LICENSE

same as perl itself
