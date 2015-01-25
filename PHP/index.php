<?php require_once('file_handler.php'); ?>
<html>
	<head>
		<title>Parsing Apache's log file</title>
	</head>
	<body>

		<table>
			<tr>
				<th>RANK</th><th>IP</th><th>COUNT</th>
			</tr>
			<?php foreach($ip_list as $key => $value): ?>
				<tr>
					<td><?=$rank?></td><td><?=$key?></td><td><?=$value?></td>
				</tr>
			<?php $rank++; ?>
			<?php endforeach; ?>
		</table>

	</body>
</html>
