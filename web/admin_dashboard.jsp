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
        response.sendRedirect("admin_login.jsp?error=Please+login+first");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            margin-top: 50px;
        }
        .card {
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Admin Dashboard - Mega City Cab</span>
        </div>
    </nav>
    
    <div class="container dashboard-container">
        <h2 class="text-center mb-4">Welcome, Admin</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h4 class="card-title text-center">Manage Customers</h4>
                    <div class="card-body text-center">
                        <a href="manage_customers.jsp" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h4 class="card-title text-center">Manage Drivers</h4>
                    <div class="card-body text-center">
                        <a href="manage_drivers.jsp" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h4 class="card-title text-center">Manage Bookings</h4>
                    <div class="card-body text-center">
                        <a href="manage_bookings.jsp" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="AdminLogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </div>

</body>
</html>
