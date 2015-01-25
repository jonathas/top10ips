#!/usr/bin/env perl
#
# Copyright 2015 Jonathas Rodrigues
# 
# This file is part of Top10IPs.
# Top10IPs is free software: you can redistribute it and/or modify it under the terms of the 
# GNU General Public License as published by the Free Software Foundation, either version 3 of 
# the License, or (at your option) any later version.
# Top10IPs is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with Top10IPs. 
# If not, see http://www.gnu.org/licenses/.

use strict;
use warnings;
 
my %ip_count;

my $filename = '../apache.log';
open(my $fh, '<:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";
 
while (my $line = <$fh>) {
	my @line_parts = split(' ', $line);
	my $ip_address = $line_parts[0];

	if(exists $ip_count{$ip_address}) {
		$ip_count{$ip_address} += 1;
	} else {
		$ip_count{$ip_address} = 1;
	}
	
}

print "RANK\tIP\t\tCOUNT\n";

my $rank = 1;

foreach my $key (sort { $ip_count{$b} <=> $ip_count{$a} } keys %ip_count) {
	printf "%s\t%s\t%s\n", $rank, $key, $ip_count{$key};
	$rank++;
	last if $rank > 10;
}
