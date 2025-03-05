<%-- 
    Document   : admin_dashboard
    Created on : Mar 1, 2025, 9:40:27 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>

<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
         <%@include file="component/allCss.jsp"%>    
    
</head>
<body>
    <%-- Navbar --%>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Mega City Cab - Admin Panel</span>
            <a href="AdminLogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Welcome, Admin</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card p-3">
                    <h4>Manage Customers</h4>
                    <a href="manage_customers.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h4>Manage Drivers</h4>
                    <a href="manage_drivers.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h4>Manage Bookings</h4>
                    <a href="manage_bookings.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>