<%-- 
    Document   : manage_bookings
    Created on : Mar 1, 2025, 10:42:50 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>


<html>
<head>
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
     <%@include file="component/allCss.jsp"%>    
     
</head>
<body>

    
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Manage Bookings</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>All Customer Bookings</h2>
        
        <table class="table table-bordered">
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
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT b.id, c.name, b.pickup, b.destination, b.fare, b.status FROM Bookings b JOIN Customers c ON b.id = c.id");

                        while (rs.next()) {
                %>
                
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("pickup") %></td>
                    <td><%= rs.getString("destination") %></td>
                    <td><%= rs.getDouble("fare") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <form action="UpdateBookingServlet" method="post" style="display:inline;">
                            <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                            <select name="status" class="form-select d-inline w-auto">
                                <option value="Pending" <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Confirmed" <%= rs.getString("status").equals("Confirmed") ? "selected" : "" %>>Confirmed</option>
                                <option value="Completed" <%= rs.getString("status").equals("Completed") ? "selected" : "" %>>Completed</option>
                            </select>
                            <button type="submit" class="btn btn-primary btn-sm">Update</button>
                        </form>
                        <a href="DeleteBookingServlet?bookingId=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Cancel</a>
                    </td>
                </tr>
                
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger'>Error fetching bookings</td></tr>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    }
                %>
                
            </tbody>
        </table>
    </div>
</body>
</html>
