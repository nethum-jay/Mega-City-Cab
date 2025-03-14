<%-- 
    Document   : login
    Created on : Feb 21, 2025, 11:10:14 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Login | Mega City Cab</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>

    <style>
        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 50px;
        }
        .form-control {
            padding-left: 40px;
        }
        .input-group-text {
            background: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light">

    <%@include file="component/navbar.jsp" %> 

    <div class="container">
        <div class="login-container p-4 bg-white shadow rounded">
            <h2 class="text-center text-primary">Customer Login</h2>


            <% String error = request.getParameter("error"); %>
            <% if (error != null) { %>
                <div class="alert alert-danger text-center"><%= error %></div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" name="email" class="form-control" required placeholder="Enter your email">
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" name="password" class="form-control" required placeholder="Enter your password">
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </div>
            </form>

            <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register</a></p>
        </div>
    </div>

    <%@include file="component/footer.jsp"%>  


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</body>
</html>
