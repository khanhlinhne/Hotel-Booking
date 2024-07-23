<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
    .sidebar {
  height: 100%;
  width: 250px;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #202123;
  padding-top: 20px;
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar ul li {
  padding: 10px;
  text-align: center;
}

.sidebar ul li a {
  text-decoration: none;
  color: white;
  display: block;
}


/* Main content styles */
.content {
  margin-left: 250px;
  padding: 20px;
}

h1 {
  font-size: 28px;
  color: #333;
}

/* Chart styles (customize as needed) */
.chart {
  width: 80%;
  margin: 20px auto;
  background-color: #ecf0f1;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3{
    text-align: center;
    font-size: 30px;
    color: white
}

ul {
  list-style: none; /* Remove default bullet points */
  margin: 0;
  padding: 0;
  display: flex; /* Arrange list items horizontally */
  flex-wrap: wrap; /* Wrap to the next line when needed */
}

/* Style the list items */
li {
  margin: 10px; /* Add spacing between list items */
  padding: 10px; /* Add padding within list items */
  border: 1px solid #e0e0e0; /* Add a border around list items */
  border-radius: 5px; /* Round the corners of list items */
  color: #333; /* Set the text color */
  font-size: 16px;
  text-align: center; /* Center-align text */
  min-width: 200px; /* Set a minimum width for list items */
  transition: background-color 0.3s; /* Add a smooth background color transition */
}

/* Style when hovering over list items */
li:hover {
  background-color: #e0e0e0; /* Change the background color on hover */
  cursor: pointer; /* Change the cursor to a pointer on hover */
}
</style>
<body>
  <div class="sidebar">
      <h3>Admin</h3>
    <ul>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="accountmanagement">Account</a></li>
                <li><a href="billmanagement">Bill</a></li>
                                   
                <li><a href="hotelmanagement">Hotel</a></li>
    </ul>
  </div>

  <div class="content">
    <h1>Dashboard</h1>
    <div class="chart">
      <canvas id="myChart"></canvas>
    </div>
  </div>

    <script>
        
        
        var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [{
      label: 'Sales',
      data: [12, 19, 3, 5, 2, 3],
      backgroundColor: 'rgba(75, 192, 192, 0.2)',
      borderColor: 'rgba(75, 192, 192, 1)',
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
    </script>
</body>
</html>