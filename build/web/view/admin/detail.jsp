
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/admin1.css" rel="stylesheet" type="text/css"/>
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <section class="home-section">
            <nav>

                <div class="search-box">
                    <input type="text" name="text" value="${requestScope.name}" id="search" placeholder="Search..." />
                    <i onclick="searchP()" class="bx bx-search"></i>
                </div>
                <div class="profile-details">
                    <img src="./images/admin.jpg" alt="Avata Admin" />
                    <span class="admin_name">Admin</span>
                </div>
            </nav>

            <div class="home-content container ">

                <div class="user">
                    <p style="font-weight: 600">Customer info</p>
                    <p style="margin-bottom: 0">Name:  ${sessionScope.user.name}</p>
                </div>
                <table class="table mt-3">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Type</th>
                            <th scope="col">Desc</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items="${requestScope.list}" var="i">
                                <tr>
                                    <th scope="row">${i.id}</th>
                                    <td>${i.name}</td>
                                    <td><img src="${i.img}" width="100px" height="100px" style="object-fit: cover" alt="alt"/></td>
                                    <td>${i.ftype}</td>
                                    <td>${i.des}</td>
                                    <td>${i.quantity}</td>
                                    <td>${i.des}</td>    
                                    <td>${i.total}</td>

                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                    <h1>Total = ${requestScope.Total}</h1>
            </div>

        </section>

        <script>
            function searchP() {
                let search = document.querySelector("#search").value;
                window.location = "search_detail?text=" + search;
            }
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
