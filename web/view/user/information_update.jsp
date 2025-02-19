<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page  import = "java.util.ArrayList "%>
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
        <link rel="shortcut icon" href="images/favicon.png" type="">
         <link href="css/user_1.css" rel="stylesheet" type="text/css"/>
        <title> ShopCar </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom styles for this template -->
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="/css/admin1.css" rel="stylesheet" type="text/css"/>
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
        
    </head>

    <body class="sub_page">

        <div class="hero_area">
            <div style="background-color: grey ; height:120px"class="bg-box">
                
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="home">
                            <span>
                                ShopCar
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul style="font-size: 24px" class="navbar-nav  mx-auto ">
                                <li class="nav-item">
                                    <a class="nav-link" href="home">Home </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="menu?id=${sessionScope.user.id}">Menu <span class="sr-only">(current)</span> </a>
                                </li>

                            </ul>
                            <div class="user_option">
                                <c:if test="${sessionScope.user == null}">
                                    <button class="btn btn-dark"><a style="text-decoration: none;color: white" href="login">Login</a></button>
                                    <button class="btn btn-dark mx-3"><a style="text-decoration: none;color: white" href="signup">Sign-up</a></button>

                                </c:if>

                               <c:if test="${sessionScope.user != null}">
                                    <ul id="nav">
<!--                                        <li class="first"><a style="text-decoration: none;" href="cart?uid=${sessionScope.user.id} ">
                                                <i class="fa-solid fa-cart-shopping"></i>
                                            </a>
                                        </li>-->
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

<!--                                <a href="menu" class="order_online">
                                    Order Online
                                </a>-->
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
           
                                <div style="margin-top: 50px ; margin-bottom: 150px" class="home-content container ">
                <form style="width: 30vw" class="container mt-3" action="information_update" method="POST">
                    <c:if test="${requestScope.err != null}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.err}
                        </div>
                    </c:if>
                    <div class="mb-3" style="display: none" >

                        <input  value="${requestScope.user.id}" name="id" type="text" class="form-control"  >
                    </div>
                    <div class="mb-3">
                        <label  class="form-label">User name</label>
                        <input  value="${requestScope.user.name}" name="name" type="text" class="form-control"  >

                    </div>
                         <div class="mb-3">
                        <label  class="form-label">Phone</label>
                        <input  value="${requestScope.user.phone}" name="phone" type="text" class="form-control" >
                    </div>
                      <div class="mb-3">
                        <label  class="form-label">Email</label>
                        <input  value="${requestScope.user.email}" name="email" type="email" class="form-control" >
                    </div>
                    <div class="mb-3">
                        <label  class="form-label">Password</label>
                        <input  value="${requestScope.user.pass}" name="pass" type="password" class="form-control" >
                    </div>



<button style="margin-left: 180px ; margin-right: 40px" type="submit" class="btn btn-primary mt-4">Update</button> 
                </form>                    
                     </div>           
 
                                
 <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="home" class="footer-logo">
                                ShopCar
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
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
                            Everyday
                        </p>
                        <p>
                            10.00 Am -10.00 Pm
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://html.design/">Free Html Templates</a>
                    </p>
                </div>
            </div>
        </footer>
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
                    
    </body>
    <script>
        function updateP(id) {
            window.location = "information_update?id=" + id;
        }

       
        
        function setupdate(id) {
            window.location = "information_update?id=" + id;
        }
 
    </script>     
</html>
