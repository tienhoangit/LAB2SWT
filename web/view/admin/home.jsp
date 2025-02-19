<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- Boxicons CDN Link -->
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/admin1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class="bx bx-menu sidebarBtn"></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="profile-details">
                    <img src="./images/admin.jpg" alt="Avata Admin" />
                    <span class="admin_name">Admin</span>
                </div>
            </nav>

            <div class="home-content">
                <div class="overview-boxes" style="justify-content: normal; gap: 30px">
                    <div class="box">
                        <div class="right-side">
                            <div style="margin-right: 20px" class="box-topic">Total Order</div>
                            <div class="number">${requestScope.order}</div>
                            <div class="indicator">
                                <i class="bx bx-up-arrow-alt"></i>
                                <span class="text">Total Order Here</span>
                            </div>
                        </div>
                        <i class="bx bx-cart-alt cart"></i>
                    </div>

                    <div class="box">
                        <div class="right-side">
                            <div style="margin-right: 30px" class="box-topic">Total User</div>
                            <div  class="number">${requestScope.user}</div>
                            <div class="indicator">
                                <i class="bx bx-up-arrow-alt"></i>
                                <span class="text">Up from yesterday</span>
                            </div>
                        </div>
                        <i class="bx bx-user cart three"></i>
                    </div>


                </div>

                <div class="sales-boxes">
                    
                    <div class="recent-sales box">
                        <div class="title">Top Selling Product</div>
                        
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Quantity</th>
                                    </tr>
                                </thead>
                                <c:if test="${requestScope.listPOImg != null}">
                                <tbody>
                                    <c:set var="a" value="0"></c:set>
                                    <c:forEach items="${requestScope.listPOImg}" var="i">
                                        <tr>    
                                            <c:set var="a" value="${a+1}"></c:set>
                                            <th scope="row">${a}</th>
                                            <td>${i.name}</td>
                                            <td><img src="${i.img}" width="100px" height="100px" alt="alt"/></td>
                                            <td>${i.quantity}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </c:if>
                    </div>

                </div>
            </div>
        </section>
        <script>
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".sidebarBtn");
            sidebarBtn.onclick = function () {
                sidebar.classList.toggle("active");
                if (sidebar.classList.contains("active")) {
                    sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
                } else
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            };
        </script>

    </body>
</html>
