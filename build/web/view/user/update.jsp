

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


        <div class="home-content container " style="margin-top: 60px ">
            
            <form style="width: 30vw" class="container mt-3" action="update" method="POST">
                <h3 style="text-align: center">Change Password</h3>
                <c:if test="${requestScope.err != null}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.err}
                    </div>
                </c:if>
               
                <div class="mb-3">
                    <label  class="form-label">Email</label>
                    <input   name="email" type="email" class="form-control" >
                </div>
                <div class="mb-3">
                    <label  class="form-label">Change Password</label>
                    <input   name="pass1" type="password" class="form-control" >
                </div>
                <div class="mb-3">
                    <label  class="form-label">Input password repeat</label>
                    <input   name="pass2" type="password" class="form-control" >
                </div>









                <button type="submit" class="btn btn-secondary mt-4">Update</button>
            </form>

        </div>
    </section>

</body>
</html>
