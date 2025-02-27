<%-- 
    Document   : index
    Created on : Feb 21, 2025, 9:16:46 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please login first");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%>
        <style type="text/css">
            .back-img{
                background: url(img/background.jpg);
                width: 100%;
                height:80vh;
                background-repeat: no-repeat;
                background-size: cover;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <%@include file="component/navabr.jsp" %>

        <div class="container back-img text-center text-success">  
            <h1>Welcome to Mega City Cab service</h1>
        </div>
        
        <div class="container mt-4">
            <h2>Welcome, <%= sessionObj.getAttribute("userName") %>!</h2>
            <p>You are logged in as <%= sessionObj.getAttribute("userEmail") %>.</p>
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
        
         <div class="row mt-4">
            <!-- Book a Ride -->
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Book a Cab</h5>
                        <p class="card-text">Reserve your ride in a few clicks.</p>
                        <a href="booking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>

            <!-- View Bookings -->
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">My Bookings</h5>
                        <p class="card-text">Check the status of your cab bookings.</p>
                        <a href="bookingDetails.jsp" class="btn btn-success">View Bookings</a>
                    </div>
                </div>
            </div>

            <!-- Billing -->
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Billing</h5>
                        <p class="card-text">View and print your ride invoices.</p>
                        <a href="bill.jsp" class="btn btn-warning">View Bill</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Help Section -->
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Help & Support</h5>
                        <p class="card-text">Need assistance? Find help here.</p>
                        <a href="help.jsp" class="btn btn-info">Get Help</a>
                    </div>
                </div>
            </div>

            <!-- Logout -->
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Sign out of your account securely.</p>
                        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
        <%--<%@include file="component/footer.jsp" %>--%>    
    </body>
</html>
