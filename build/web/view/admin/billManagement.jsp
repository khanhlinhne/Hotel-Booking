<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        h1{
            font-weight: bold;
            text-align: center;
            font-size: 42px;
            margin-top: 3em;
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
        
        .table {
            margin-top: 10em; /* Adjust the value to control the amount of space below the table */
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
            <h1>Bill Management</h1>
            <div class="container">


                <table class="table table-hover table-bordered ">
                    <thead>
                        <tr>
                            <th>Discount</th>
                            <th>Payment Date</th>
                            <th>Payment Mode</th>
                            <th>Total</th>
                            <th>Booking</th>
                        </tr>
                    </thead>
                    <tbody>
                          <c:forEach items="${requestScope.bills}" var="b">
                        <tr>
                            <td>${b.discount}</td>
                            <td>${b.paymentDate}</td>
                            <td>${b.paymentMode}</td>
                            <td>${b.total}</td>
                            <td>${b.bookingId}</td>
                            
                        </tr>
                        
                    </c:forEach>
                    
                        
                    </tbody>
                </table>
            </div>
        </div>

       
    </body>
</html>