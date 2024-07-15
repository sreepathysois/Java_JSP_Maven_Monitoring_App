<!DOCTYPE html>
<html>
<head>
    <title>Server Monitoring Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<h1>Server Monitoring Dashboard</h1>
<p>Status: <span id="status"></span></p>
<p>Uptime: <span id="uptime"></span></p>
<p>CPU Usage: <span id="cpuUsage"></span></p>
<p>Memory Usage: <span id="memoryUsage"></span></p>

<canvas id="cpuChart" width="400" height="200"></canvas>
<canvas id="memoryChart" width="400" height="200"></canvas>

<script>
    fetch('/monitor')
        .then(response => response.json())
        .then(data => {
            document.getElementById('status').innerText = data.status;
            document.getElementById('uptime').innerText = data.uptime;
            document.getElementById('cpuUsage').innerText = data.cpuUsage;
            document.getElementById('memoryUsage').innerText = data.memoryUsage;

            // Data for the charts
            const cpuData = {
                labels: ['Used', 'Free'],
                datasets: [{
                    label: 'CPU Usage',
                    data: [15, 85], // Replace with actual data
                    backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                    borderWidth: 1
                }]
            };

            const memoryData = {
                labels: ['Used', 'Free'],
                datasets: [{
                    label: 'Memory Usage',
                    data: [60, 40], // Replace with actual data
                    backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'],
                    borderColor: ['rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'],
                    borderWidth: 1
                }]
            };

            // CPU Usage Chart
            const ctxCpu = document.getElementById('cpuChart').getContext('2d');
            new Chart(ctxCpu, {
                type: 'pie',
                data: cpuData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'CPU Usage'
                        }
                    }
                }
            });

            // Memory Usage Chart
            const ctxMemory = document.getElementById('memoryChart').getContext('2d');
            new Chart(ctxMemory, {
                type: 'bar',
                data: memoryData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Memory Usage'
                        }
                    }
                }
            });
        });
</script>
</body>
</html>
