<%-- 
    Document   : bill
    Created on : Feb 22, 2025, 12:35:39 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Cars - Mega City Cab</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%> 
       
    </head>
    <body>        
        
        <%@include file="component/navabr.jsp" %>
        
         <div class="container mt-4">
        <h2 class="text-center">My Billing & Payments</h2>
        <p class="text-center text-muted">View your ride charges and payment status.</p>

        <table class="table table-striped">
            <thead class="table-striped">
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup</th>
                    <th>Drop-off</th>
                    <th>Ride Fare (LKR)</th>
                    <th>Tax (5%)</th>
                    <th>Total Fare (LKR)</th>
                    <th>Payment Status</th>
                </tr>
            </thead>
            <tbody>

                <tr>

                    </td>
                </tr>

            </tbody>
        </table>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>