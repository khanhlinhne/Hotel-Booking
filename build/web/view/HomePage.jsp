<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Montana</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="manifest" href="site.webmanifest"> -->
        <link rel="shortcut icon" type="/HotelBooking/image/x-icon" href="/HotelBooking/img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="/HotelBooking/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="/HotelBooking/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/HotelBooking/css/magnific-popup.css">
        <link rel="stylesheet" href="/HotelBooking/css/font-awesome.min.css">
        <link rel="stylesheet" href="/HotelBooking/css/themify-icons.css">
        <link rel="stylesheet" href="/HotelBooking/css/nice-select.css">
        <link rel="stylesheet" href="/HotelBooking/css/flaticon.css">
        <link rel="stylesheet" href="/HotelBooking/css/gijgo.css">
        <link rel="stylesheet" href="/HotelBooking/css/animate.css">
        <link rel="stylesheet" href="/HotelBooking/css/slicknav.css">
        <link rel="stylesheet" href="/HotelBooking/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    </head>

    <style>
        .custom-button {
            width: 130px;
            background-color: white; /* Background color */
            color: #FFFFFF; /* Text color */
            padding: 10px 20px; /* Padding for the button */
            border: none;
            border-radius: 5px; /* Rounded corners */
            text-decoration: none; /* Remove underline from the link */
            font-weight: bold; /* Bold text */
        }

        .custom-button:hover {
            background-color:whitesmoke ; /* Change background color on hover */
        }

        .profile {
            position: relative;
            display: inline-block;
        }

        #profile-button {

            color: black;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        #profile-dropdown {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        #profile-dropdown a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Change color on hover */
        #profile-dropdown a:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>

    <body>
        <!--[if lte IE 9]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
            <![endif]-->

        <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid p-0">
                        <div class="row align-items-center no-gutters">
                            <div class="col-xl-5 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                                                           </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo-img">
                                    <a href="homepage">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 d-none d-lg-block">
                                <div class="book_room">
                                    <div class="socail_links">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-facebook-square"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="book_btn d-none d-lg-block">
                                        <a href="RoomList">Book A Room</a>
                                    </div>
                                </div>


                            </div>


                            <div  class="col-xl-2 col-lg-4 d-none d-lg-block">

                                <div class="authen ml-5 ">

                                    <div style="margin-left: 110px" class="book_btn d-none d-lg-block custom-button ">

                                        <c:choose>
                                            <c:when test="${not empty sessionScope.user}">


                                                <div class="profile">
                                                    <a id="profile-button">Hi ${sessionScope.user.name}</a>
                                                    <div class="dropdown-content" id="profile-dropdown">
                                                        <a href="profile">My Profile</a>
                                                        <a href="bookinghistory">Booking History</a>
                                                        <c:if test="${not empty sessionScope.acc and sessionScope.acc.role eq 'admin'}">
                                                            <a href="dashboard">Admin</a>
                                                        </c:if>
                                                        <a href="logout">Logout</a>
                                                    </div>
                                                </div>
                                            </c:when>

                                            <c:otherwise>

                                                <a href="login">
                                                    <i class="fa fa-user"></i> Login
                                                </a>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>

                            </div>





                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->

        <!-- slider_area_start -->
        <div class="slider_area">
            <div class="slider_active owl-carousel">
                <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Montana Resort</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Life is Beautiful</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Montana Resort</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Life is Beautiful</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider_area_end -->

        <!-- about_area_start -->
        <div class="about_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-5">
                        <div class="about_info">
                            <div class="section_title mb-20px">
                                <span>About Us</span>
                                <h3>A Luxuries Hotel <br>
                                    with Nature</h3>
                            </div>
                            <p>Suscipit libero pretium nullam potenti. Interdum, blandit phasellus consectetuer dolor ornare
                                dapibus enim ut tincidunt rhoncus tellus sollicitudin pede nam maecenas, dolor sem. Neque
                                sollicitudin enim. Dapibus lorem feugiat facilisi faucibus et. Rhoncus.</p>
                            <a href="#" class="line-button">Learn More</a>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7">
                        <div class="about_thumb d-flex">
                            <div class="img_1">
                                <img src="/HotelBooking/img/about/about_1.png" alt="">
                            </div>
                            <div class="img_2">
                                <img src="/HotelBooking/img/about/about_2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- about_area_end -->

        <!-- offers_area_start -->
        <div class="offers_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section_title text-center mb-100">
                            <span>Our Offers</span>
                            <h3>Ongoing Offers</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-md-4">
                        <div class="single_offers">
                            <div class="about_thumb">
                                <img src="img/offers/1.png" alt="">
                            </div>
                            <h3>Up to 35% savings on Club <br>
                                rooms and Suites</h3>
                            <ul>
                                <li>Luxaries condition</li>
                                <li>3 Adults & 2 Children size</li>
                                <li>Sea view side</li>
                            </ul>
                            <a href="#" class="book_now">book now</a>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-4">
                        <div class="single_offers">
                            <div class="about_thumb">
                                <img src="img/offers/2.png" alt="">
                            </div>
                            <h3>Up to 35% savings on Club <br>
                                rooms and Suites</h3>
                            <ul>
                                <li>Luxaries condition</li>
                                <li>3 Adults & 2 Children size</li>
                                <li>Sea view side</li>
                            </ul>
                            <a href="#" class="book_now">book now</a>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-4">
                        <div class="single_offers">
                            <div class="about_thumb">
                                <img src="img/offers/3.png" alt="">
                            </div>
                            <h3>Up to 35% savings on Club <br>
                                rooms and Suites</h3>
                            <ul>
                                <li>Luxaries condition</li>
                                <li>3 Adults & 2 Children size</li>
                                <li>Sea view side</li>
                            </ul>
                            <a href="#" class="book_now">book now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- offers_area_end -->

        <!-- video_area_start -->
        <div class="video_area video_bg overlay">
            <div class="video_area_inner text-center">
                <span>Montana Sea View</span>
                <h3>Relax and Enjoy your <br>
                    Vacation </h3>
                <a href="https://www.youtube.com/watch?v=vLnPwxZdW4Y" class="video_btn popup-video">
                    <i class="fa fa-play"></i>
                </a>
            </div>
        </div>
        <!-- video_area_end -->

        <!-- about_area_start -->
        <div class="about_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-7">
                        <div class="about_thumb2 d-flex">
                            <div class="img_1">
                                <img src="/HotelBooking/img/about/1.png" alt="">
                            </div>
                            <div class="img_2">
                                <img src="/HotelBooking/img/about/2.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5">
                        <div class="about_info">
                            <div class="section_title mb-20px">
                                <span>Delicious Food</span>
                                <h3>We Serve Fresh and <br>
                                    Delicious Food</h3>
                            </div>
                            <p>Suscipit libero pretium nullam potenti. Interdum, blandit phasellus consectetuer dolor ornare
                                dapibus enim ut tincidunt rhoncus tellus sollicitudin pede nam maecenas, dolor sem. Neque
                                sollicitudin enim. Dapibus lorem feugiat facilisi faucibus et. Rhoncus.</p>
                            <a href="#" class="line-button">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- about_area_end -->

        <!-- features_room_startt -->
        <div class="features_room">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section_title text-center mb-100">
                            <span>Featured Rooms</span>
                            <h3>Choose a Better Room</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rooms_here">
                <div class="single_rooms">
                    <div class="room_thumb">
                        <img src="/HotelBooking/img/rooms/1.png" alt="">
                        <div class="room_heading d-flex justify-content-between align-items-center">
                            <div class="room_heading_inner">
                                <span>From $250/night</span>
                                <h3>Superior Room</h3>
                            </div>
                            <a href="#" class="line-button">book now</a>
                        </div>
                    </div>
                </div>
                <div class="single_rooms">
                    <div class="room_thumb">
                        <img src="/HotelBooking/img/rooms/2.png" alt="">
                        <div class="room_heading d-flex justify-content-between align-items-center">
                            <div class="room_heading_inner">
                                <span>From $250/night</span>
                                <h3>Deluxe Room</h3>
                            </div>
                            <a href="#" class="line-button">book now</a>
                        </div>
                    </div>
                </div>
                <div class="single_rooms">
                    <div class="room_thumb">
                        <img src="/HotelBooking/img/rooms/3.png" alt="">
                        <div class="room_heading d-flex justify-content-between align-items-center">
                            <div class="room_heading_inner">
                                <span>From $250/night</span>
                                <h3>Signature Room</h3>
                            </div>
                            <a href="#" class="line-button">book now</a>
                        </div>
                    </div>
                </div>
                <div class="single_rooms">
                    <div class="room_thumb">
                        <img src="/HotelBooking/img/rooms/4.png" alt="">
                        <div class="room_heading d-flex justify-content-between align-items-center">
                            <div class="room_heading_inner">
                                <span>From $250/night</span>
                                <h3>Couple Room</h3>
                            </div>
                            <a href="#" class="line-button">book now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- features_room_end -->

        <!-- forQuery_start -->
        <div class="forQuery">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1 col-md-12">
                        <div class="Query_border">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-xl-6 col-md-6">
                                    <div class="Query_text">
                                        <p>For Reservation 0r Query?</p>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <div class="phone_num">
                                        <a href="#" class="mobile_no">+10 576 377 4789</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- forQuery_end-->

        <!-- instragram_area_start -->
        <div class="instragram_area">
            <div class="single_instagram">
                <img src="/HotelBooking/img/instragram/1.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="/HotelBooking/img/instragram/2.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="/HotelBooking/img/instragram/3.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="/HotelBooking/img/instragram/4.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="/HotelBooking/img/instragram/5.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- instragram_area_end -->

        <!-- footer -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    address
                                </h3>
                                <p class="footer_text"> 200, Green road, Mongla, <br>
                                    New Yor City USA</p>
                                <a href="#" class="line-button">Get Direction</a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Reservation
                                </h3>
                                <p class="footer_text">+10 367 267 2678 <br>
                                    reservation@montana.com</p>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 col-lg-2">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Navigation
                                </h3>
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">Rooms</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">News</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Newsletter
                                </h3>
                                <form action="#" class="newsletter_form">
                                    <input type="text" placeholder="Enter your mail">
                                    <button type="submit">Sign Up</button>
                                </form>
                                <p class="newsletter_text">Subscribe newsletter to get updates</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right_text">
                <div class="container">
                    <div class="footer_border"></div>
                    <div class="row">
                        <div class="col-xl-8 col-md-7 col-lg-9">
                            <p class="copy_right">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="col-xl-4 col-md-5 col-lg-3">
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-facebook-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- link that opens popup -->

        <!-- form itself end-->
        <form id="test-form" class="white-popup-block mfp-hide">
            <div class="popup_box ">
                <div class="popup_inner">
                    <h3>Booking Hotel</h3>
                    <form action="#">
                        <div class="row">
                            <div class="col-xl-6">
                                <input id="datepicker" placeholder="Check in date">
                            </div>
                            <div class="col-xl-6">
                                <input id="datepicker2" placeholder="Check out date">
                            </div>
                            <div class="col-xl-6">
                                <select class="form-select wide" id="default-select" class="">
                                    <option data-display="Adult">1</option>
                                    <option value="1">2</option>
                                    <option value="2">3</option>
                                    <option value="3">4</option>
                                </select>
                            </div>
                            <div class="col-xl-6">
                                <select class="form-select wide" id="default-select" class="">
                                    <option data-display="Children">1</option>
                                    <option value="1">2</option>
                                    <option value="2">3</option>
                                    <option value="3">4</option>
                                </select>
                            </div>
                            <div class="col-xl-12">
                                <select class="form-select wide" id="default-select" class="">
                                    <option data-display="Room type">Room type</option>
                                    <option value="1">Laxaries Rooms</option>
                                    <option value="2">Deluxe Room</option>
                                    <option value="3">Signature Room</option>
                                    <option value="4">Couple Room</option>
                                </select>
                            </div>
                            <div class="col-xl-12">
                                <button type="submit" class="boxed-btn3">Check Availability</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </form>
        <!-- form itself end -->

        <!-- JS here -->
        <script src="/HotelBooking/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="/HotelBooking/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="/HotelBooking/js/popper.min.js"></script>
        <script src="/HotelBooking/js/bootstrap.min.js"></script>
        <script src="/HotelBooking/js/owl.carousel.min.js"></script>
        <script src="/HotelBooking/js/isotope.pkgd.min.js"></script>
        <script src="/HotelBooking/js/ajax-form.js"></script>
        <script src="/HotelBooking/js/waypoints.min.js"></script>
        <script src="/HotelBooking/js/jquery.counterup.min.js"></script>
        <script src="/HotelBooking/js/imagesloaded.pkgd.min.js"></script>
        <script src="/HotelBooking/js/scrollIt.js"></script>
        <script src="/HotelBooking/js/jquery.scrollUp.min.js"></script>
        <script src="/HotelBooking/js/wow.min.js"></script>
        <script src="/HotelBooking/js/nice-select.min.js"></script>
        <script src="/HotelBooking/js/jquery.slicknav.min.js"></script>
        <script src="/HotelBooking/js/jquery.magnific-popup.min.js"></script>
        <script src="/HotelBooking/js/plugins.js"></script>
        <script src="/HotelBooking/js/gijgo.min.js"></script>

        <!--contact js-->
        <script src="/HotelBooking/js/contact.js"></script>
        <script src="/HotelBooking/js/jquery.ajaxchimp.min.js"></script>
        <script src="/HotelBooking/js/jquery.form.js"></script>
        <script src="/HotelBooking/js/jquery.validate.min.js"></script>
        <script src="/HotelBooking/js/mail-script.js"></script>

        <script src="/HotelBooking/js/main.js"></script>
        <script>
                                    document.getElementById("profile-button").addEventListener("click", function () {
                                        var dropdown = document.getElementById("profile-dropdown");
                                        if (dropdown.style.display === "block") {
                                            dropdown.style.display = "none";
                                        } else {
                                            dropdown.style.display = "block";
                                        }
                                    });

// Close the dropdown if the user clicks outside of it
                                    window.addEventListener("click", function (event) {
                                        if (!event.target.matches("#profile-button")) {
                                            var dropdown = document.getElementById("profile-dropdown");
                                            if (dropdown.style.display === "block") {
                                                dropdown.style.display = "none";
                                            }
                                        }
                                    });
        </script>

    </body>

</html>