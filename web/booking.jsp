<%-- 
    Document   : viewContact
    Created on : Feb 21, 2025, 11:11:11 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please+login+first");
        return;
    }
    String userEmail = (String) sessionObj.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Cab - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container, .booking-container {
            margin-top: 50px;
        }
        .shadow-rounded {
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <%@ include file="component/navbar.jsp" %>

    <div class="container booking-container">
        <h2 class="text-center mb-4">Book a Cab 🚖</h2>
        <p class="text-center text-muted">Fill in the details below to book your ride.</p>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <% String message = request.getParameter("message"); %>
                <% if (message != null) { %>
                    <p class="text-success text-center"><%= message %></p>
                <% } %>

                <form action="BookingServlet" method="post" class="p-4 bg-white shadow-rounded">
                    <div class="mb-3">
                        <label class="form-label" for="pickup">Pickup Location</label>
                        <input type="text" id="pickup" name="pickup" class="form-control" placeholder="Enter pickup location" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="dropoff">Drop-off Location</label>
                        <input type="text" id="dropoff" name="dropoff" class="form-control" placeholder="Enter drop-off location" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="pickupTime">Pickup Date &amp; Time</label>
                        <input type="datetime-local" id="pickupTime" name="pickupTime" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="vehicleType">Vehicle Type</label>
                        <select id="vehicleType" name="vehicleType" class="form-control">
                            <option value="Mini_Car">Mini Car</option>
                            <option value="Hatchback_Car">Hatchback Car</option>
                            <option value="Premium_Car">Premium Car</option>
                            <option value="Van">Van</option>
                            <option value="Mini_Bus">Mini Bus</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-secondary w-100">Book Now</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="component/footer.jsp" %>
</body>
</html>