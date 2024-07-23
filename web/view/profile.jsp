<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .profile-form {
            max-width: 1500px;
            margin: 0 auto;
        }
        .profile-image {
            margin: 0;
            margin-top: 100px;  
            margin-right: 300px;
            max-width: 250px;
            height: 250px;
            border-radius: 50%;
            text-align: center;
            
        }
        .imageProfile{
            text-align: center;
        }
    </style>
    <title>User Profile Form</title>
</head>
<body>
    <div class="container mt-4">
        <form action="editprofile" method="post" class="profile-form">
            <h2>User Profile</h2>
            <div class="row">
                <div class=" col-md-4 imageProfile " >
                    <!-- Left column for the profile image -->
                    <img  src="https://i.ytimg.com/vi/G9txKhN11BM/maxresdefault.jpg" alt="Profile Image" class="profile-image">
                </div>
                
               
                <div class="col-md-8">
                    <!-- Right column for the form -->
                    
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" id="name" value="${sessionScope.user.name}" placeholder="Enter your name">
                    </div>
                   
                    
                    <div class="form-group">
                        <label >DOB</label>
                        <input type="text" class="form-control" name="dob" id="dob" value="${sessionScope.user.dob}" placeholder="Enter your dob">
                    </div>
                    
                    
                    <div class="form-group">
                        <label >Gender</label>
                        <input type="text" class="form-control" id="gender" name="gender"  value="${sessionScope.user.gender == true ? 'male': 'female'}" placeholder="Enter your Gender">
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.acc.email}" placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" class="form-control" id="location" name="address" value="${sessionScope.user.address}" placeholder="Enter your location">
                    </div>
                    <div class="form-group">
                        <label for="bio">About Me</label>
                        <textarea class="form-control" id="bio" rows="4" name="" placeholder="Tell us about yourself"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Edit</button>
                    <a href="homepage" class="btn btn-primary">Home</a>
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>