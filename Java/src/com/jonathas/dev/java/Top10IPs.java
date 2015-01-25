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

package com.jonathas.dev.java;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Top10IPs {

    public static void main(String[] args) {
        
        try {
            
            FileHandler fileHandler = new FileHandler();
            
            List<String> lines = fileHandler.readFile("apache.log");
            LinkedHashMap dic = fileHandler.parseLines(lines);
            Map<String, Integer> sortedMap = fileHandler.sortByComparator(dic);
            
            System.out.println("RANK\tIP\t\tCOUNT");

            Integer rank = 1;
            for (Map.Entry<String, Integer> entry : sortedMap.entrySet()) {
                System.out.println(rank + "\t" + entry.getKey() + "\t" + entry.getValue());
                rank++;
                if(rank > 10) break;
            }

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

    }

}
