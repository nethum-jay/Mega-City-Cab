<%-- 
    Document   : addContact.jsp
    Created on : Feb 21, 2025, 11:09:28 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Bookings - Mega City Cab</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%>
</head>
<body>
     <%@include file="component/navabr.jsp" %>
    <div class="container mt-4">
        <h2 class="text-center">My Bookings 📅</h2>
        <p class="text-center text-muted">View your past and upcoming bookings.</p>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>


            </tbody>
        </table>
        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>
