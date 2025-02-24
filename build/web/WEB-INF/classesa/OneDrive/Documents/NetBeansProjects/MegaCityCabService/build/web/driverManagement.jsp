<%-- 
    Document   : driverManagement
    Created on : Feb 22, 2025, 12:38:54 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <title>Available Drivers</title>
        
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body>
        
        <%@include file="component/navabr.jsp" %>
        
        <div class="container mt-4">
        <h2 class="text-center">Available Drivers</h2>
        <p class="text-center text-muted">View the available drivers in Mega City Cab.</p>


            <div class="text-end">
                <a href="addDriver.jsp" class="btn btn-primary">+ Add New Driver</a>
            </div>
        

        <table class="table table-bordered table-hover mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Driver ID</th>
                    <th>Name</th>
                    <th>License Number</th>
                    <th>Experience</th>
                    <th>Contact</th>
                    <th>Availability</th>

                        <th>Actions</th>

                </tr>
            </thead>
            <tbody>

                <tr>

                </tr>

            </tbody>
        </table>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>