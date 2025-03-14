<%-- 
    Document   : index
    Created on : Feb 21, 2025, 9:16:46 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard | Mega City Cab</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <%@include file="component/allCss.jsp"%>
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            margin-top: 50px;
        }
        .card-custom {
            transition: transform 0.3s ease-in-out;
        }
        .card-custom:hover {
            transform: scale(1.05);
        }
        .footer-section {
            background: #343a40;
            color: white;
            padding: 20px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <%@include file="component/navbar.jsp" %>

    <div class="container dashboard-container text-center">
        <h1 class="mt-4 text-primary">Welcome to Mega City Cab</h1>
        <p class="text-muted">Use the navigation options below to access system features.</p>


        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card card-custom p-3 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-taxi fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Book a Cab</h5>
                        <p class="card-text">Reserve your ride in a few clicks.</p>
                        <a href="booking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-custom p-3 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-calendar-check fa-3x text-success mb-3"></i>
                        <h5 class="card-title">My Bookings</h5>
                        <p class="card-text">Check your booking status and details.</p>
                        <a href="bookingDetails.jsp" class="btn btn-success">View Bookings</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-custom p-3 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-file-invoice-dollar fa-3x text-warning mb-3"></i>
                        <h5 class="card-title">Billing</h5>
                        <p class="card-text">View and print your ride invoices.</p>
                        <a href="bill.jsp" class="btn btn-warning">View Bill</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card card-custom p-3 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-circle-info fa-3x text-info mb-3"></i>
                        <h5 class="card-title">Help & Support</h5>
                        <p class="card-text">Need assistance? Find help here.</p>
                        <a href="help.jsp" class="btn btn-info">Get Help</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card card-custom p-3 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-sign-out-alt fa-3x text-danger mb-3"></i>
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Sign out of your account securely.</p>
                        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-section text-center mt-5">
            <h5 class="mb-3">📞 Contact Support</h5>
            <p><i class="fa-solid fa-envelope"></i> Email: support@megacitycab.com</p>
            <p><i class="fa-solid fa-phone"></i> Phone: +94 112 687 189</p>
            <p><i class="fa-solid fa-map-marker-alt"></i> Visit: Mega City Cab, Colombo 01, Sri Lanka</p>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@include file="component/footer.jsp" %>

</body>
</html>