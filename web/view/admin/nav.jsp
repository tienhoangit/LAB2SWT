

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/admin1.css" rel="stylesheet" type="text/css"/>
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class="bx bx-car"></i>
                <span class="logo_name">Shop Car</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="admin_home" class=${requestScope.home != null ?"active":""}>
                        <i class="bx bx-grid-alt"></i>
                        <span class="links_name">Home</span>
                    </a>
                </li>
                <li>
                    <a href="admin_product" class=${requestScope.product != null ?"active":""}>
                        <i class="bx bx-box"></i>
                        <span class="links_name">Product</span>
                    </a>
                </li>
                <li>
                    <a href="admin_order">
                        <i class="bx bx-list-ul"></i>
                        <span class="links_name">Order list</span>
                    </a>
                </li>
                <li>
                    <a href="admin_user" class=${requestScope.user != null ?"active":""}>
                        <i class='bx bx-user'></i>
                        <span class="links_name">User</span>
                    </a>
                </li>
               
                <li class="log_out">
                    <a href="login">
                        <i class="bx bx-log-out"></i>
                        <span class="links_name">Log out</span>
                    </a>
                </li>
            </ul>
        </div>
       
    </body>
     
</html>
