<%-- 
    Document   : viewContact
    Created on : Feb 21, 2025, 11:11:11 PM
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
        <title>Book a Cab</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%>    
        
    </head>
    <body>
        <%@include file="component/navabr.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center">Book a Cab 🚖</h2>
        <p class="text-center text-muted">Fill in the details below to book your ride.</p>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                
                <% String message = request.getParameter("message"); %>
                <% if (message != null) { %>
                    <p class="text-success text-center"><%= message %></p>
                <% } %>

                <form action="BookingServlet" method="post" class="p-4 bg-white shadow rounded">
                    <div class="mb-3">
                        <label class="form-label">Pickup Location</label>
                        <input type="text" name="pickup" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Drop-off Location</label>
                        <input type="text" name="dropoff" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Pickup Date & Time</label>
                        <input type="datetime-local" name="pickupTime" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Vehicle Type</label>
                        <select name="vehicleType" class="form-control">
                            <option value="Mini_Car">Mini Car</option>
                            <option value="Hatchback_Car">Hatchback Car</option>                          
                            <option value="Premium_Car">Premium Car</option>                            
                            <option value="Van">Van</option>
                            <option value="Mini_Bus">Mini Bus</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                    
                     <div class="text-center">
                    <button type="submit" class="btn btn-secondary">Book Now</button>
                     </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
