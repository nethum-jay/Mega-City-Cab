<%-- 
    Document   : registerSuccess
    Created on : Feb 27, 2025, 12:06:10 AM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful | Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .success-container {
            margin-top: 80px;
            max-width: 500px;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="component/navbar.jsp" %>
    
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="success-container text-center">
            <h2 class="text-success">Registration Successful!</h2>
            <p>You can now <a href="index.jsp" class="fw-bold">login</a> to your account.</p>
        </div>
    </div>
    
    <%@ include file="component/footer.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
