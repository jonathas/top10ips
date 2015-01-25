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

#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

typedef std::pair<std::string, int> mypair;
struct IntCmp {
	bool operator()(const mypair &lhs, const mypair &rhs) {
		return lhs.second > rhs.second;
	}
};

void print_top10(const std::map<std::string,int> &mymap) {
    std::vector<mypair> myvec(mymap.begin(), mymap.end());
    //assert(myvec.size() >= 10);
    std::partial_sort(myvec.begin(), myvec.begin() + 10, myvec.end(), IntCmp());

    for (int i = 0; i < 10; ++i) {
        std::cout << i+1 << '\t' << myvec[i].first  << '\t' << myvec[i].second << '\n';
    }
}

int main (int argc, char* argv[]) {
	if(argc < 2) {
		cout << "Please inform, as a parameter, the log file you want to parse\n";
		return 0;
	}

	ifstream myfile (argv[1]);

	if (myfile.is_open()) {
		std::map<std::string,int> ip_count;
    	std::string line;
    	std::string delimiter = " ";

		while (getline (myfile,line)) {
		  std::string ip_address = line.substr(0, line.find(delimiter));

		  bool exists = ip_count.find(ip_address)!=ip_count.end();

		  if(exists == true) {
		  	ip_count[ip_address]++;
		  } else {
		  	ip_count[ip_address] = 1;
		  }
	      
	    }
	    myfile.close();

		cout << "RANK\tIP\t\tCOUNT\n";

		print_top10(ip_count);

	} else 
		cout << "Unable to open file\n"; 

	return 0;
}
