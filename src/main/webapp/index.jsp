<!DOCTYPE html>
<html>
<head>
    <title>Server Monitoring Dashboard</title>
</head>
<body>
<h1>Server Monitoring Dashboard</h1>
<p>Status: <span id="status"></span></p>
<p>Uptime: <span id="uptime"></span></p>
<p>CPU Usage: <span id="cpuUsage"></span></p>
<p>Memory Usage: <span id="memoryUsage"></span></p>

<script>
    fetch('/monitor')
        .then(response => response.json())
        .then(data => {
            document.getElementById('status').innerText = data.status;
            document.getElementById('uptime').innerText = data.uptime;
            document.getElementById('cpuUsage').innerText = data.cpuUsage;
            document.getElementById('memoryUsage').innerText = data.memoryUsage;
        });
</script>
</body>
</html>
