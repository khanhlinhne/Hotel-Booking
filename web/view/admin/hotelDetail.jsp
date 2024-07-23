<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Hotel Detail</h2>
        <form action="edithotel" method="POST">
            
            <input type="text" class="form-control" value="${requestScope.hotel.id}" id="id" name="id" hidden="">
            
            <div class="form-group">
                <label for="name">Hotel Name:</label>
                <input type="text" class="form-control" value="${requestScope.hotel.name}" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" class="form-control" value="${requestScope.hotel.image}" id="image" name="image" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" value="${requestScope.hotel.address}" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" class="form-control" value="${requestScope.hotel.phone}" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <input type="number" step="0.1" class="form-control" value="${requestScope.hotel.rating}" id="rating" name="rating" required>
            </div>
            <div class="form-group">
                <label for="isActive">Is Active:</label>
                <select class="form-control" id="isActive" name="isActive" required>
                    <option ${requestScope.hotel.isActive == true? 'selected': ''  } value="1">Yes</option>
                    <option ${requestScope.hotel.isActive == false? 'selected': ''  } value="0">No</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control"  id="description" name="description" rows="4" required>${requestScope.hotel.description}</textarea>
            </div>
            <div class="form-group">
                <label for="feedback">Feedback:</label>
                <textarea class="form-control"  id="feedback" name="feedback" rows="4" required>${requestScope.hotel.feedback}</textarea>
            </div>
                <a href="roommanagement?hotelid=${requestScope.hotel.id}" class="btn btn-primary">Show Rooms</a>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>