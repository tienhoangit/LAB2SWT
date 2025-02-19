

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="./images/favicon.png" type="">

        <title> ShopCar </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href=./css/user.css>
        <!-- Custom styles for this template -->
        <link href="css/style1.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

    </head>

    <body>

        <div class="hero_area">
            <div class="bg-box">
                <img src="./images/background.jpg" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container " style="margin-bottom: 50px"/>
                        <a class="navbar-brand" href="home">
                            <span>
                                ShopCar
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="menu">Menu</a>
                                </li>

                            </ul>
                            <div class="user_option">
                                <c:if test="${sessionScope.user == null}">
                                    <button class="btn btn-dark"><a style="text-decoration: none;color: white" href="login">Login</a></button>
                                    <button class="btn btn-dark mx-3"><a style="text-decoration: none;color: white" href="signup">Sign-up</a></button>

                                </c:if>

                                <c:if test="${sessionScope.user != null}">
                                    <ul id="nav">
                                        <li class="first"><a style="text-decoration: none;" href="cart?uid=${sessionScope.user.id} ">
                                                <i class="fa-solid fa-cart-shopping"></i>
                                            </a>
                                        </li>
                                        <li class="second"> 
                                            <a  style="text-decoration: none; padding: 10px 10px  ; margin: 0px" href="" >
                                                <i class="fa-solid fa-user"></i>${sessionScope.user.name}

                                            </a>
                                            <ul class="subnave">
                                                <li><a onclick="setupdate('${sessionScope.user.id}')" href="javascript:void(0);" >Information</a></li>
                                                <li><a href="login">Log Out</a></li>
                                            </ul>
                                        </li>

                                    </ul>


                                </c:if>



                                <!-- when login success -->
                                <!--            
                                -->
                                <a href="menu" class="order_online">
                                    Order Online
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section ">
                <div id="customCarousel1" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                Ferrari 
                                            </h1>
                                            <p style="text-align: justify">
                                                Ferrari continues to be a leading name in the world of high-performance sports cars, combining cutting-edge technology with timeless design and unparalleled racing pedigree.
                                            </p>

                                            <div class="btn-box">
                                                <a href="menu" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                Lamborghini
                                            </h1>
                                            <p style="text-align: justify">
                                                Lamborghini is an Italian luxury sports car manufacturer known for producing high-performance, exotic supercars with bold, aggressive designs. Founded in 1963 by Ferruccio Lamborghini, the company was created to rival Ferrari, focusing on luxury, power, and innovative engineering.
                                            </p>
                                            <div class="btn-box">
                                                <a href="menu" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                Ford
                                            </h1>
                                            <p style="text-align: justify">
                                                Ford Motor Company is an American multinational automaker founded by Henry Ford in 1903. It revolutionized the automotive industry by introducing mass production techniques, making cars affordable to the average consumer
                                            </p>
                                            <div class="btn-box">
                                                <a href="menu" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <ol class="carousel-indicators">
                            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                            <li data-target="#customCarousel1" data-slide-to="1"></li>
                            <li data-target="#customCarousel1" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>

            </section>
            <!-- end slider section -->
        </div>



        <section class="about_section layout_padding">
            <div class="container  ">

                <div class="row">
                    <div class="col-md-6 ">
                        <div class="img-box">
                            <img src="./images/LogoShopCar.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-box">
                            <div class="heading_container">
                                <h2>
                                    We Are ShopCar
                                </h2>
                            </div>
                            <p style="text-align: justify">
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration
                                in some form, by injected humour, or randomised words which don't look even slightly believable. If you
                                are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in
                                the middle of text. All
                            </p>
                            <a href="#">
                                Read More
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- client section -->

        <section class="client_section layout_padding-bottom">
            <div class="container">
                <div class="heading_container heading_center psudo_white_primary mb_45">
                    <h2>
                        What Says Our Customers
                    </h2>
                </div>
                <div class="carousel-wrap row ">
                    <div class="owl-carousel client_owl-carousel">
                        <div class="item">
                            <div class="box">
                                <div class="detail-box">
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
                                    </p>
                                    <h6>
                                        Moana Michell
                                    </h6>
                                    <p>
                                        magna aliqua
                                    </p>
                                </div>
                                <div class="img-box">
                                    <img src="images/client1.jpg" alt="" class="box-img">
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="box">
                                <div class="detail-box">
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
                                    </p>
                                    <h6>
                                        Mike Hamell
                                    </h6>
                                    <p>
                                        magna aliqua
                                    </p>
                                </div>
                                <div class="img-box">
                                    <img src="images/client2.jpg" alt="" class="box-img">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end client section -->


        <!--footer-->
        <!-- footer section -->


        <!--remove line on cart tab--> <!--use only on this tab-->


        <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="https://www.google.com/maps/search/?api=1&query=123+Model+Car+Lane,+Hobby+City,+USA" target="_blank">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        123 Model Car Lane, Hobby City, USA
                                    </span>
                                </a>
                                <a href="tel:+18005551234">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +1 (800) 555-1234
                                    </span>
                                </a>
                                <a href="mailto:support@modelcarshop.com">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        support@modelcarshop.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="" class="footer-logo" style="text-decoration: none;">
                                ShopCar
                            </a>
                            <p>
                                Discover a wide variety of high-quality, collectible model cars. Perfect for hobbyists and collectors alike.
                            </p>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa-brands fa-facebook-f"></i>
                                </a>
                                <a href="">
                                    <i class="fa-brands fa-twitter"></i>
                                </a>
                                <a href="">
                                    <i class="fa-brands fa-linkedin-in"></i>
                                </a>
                                <a href="">
                                    <i class="fa-brands fa-square-instagram"></i>
                                </a>
                                <a href="">
                                    <i class="fa-brands fa-pinterest"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <h4>
                            Opening Hours
                        </h4>
                        <p>
                            Monday - Friday
                        </p>
                        <p>
                            9:00 AM - 6:00 PM
                        </p>
                        <p>
                            Saturday: 10:00 AM - 4:00 PM
                        </p>
                        <p>
                            Sunday: Closed
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://modelcarshop.com/">ShopCar</a>
                    </p>
                </div>
            </div>
        </footer>



        <!-- end footer-->

        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->
        <script>
            function updateP(id) {
                window.location = "information_update?id=" + id;
            }



            function setupdate(id) {
                window.location = "information_update?id=" + id;
            }

        </script>      

    </body>

</html>

