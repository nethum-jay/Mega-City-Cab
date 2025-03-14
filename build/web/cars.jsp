<%-- 
    Document   : carManagement
    Created on : Feb 22, 2025, 12:37:20 PM
    Author     : njaya
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    // Validate user session
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please+login+first");
        return;
    }

    String userRole = (String) sessionObj.getAttribute("userRole"); // "customer" or "manager"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Cars | Mega City Cab</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <%@include file="component/allCss.jsp"%>
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            transition: 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.02);
        }
    </style>

    <script>
        function confirmDelete(carId) {
            return confirm("Are you sure you want to delete this car (ID: " + carId + ")?");
        }
    </script>

</head>
<body>

    <%@include file="component/navbar.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center">🚖 Available Cars</h2>
        <p class="text-center text-muted">Explore the available cars in the Mega City Cab fleet.</p>

        <% if ("manager".equals(userRole)) { %>
            <div class="text-end">
                <a href="addCar.jsp" class="btn btn-primary"><i class="fa fa-plus"></i> Add New Car</a>
            </div>
        <% } %>

        <div class="row mt-3">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin")) {

                        String query = "SELECT id, model, type, number_plate, capacity, availability FROM cars";
                        try (PreparedStatement pst = con.prepareStatement(query);
                             ResultSet rs = pst.executeQuery()) {

                            if (!rs.isBeforeFirst()) {
            %>
                                <div class="alert alert-warning text-center">No cars available at the moment.</div>
            <%
                            }

                            while (rs.next()) {
            %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fa fa-car"></i> <%= rs.getString("model") %></h5>
                            <p class="card-text">
                                <strong>Type:</strong> <%= rs.getString("type") %><br>
                                <strong>Number Plate:</strong> <%= rs.getString("number_plate") %><br>
                                <strong>Capacity:</strong> <%= rs.getInt("capacity") %> passengers<br>
                                <strong>Availability:</strong>
                                <% if ("Available".equals(rs.getString("availability"))) { %>
                                    <span class="badge bg-success">Available</span>
                                <% } else { %>
                                    <span class="badge bg-danger">Unavailable</span>
                                <% } %>
                            </p>
                            
                            <% if ("manager".equals(userRole)) { %>
                                <div class="d-flex justify-content-between">
                                    <a href="editCar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">
                                        <i class="fa fa-edit"></i> Edit
                                    </a>
                                    <a href="deleteCarServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" 
                                       onclick="return confirmDelete(<%= rs.getInt("id") %>)">
                                        <i class="fa fa-trash"></i> Delete
                                    </a>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            <%
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                <div class="alert alert-danger text-center">An error occurred while fetching data. Please try again later.</div>
            <%
                }
            %>
        </div>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary"><i class="fa fa-home"></i> Back to Dashboard</a>
        </div>

    </div>

    <%@include file="component/footer.jsp" %>

</body>
</html>
