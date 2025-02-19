

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
                    <input type="text" placeholder="Search..." />
                    <i class="bx bx-search"></i>
                </div>
                <div class="profile-details">
                    <img src="./images/admin.jpg" alt="Avata Admin" />
                    <span class="admin_name">Admin</span>
                </div>
            </nav>

            <div class="home-content container ">
                <form style="width: 30vw" class="container mt-3" action="admin_userupdate" method="POST">
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
                        <label  class="form-label">Email</label>
                        <input  value="${requestScope.user.email}" name="email" type="email" class="form-control" >
                    </div>
                    <div class="mb-3">
                        <label  class="form-label">Password</label>
                        <input  value="${requestScope.user.pass}" name="pass" type="password" class="form-control" >
                    </div>


                    <div class="mb-3">
                        <label  class="form-label">Role</label>
                        <select name="role" class="form-select" aria-label="Default select example">
                            <option  ${requestScope.user.role == 0?"selected":""} value="0">User</option>
                            <option ${requestScope.user.role == 1?"selected":""} value="1">Admin</option>
                        </select>
                    </div>






                        <button type="submit" class="btn btn-primary mt-4">Update</button>
                </form>

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
