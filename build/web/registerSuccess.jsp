<%-- 
    Document   : registerSuccess
    Created on : Feb 27, 2025, 12:06:10 AM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Successful</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
    <body class="bg-light">
        <%@include file="component/navabr.jsp" %> 
        <div class="container mt-5">
            <h2 class="text-success text-center">Registration Successful!</h2>
            <p class="text-center">You can now <a href="index.jsp">login</a> to your account.</p>
        </div>
    </body>
</html>
