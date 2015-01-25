#!/usr/bin/env ruby
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

def read_parse(filepath)
	ip_count = {}

	File.open(filepath, "r") do |f|
	  f.each_line do |line|
	    
	    ip_address = line.split(" ")[0]

	    if ip_count.has_key?(ip_address)
	    	ip_count[ip_address] += 1
	    else
	    	ip_count[ip_address] = 1
	    end
	    
	  end

	 end

	return Hash[ip_count.sort_by{|k, v| v}.reverse]
end

ip_list = read_parse("../apache.log")

puts "RANK\tIP\t\tCOUNT"

ip_list.take(10).each_with_index do |ip, index|
	puts "#{index+1}\t#{ip[0]}\t#{ip[1]}"
end
