<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h3>Hotel ID ${requestScope.hotelid}</h3>
        <h2>Add Room</h2>
        <form action="addroom" method="POST">
            <div class="form-group">
                <label for="name">Room Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" class="form-control" id="image" name="image" required>
            </div>
            <div class="form-group">
                <label for="userquantity">User Quantity:</label>
                <input type="text" class="form-control" id="userquantity" name="numOfPeople" required>
            </div>
            <div class="form-group">
                <label for="area">Area:</label>
                <input type="text" class="form-control" id="area" name="area" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.1" class="form-control" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="isActive">Is Active:</label>
                <select class="form-control" id="isActive" name="isActive" required>
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="feedback">Hotel Id</label>
                <input class="form-control" id="hotelid" value="${requestScope.hotelid}" readonly="" name="hotelid" rows="4" required>
            </div>
            <div class="form-group">
                <label for="type">Type Id</label>
                <input class="form-control" id="typeid"   name="typeid" rows="4" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Hotel</button>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>