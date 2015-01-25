#!/usr/bin/env python
# -*- encoding: utf-8 -*-
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

from operator import itemgetter 

def read_parse(filepath):
	ip_count = {}

	with open(filepath, "r") as file:
		for line in file:
			ip_address = line.split(" ")[0]

			if ip_address in ip_count:
				ip_count[ip_address] += 1
			else:
				ip_count[ip_address] = 1

	return ip_count


ip_list = read_parse("../apache.log")

#The header
print("RANK\tIP\t\tCOUNT")

# Using enumerate() so we can have the iteration's index (rank variable), starting at 1
# Sorting the items of the ip_list by their value in reverse order, but limiting the loop from 0 to 10
# Ps: Python is beautiful =)
for rank, line in enumerate(sorted(ip_list.items(), key=itemgetter(1), reverse=True)[0:10], start = 1):
	print("{}\t{}\t{}\t".format(rank,line[0],line[1]))
