# Top10IPs

<p>This software enables you to read an Apache log file, showing you it's TOP 10 most repeated IP addresses.</p>

<p>I've had this idea after being on an interview for a Software Engineer position at Google. 
The interviewer gave me a format example:</p>

<p>1233454356\tGET /index.html\t10.10.10.1\n.<br>
123345343\tGET /index.html\t10.10.10.1\n.<br>
123345435\tGET /index.html\t10.10.12.1\n.</p>

<p>And asked me to write an algorithm on Google Docs shared with him (while he would give me a very short time and be watching me real time on Hangouts) to read that file and output it's top 10 ip addresses in the following format:</p>

<table>
<tr><th>RANK</th><th>IP</th><th>COUNT</th></tr>
<tr><td>1</td><td>10.10.10.1</td><td>2</td></tr>
<tr><td>2</td><td>10.10.12.1</td><td>1</td></tr>
</table>

<p>Though that would have been easy to develop, things didn't go as expected at the time for me, as I wasn't able to think normally the way I usually do.</p>
<p>I told them I strongly disagree with that interview format, and they'd be missing some good people with that, as I've also heard that many people who have been through that have experienced the same as me.</p>

<p>Then, as they thought I wasn't able to develop that, I decided to develop the code for that in 10 different languages and reading from a real log file I got from a random day.</p>

