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

using System;
using System.Collections.Generic;
using System.Linq;
using System.IO.File;

namespace Top10IPs {
	class MainClass {
		public static void Main (string[] args) {
			try {

				Dictionary<string, int> dic = new Dictionary<string, int>();

				string[] lines = ReadAllLines(@"apache.log");
				char[] delimiterChars = { ' ' };

				foreach (string line in lines) {
					string[] lineParts = line.Split(delimiterChars);
					string ipAddress = lineParts[0];

					if(dic.ContainsKey(ipAddress)){
						dic[ipAddress]++;
					} else {
						dic.Add(ipAddress, 1);
					}

				}

				Console.WriteLine("RANK\tIP\t\tCOUNT");

				int i = 1;
				foreach (KeyValuePair<string,int> item in dic.OrderByDescending(key=> key.Value)) {
					Console.WriteLine(i + "\t" + item.Key + "\t" + item.Value);
					i++;
					if(i > 10) break;
				}
			
			} catch (Exception ex) {
				Console.WriteLine (ex.Message);
			}
		}
	}
}
