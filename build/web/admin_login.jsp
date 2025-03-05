<%-- 
    Document   : admin_login
    Created on : Mar 1, 2025, 9:26:26 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
    <title>Admin Login - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
     <%@include file="component/allCss.jsp"%>   
    
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Admin Login</h2>
        <form action="AdminLoginServlet" method="post" class="col-md-4 mx-auto p-4 border rounded">
            <div class="mb-3">
                <label>Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>
</body>
</html>


