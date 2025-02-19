

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
                <div class="sidebar-button">
                    <i class="bx bx-menu sidebarBtn"></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-box">
                    <input id="search" type="date"   value=${requestScope.search}/>
                    <i onclick="searchO()" class="bx bx-search"></i>
                </div>
                 <div class="profile-details">
                    <img src="./images/admin.jpg" alt="Avata Admin" />
                    <span class="admin_name">Admin</span>
                </div>
            </nav>

            <div class="home-content container ">

                <table class="table mt-3">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Customer</th>
                            <th scope="col">Date</th>
                            <th scope="col">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="a" value="0"/>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items="${requestScope.list}" var="i">
                                <c:set var="a" value="${a+1}"/>
                                <tr onclick="detailOrder('${i.id}')">
                                    <th scope="row">${a}</th>
                                    <td>${i.name}</td>
                                    <td>${i.date}</td>
                                    <td>${i.total} $</td>                            
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>

                <div aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.count}" var="i">
                            <li class="page-item"><a class="${requestScope.index == i? "page-link active":"page-link"}" href="order?page=${i}&date=${requestScope.search}">${i}</a></li>
                        </c:forEach>               
                    </ul>
                </div>
            </div>
        </section>



    </body>

    <script>

        function searchO() {
            let search = document.querySelector("#search").value
            window.location = "search_order?date=" + search
        }

        function  detailOrder(id) {
            window.location = 'admin_detail?oid=' + id
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
