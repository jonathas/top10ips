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

def read_parse(filepath) {
	def thefile = new File(filepath)
	def ipCount = [:]

	thefile.eachLine {
	    def ipAddress = it.split(' ')[0]

	    if(ipCount[ipAddress] == null) {
	    	ipCount[ipAddress] = 1
		} else {
			ipCount[ipAddress]++
		}
	    
	}

	return ipCount.sort { -it.value }
}

def ipList = read_parse("../apache.log")

def rank = 1

print "RANK\tIP\t\tCOUNT\n"

for (ip in ipList) {
    print rank + "\t" + ip.key + "\t" + ip.value + "\n"
    rank++
    if(rank > 10) break
}

