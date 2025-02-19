

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
                    <input type="text" id="search" placeholder="Search..." name="txt" value="${requestScope.name}"/>
                    <i onclick="searchP()" class="bx bx-search"></i>
                </div>
                 <div class="profile-details">
                    <img src="./images/admin.jpg" alt="Avata Admin" />
                    <span class="admin_name">Admin</span>
                </div>
            </nav>

            <div class="home-content container ">
                <button class="btn btn-primary"><a href="admin_add" style="color: white; text-decoration: none">Add new product</a></button>
                <table class="table mt-3">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Desc</th>
                            
                            <th scope="col">Type</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach items="${requestScope.list}" var="i">
                                <tr>
                                    <th scope="row">${i.id}</th>
                                    <td>${i.name}</td>
                                    <td><img src="${i.img}" width="100px" height="100px" style="object-fit: cover" alt="alt"/></td>
                                    <td>${i.des}</td>
                                    
                                    <td>${i.fid}</td>
                                    <td>${i.price}</td>
                                    <td>
                                        <button  onclick="updateP('${i.id}')" class="btn btn-success"><i class="fa-solid fa-pen-nib"></i></button>
                                        <button onclick="setDetete('${i.id}')" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-danger"><i class="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>

                <div aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.count}" var="i">
                            <li class="page-item"><a class="${requestScope.index == i? "page-link active":"page-link"}" href="product?page=${i}&text=${requestScope.search}">${i}</a></li>
                        </c:forEach>               
                    </ul>
                </div>


            </div>
        </section>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Messenger</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button onclick="deleteP()" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>

    </body>

    <script>
        function updateP(id) {
            window.location = "admin_update?id=" + id
        }

        function setDetete(id) {
            document.querySelector(".modal-body").innerText = "Do you want delete product with id: " + id
        }

        function deleteP() {
            let id = document.querySelector(".modal-body").innerText.split(":")
            let d = id[id.length - 1].substring(1)
            window.location = "delete?id=" + d
        }
        function searchP() {
            let search = document.querySelector("#search").value
            window.location = "admin_search?txt=" + search
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
