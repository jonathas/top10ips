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

function read_file(thefile) {
    var rawFile = new XMLHttpRequest();
    var content = "";
    rawFile.open("GET", thefile, false);
    rawFile.onreadystatechange = function () {
        if(rawFile.readyState === 4) {
            if(rawFile.status === 200 || rawFile.status == 0) {
                content = rawFile.responseText;
            }
        }
    }
    rawFile.send(null);
    return content;
}

function parse_lines(lines) {
    var ip_list = new Array();

    for(var i=0; i<lines.length; i++) {
        var ip_address = lines[i].split(" ")[0];
        
        if(ip_list.length == 0) {
            ip_list.push({key: ip_address, val: 1});
        } else {
            var already_here = false;
            for(var j=0; j<ip_list.length;j++) {
                if(ip_list[j].key == ip_address) {
                    ip_list[j].val += 1;
                    already_here = true;
                    break;
                }
            }
            if(already_here == false) {
                ip_list.push({key: ip_address, val: 1});
            }
        }

    }

    return ip_list;
}

function sort(list, order) {
    order = typeof order !== 'undefined' ? order : "desc";
    if(order == "desc") {
        return list.sort(function(a,b) {
            return b.val - a.val;
        });
    } else {
        return list.sort(function(a,b) {
            return a.val - b.val;
        });
    }
}

function draw_table(ip_list) {
    var the_output = document.getElementById("output");
    var content = "<tr><th>RANK</th><th>IP</th><th>COUNT</th></tr>";

    for(var i=0; i<10;i++) {
        var rank = i+1;
        content += "<tr><td>" + rank + "</td>";
        content += "<td>" + ip_list[i].key + "</td>";
        content += "<td>" + ip_list[i].val + "</td></tr>";
    }

    the_output.innerHTML = content;
}