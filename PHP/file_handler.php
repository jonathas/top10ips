<?php
/*
* Copyright 2015 Jonathas Rodrigues
* 
* This file is part of Top10IPs.
* Top10IPs is free software: you can redistribute it and/or modify it under the terms of the 
* GNU General Public License as published by the Free Software Foundation, either version 3 of 
* the License, or (at your option) any later version.
* Top10IPs is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
* without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
* See the GNU General Public License for more details.
* You should have received a copy of the GNU General Public License along with Top10IPs. 
* If not, see http://www.gnu.org/licenses/.
*/

function read_parse($filename) {
	$fh = fopen($filename, "r");
	$ip_count = array();

	while($line = fgets($fh)) {
		$ip_address = explode(" ",$line)[0];
		
		if(!array_key_exists($ip_address, $ip_count)) {
			$ip_count[$ip_address] = 1;
		} else {
			$ip_count[$ip_address]++;
		}
	}

	return $ip_count;
}

$ip_list = read_parse("../apache.log");

//Sort array by value in descending order
arsort($ip_list);

$ip_list = array_slice($ip_list, 0, 10);

$rank = 1;
?>