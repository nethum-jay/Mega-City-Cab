<%-- 
    Document   : index
    Created on : Feb 21, 2025, 9:16:46 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body>
        <%@include file="component/navabr.jsp" %>
        
    <div class="text-center text-danger text-success" style="margin-top: 250px">
        <h1 class="mt-5" >Welcome to Mega City Cab</h1>
        <p>Use the navigation bar to access features.</p>
    </div>
        

         <div class="row mt-4">
            <!-- Book a Ride -->
            <div class="col-md-4">
                <div class="p-4 bg-white shadow rounded">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-table-list fa-2xl"></i>
                        <h5 class="card-title">Book a Cab</h5>
                        <p class="card-text">Reserve your ride in a few clicks.</p>
                        <a href="booking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>

            <!-- View Bookings -->
            <div class="col-md-4">
                <div class="p-4 bg-white shadow rounded">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-eye fa-2xl"></i>                        
                        <h5 class="card-title">My Bookings</h5>
                        <p class="card-text">Check the status of your cab bookings.</p>
                        <a href="bookingDetails.jsp" class="btn btn-success">View Bookings</a>
                    </div>
                </div>
            </div>

            <!-- Billing -->
            <div class="col-md-4">
                <div class="p-4 bg-white shadow rounded">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-file-invoice fa-2xl"></i>
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
                <div class="p-4 bg-white shadow rounded">
                    <div class="card-body text-center">
                        <i class="fa-brands fa-hire-a-helper fa-2xl"></i>
                        <h5 class="card-title">Help & Support</h5>
                        <p class="card-text">Need assistance? Find help here.</p>
                        <a href="help.jsp" class="btn btn-info">Get Help</a>
                    </div>
                </div>
            </div>

            <!-- Logout -->
            <div class="col-md-6">
                <div class="p-4 bg-white shadow rounded">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-arrow-right-from-bracket fa-2xl"></i>
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Sign out of your account securely.</p>
                        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
            <div class="accordion-item card text-center card- card-footer text-muted p-5" style="margin-top: 100px">
                <h2 class="accordion-header card-body card-title">
                        📞 Contact Support
                </h2>
                    <li>📧 Email: support@megacitycab.com</li>
                    <li>📞 Phone: +94 112 687 189</li>
                    <li>🏢 Visit: Mega City Cab, Colombo 01, Sri Lanka</li>
            </div>
    
        <%@include file="component/footer.jsp" %>
        
    </body>
</html>
