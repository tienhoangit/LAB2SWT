<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page  import = "java.util.ArrayList "%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        <link rel="stylesheet" href="./css/user_1.css"/>
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet"/>
    </head>
    <body class="sub_page">
        <div class="hero_area">
            <div class="bg-box">
                <img src="images/backgroundGrey.jpg" alt="">
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
                        <c:if test="${requestScope.brands != null}">
                            <c:forEach var="brand" items="${requestScope.brands}">
                                <li>${brand}</li>
                                </c:forEach>

                        </c:if>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item">
                                    <a class="nav-link" href="home">Home</a>
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


                                <!--                                <a href="menu" class="order_online">
                                                                    Order Online
                                                                </a>-->
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>

        <!-- car section -->


        <section class="food_section layout_padding">
            <div class="container" style="display: flex">



                <div class="filters-content col-sm-8">
                    <div class="row grid">


                        <!-- card -->
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items="${requestScope.list}" var="u">
                                <div class="col-sm-6 col-lg-4 all">
                                    <div class="box">
                                        <div>
                                            <div class="img-box">
                                                <img src="${u.img}" alt="">
                                            </div>
                                            <div class="detail-box" >
                                                <h5 >
                                                    ${u.name}
                                                </h5 >
                                                <p style="height: 50px; line-break:auto">
                                                    ${u.des}
                                                </p>
                                                <div class="options">
                                                    <h6>
                                                        $${u.price}
                                                    </h6>
                                                    <c:if test="${sessionScope.user == null}">
                                                        <a href="login">
                                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 250 456.029 456.029;" xml:space="preserve">

                                                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                                                  c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />

                                                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                                                  C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                                                  c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                                                  C457.728,97.71,450.56,86.958,439.296,84.91z" />

                                                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                                                  c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />



                                                            </svg>
                                                        </a>

                                                    </c:if>
                                                    <c:if test="${sessionScope.user != null}">
                                                        <a href="addCart?uid=${sessionScope.user.id}&pid=${u.id}">

                                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 250 456.029 456.029;" xml:space="preserve">

                                                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                                                  c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />

                                                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                                                  C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                                                  c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                                                  C457.728,97.71,450.56,86.958,439.296,84.91z" />

                                                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                                                  c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />



                                                            </svg>
                                                        </a>
                                                    </c:if>    





                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>

                        </c:if>


                    </div>
                    <div class="page">

                        <c:forEach begin="1" end="${endPage}" var="m">
                            <a href="menu?index=${m}&sort=${param.sort}&query=${param.query}${brandParams}">
                                ${m}
                            </a>
                        </c:forEach>


                    </div >
                    <style>
                        .page{
                            display: flex;
                            gap: 10px;
                            margin-top: 30px
                        }
                        .page a{
                            padding: 10px;
                            text-decoration: none;
                            border: 1px solid #ccc;
                            border-radius: 6px ;
                            display: inline-block;
                            color: black;
                            transition: 0.3s;
                        }
                        .page a:hover {
                            background-color: black;
                            color: white;
                            border-color: black;
                        }
                    </style>


                </div>

                <div class="col-sm-4">

                    <div class="heading_container heading_center">
                        <!-- Thanh công cụ tìm kiếm -->
                        <div class="search-bar">
                            <form action="menu" method="get">
                                <input type="text" name="query" value="${param.query}" placeholder="Enter name of Product" class="search-input">
                                <input type="hidden" name="sort" value="${param.sort}"> <!-- Giữ giá trị sort khi tìm kiếm -->
                                <button type="submit" class="search-button">Search</button>

                                <style>

                                    .search-bar {
                                        display: flex;
                                        justify-content: center;
                                        margin-bottom: 20px;
                                    }

                                    .search-input {
                                        padding: 8px 12px;
                                        width: 250px;
                                        border-radius: 20px 0 0 20px;
                                        border: 1px solid #ccc;
                                        font-size: 13px;
                                        outline: none;
                                        transition: all 0.3s ease;
                                    }

                                    .search-input:focus {
                                        border-color: #007bff;
                                        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
                                    }

                                    .search-button {
                                        padding: 8px 16px;
                                        border-radius: 0 20px 20px 0;
                                        border: none;
                                        background-color: #f0f0f0;
                                        color: #333;
                                        font-weight: bold;
                                        cursor: pointer;
                                        transition: background-color 0.3s ease;
                                        font-size: 13px;
                                    }

                                    .search-button:hover {
                                        background-color: #e0e0e0;
                                    }

                                    .search-button:active {
                                        background-color: #d0d0d0;
                                    }

                                </style>


                            </form>
                        </div>
                    </div>




<!--                                <h3>Brand</h3>-->
                    <form action="menu" method="get">
                        <c:set var="brands" value="${sessionScope.t}" />
                        <ul class="brand-filter">
                            <c:forEach var="brand" items="${brands}" varStatus="status">
                                <li>
                                    <label>
                                        <input type="checkbox" name="brand" value="${brand.name}"  
                                               onclick="this.form.submit()"
                                               <c:if test="${fn:contains(selectedBrands, brand.name)}">checked</c:if> >
                                        <img src="./${brand.imgLogo}" alt="${brand.name}">
                                    </label>
                                </li>
                            </c:forEach>
                        </ul>
                        <style>


                            .brand-filter {
                                display: flex;
                                flex-wrap: wrap;
                                gap: 10px; /* Khoảng cách giữa các logo */
                            }

                            .brand-filter li {
                                flex: 0 0 25%; /* Đặt mỗi logo chiếm 25% chiều rộng, tức là 4 logo trên 1 hàng */
                                list-style-type: none; /* Loại bỏ dấu chấm đầu mục */
                            }

                            .brand-filter label {
                                display: flex;
                                align-items: center;
                            }
                        </style>


                        <style>
                            /* Style for the brand filter container */
                            .brand-filter {
                                list-style: none;
                                padding: 0;
                                margin: 0;
                            }

                            .brand-filter li {
                                margin-bottom: 10px;
                            }

                            .brand-filter label {
                                display: flex;
                                align-items: center;
                                cursor: pointer;
                                font-size: 16px;
                            }

                            .brand-filter input[type="checkbox"] {
                                margin-right: 10px;
                                width: 18px;
                                height: 18px;
                                cursor: pointer;
                            }

                            /* Style for the brand logos */
                            .brand-filter img {
                                width: 24px;
                                height: 24px;
                                margin-right: 10px;
                            }

                            /* Add hover effect */
                            /*                                .brand-filter label:hover {
                                                                background-color: #f5f5f5;
                                                                border-radius: 5px;
                                                                padding: 5px;
                                                                transition: background-color 0.2s ease-in-out;
                                                            }*/
                            .brand-filter img {
                                width: auto;
                                max-width: 40px;
                                height: auto;
                                max-height: 40px;
                                object-fit: contain;
                            }


                            .sort-option select {

                                border-radius: 40px;
                                font-size: 16px;
                                border-radius: 8px; /* Rounded corners */
                                border: 1px solid #ddd; /* Light border for a clean look */
                                background-color: #f9f9f9; /* Light background for contrast */
                                cursor: pointer; /* Show pointer on hover */
                                transition: background-color 0.3s, border-color 0.3s; /* Smooth transition effects */
                            }

                            .sort-option select:hover {
                                background-color: #fff; /* Slightly brighter on hover */
                                border-color: #ccc; /* Slightly darker border on hover */
                            }

                        </style>

                        <li class="sort-option" style="list-style: none">

                            <input type="hidden" name="type" value="${param.type}">
                            <select name="sort" id="sort" onchange="this.form.submit()">
                                <option value="name-asc" ${param.sort == 'name-asc' ? 'selected' : ''}>Name A-Z</option>
                                <option value="name-desc" ${param.sort == 'name-desc' ? 'selected' : ''}>Name Z-A</option>

                                <option value="price-asc" ${param.sort == 'price-asc' ? 'selected' : ''}>Price ascending</option>
                                <option value="price-desc" ${param.sort == 'price-desc' ? 'selected' : ''}>Price descending</option>


                            </select>

                        </li>
<!--                        <input type="hidden" name="query" value="${param.query}">
                        <input type="hidden" name="sort" value="${param.sort}">-->

                        </ul>
                    </form>
                    <script>
                        function updateSelection() {
                            // Lấy tất cả checkbox đã được chọn
                            const selectedBrands = [];
                            document.querySelectorAll('input[name="brand"]:checked').forEach(checkbox => {
                                selectedBrands.push(checkbox.value);
                            });

                            // Cập nhật URL với các nhãn hiệu đã chọn
                            const queryParams = new URLSearchParams(window.location.search);
                            queryParams.delete('brand');  // Xóa các tham số cũ trước khi thêm mới
                            selectedBrands.forEach(brand => {
                                queryParams.append('brand', brand);
                            });

                            // Đặt lại chỉ số trang về trang 1
                            queryParams.set('index', '1');

                            // Điều hướng lại trang với các lựa chọn mới
                            window.location.search = queryParams.toString();
                        }

// Khi tải trang, đánh dấu các checkbox đã được chọn
                        window.onload = function () {
                            const urlParams = new URLSearchParams(window.location.search);
                            const selectedBrands = urlParams.getAll('brand');

                            selectedBrands.forEach(brand => {
                                const checkbox = document.getElementById(brand);
                                if (checkbox) {
                                    checkbox.checked = true;
                                }
                            });
                        };
                    </script>


                </div>

            </div>

        </section>

        <!-- end food section -->

        <!-- footer section -->
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


        <!-- footer section -->

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