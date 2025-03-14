<%-- 
    Document   : manage_bookings
    Created on : Mar 1, 2025, 10:42:50 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings | Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <%@include file="component/allCss.jsp"%>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 1000px;
            margin-top: 40px;
        }
        table {
            border-radius: 8px;
            overflow: hidden;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Manage Bookings</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center text-primary mb-4">All Customer Bookings</h2>

        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup</th>
                        <th>Destination</th>
                        <th>Fare (LKR)</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                
                <%
                    // Database Connection & Query Execution
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");
                         PreparedStatement stmt = con.prepareStatement("SELECT b.id, c.name, b.pickup, b.destination, b.fare, b.status FROM Bookings b JOIN Customers c ON b.customer_id = c.id");
                         ResultSet rs = stmt.executeQuery()) {

                        while (rs.next()) {
                %>
                
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("pickup") %></td>
                    <td><%= rs.getString("destination") %></td>
                    <td><%= rs.getDouble("fare") %></td>
                    <td>
                        <span class="badge bg-<%= rs.getString("status").equals("Pending") ? "warning" : rs.getString("status").equals("Confirmed") ? "success" : "secondary" %>">
                            <%= rs.getString("status") %>
                        </span>
                    </td>
                    <td>
                        <!-- Update Booking Status -->
                        <form action="UpdateBookingServlet" method="post" class="d-inline">
                            <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                            <select name="status" class="form-select form-select-sm d-inline w-auto">
                                <option value="Pending" <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Confirmed" <%= rs.getString("status").equals("Confirmed") ? "selected" : "" %>>Confirmed</option>
                                <option value="Completed" <%= rs.getString("status").equals("Completed") ? "selected" : "" %>>Completed</option>
                            </select>
                            <button type="submit" class="btn btn-primary btn-sm">
                                <i class="fa-solid fa-check"></i> Update
                            </button>
                        </form>

                        <!-- Delete Booking -->
                        <a href="DeleteBookingServlet?bookingId=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to cancel this booking?')">
                            <i class="fa-solid fa-trash"></i> Cancel
                        </a>
                    </td>
                </tr>
                
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger text-center'>Error fetching bookings</td></tr>");
                        e.printStackTrace();
                    }
                %>
                
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="component/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
