<%-- 
    Document   : addContact.jsp
    Created on : Feb 21, 2025, 11:09:28 PM
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
    String userEmail = (String) sessionObj.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
</head>
<body>
    <%@ include file="component/navbar.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center">My Bookings 📅</h2>
        <p class="text-center text-muted">View your past and upcoming bookings.</p>

        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup</th>
                    <th>Drop-off</th>
                    <th>Pickup Time</th>
                    <th>Vehicle Type</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");
                        String query = "SELECT id, pickup, dropoff, pickup_time, vehicle_type, status FROM bookings WHERE user_email = ? ORDER BY pickup_time DESC";
                        PreparedStatement pst = con.prepareStatement(query);
                        pst.setString(1, userEmail);
                        ResultSet rs = pst.executeQuery();
                        
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("pickup") %></td>
                    <td><%= rs.getString("dropoff") %></td>
                    <td><%= rs.getString("pickup_time") %></td>
                    <td><%= rs.getString("vehicle_type") %></td>
                    <td>
                        <% 
                            String status = rs.getString("status");
                            if ("Completed".equals(status)) { 
                        %>
                            <span class="badge bg-success">Completed</span>
                        <% } else if ("Upcoming".equals(status)) { %>
                            <span class="badge bg-primary">Upcoming</span>
                        <% } else { %>
                            <span class="badge bg-danger">Canceled</span>
                        <% } %>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        pst.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <%@ include file="component/footer.jsp" %>
</body>
</html>
