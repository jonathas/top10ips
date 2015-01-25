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

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class FileHandler {
    
     public List<String> readFile(String fileName) throws IOException {
        String absolutePath = new File(fileName).getAbsolutePath();
        return Files.readAllLines(Paths.get(absolutePath), Charset.defaultCharset());
    }
    
    public LinkedHashMap parseLines(List<String> lines) {
            LinkedHashMap dic = new LinkedHashMap();

            for (String line : lines) {
                String[] lineParts = line.split(" ");
                String ipAddress = lineParts[0];

                if (dic.containsKey(ipAddress)) {
                    Integer val = (Integer) dic.get(ipAddress);
                    dic.put(ipAddress, val + 1);
                } else {
                    dic.put(ipAddress, 1);
                }
            }
            return dic;
    }

    public Map<String, Integer> sortByComparator(Map<String, Integer> unsortedMap) {
        // Convert Map to List
        List<Map.Entry<String, Integer>> list
                = new LinkedList<>(unsortedMap.entrySet());

        // Sort list with comparator, to compare the Map values
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1,
                    Map.Entry<String, Integer> o2) {
                return (o2.getValue()).compareTo(o1.getValue());
            }
        });

        // Convert sorted map back to a Map
        Map<String, Integer> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        return sortedMap;
    }
    
}
