#!/usr/bin/perl

# fedora packages:
#    * perl
#    * perl-LWP-Protocol-https
#    * perl-JSON

use strict;
use warnings;

our $VERSION = 0.1;

use LWP::Simple;
use JSON qw(decode_json);

sub save_file
{
	my ($file, $contents) = @_;

	my $FH;
	if (!open $FH, '>', $file) {
		die "Can't create file: '$file'\n";
	}

	if (!print {$FH} $contents) {
		printf "Write failed for: %s\n", $file;
	}

	if (!close $FH) {
		printf "Close failed for: %s\n", $file;
	}

	return;
}

sub generate_svg
{
	my ($name, $fg, $bg) = @_;
	my $output = '';

	$output .= "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"160\" height=\"18\">\n";
  $output .= "  <g fill=\"#$fg\" font-family=\"sans-serif\" font-size=\"11\">\n";
  $output .= "    <rect width=\"160\" height=\"18\" rx=\"4\" fill=\"#$bg\">\n";
  $output .= "      <title>XXX</title>\n";
  $output .= "    </rect>\n";
	$output .= "    <text x=\"10\" y=\"13\">$name</text>\n";
	$output .= "  </g>\n";
	$output .= "</svg>\n";

	return $output;
}

sub get_page_of_labels
{
	my ($slug, $page) = @_;

	my $api = "https://api.github.com/repos/$slug/labels?page=$page";

	my $json = get ($api);

	my $decoded_json = decode_json ($json);

	foreach (@{$decoded_json}) {
		my $label = $_;

		my $name = $label->{'name'};
		my $url  = $label->{'url'};
		my $bg   = $label->{'color'};

		my $file = $name . '.svg';
		$file =~ s/[\s:]/-/msxg;

    my $search = $name;
    $search =~ s/:/%3A/msxg;
    $search =~ s/\s/%20/msxg;

		my $bg_red = hex(substr $bg, 0, 2);
		my $bg_grn = hex(substr $bg, 2, 2);
		my $bg_blu = hex(substr $bg, 4, 2);

		my $fg;
		if (($bg_red + $bg_grn + $bg_blu) > 384) {
			$fg = "000000";
		} else {
			$fg = "ffffff";
		}

		my $fg_red = hex(substr $fg, 0, 2);
		my $fg_grn = hex(substr $fg, 2, 2);
		my $fg_blu = hex(substr $fg, 4, 2);

		my $svg = generate_svg ($name, $fg, $bg);

		save_file ($file, $svg);

		printf "\033[38;2;$fg_red;$fg_grn;${fg_blu}m\033[48;2;$bg_red;$bg_grn;${bg_blu}m  %-30s\033[m %-30s https://github.com/%s/labels/%s\n", $name, $file, $slug, $search;
		# printf "  \033[38;2;$fg_red;$fg_grn;${fg_blu}m\033[48;2;$bg_red;$bg_grn;${bg_blu}m%s\033[m\n", $name;
	}
}

sub main
{
	my ($slug) = @_;

	if (!defined $slug) {
		$slug = "neomutt/neomutt";
	}

	printf "%s\n", $slug;

  get_page_of_labels ($slug, 1);
  get_page_of_labels ($slug, 2);
}


main ($ARGV[0]);

