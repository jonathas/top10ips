--[[
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
]]--

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "r")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

-- explode(seperator, string)
function explode(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      l=string.find(p,d,ll,true) -- find the next d in the string
      if l~=nil then -- if "not not" found then..
        table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
        ll=l+1 -- save just after where we found it for searching next time.
      else
        table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
        break -- Break at end, as it should be, according to the lua manual.
      end
    end
  return t
end

function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function compare(a,b)
  return a[1] < b[1]
end

function parse_file()
  local ip_count = {}

  for k,v in pairs(lines) do
    local line_parts = explode(" ", v)
    local ip_address = line_parts[1]

    if ip_count[ip_address] == nil then
      ip_count[ip_address] = 1
    else
      ip_count[ip_address] = ip_count[ip_address] + 1
    end
  end

  return ip_count
end

local file = '../apache.log'
local lines = lines_from(file)
local ip_list = parse_file(lines)
local rank = 1

print("RANK\tIP\t\tCOUNT")

for k,v in spairs(ip_list, function(t,a,b) return t[b] < t[a] end) do
    print(rank, k,v)
    rank = rank + 1
    if rank > 10 then break end
end