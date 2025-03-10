<%-- 
    Document   : driverManagement
    Created on : Feb 22, 2025, 12:38:54 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please login first");
    }

    String userRole = (String) sessionObj.getAttribute("userRole"); // "customer" or "manager"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <title>Available Drivers</title>
        
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body>
        
        <%@include file="component/navabr.jsp" %>
        
        <div class="container mt-4">
        <h2 class="text-center">Available Drivers</h2>
        <p class="text-center text-muted">View the available drivers in Mega City Cab.</p>

        <% if ("manager".equals(userRole)) { %>
            <div class="text-end">
                <a href="addDriver.jsp" class="btn btn-primary">+ Add New Driver</a>
            </div>
        <% } %>
        
        <table class="table table-bordered table-hover mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Driver ID</th>
                    <th>Name</th>
                    <th>License Number</th>
                    <th>Experience</th>
                    <th>Contact</th>
                    <th>Availability</th>
                    <% if ("manager".equals(userRole)) { %>
                        <th>Actions</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "password");

                        String query = "SELECT id, name, license_number, experience, contact, availability FROM drivers";
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("license_number") %></td>
                    <td><%= rs.getInt("experience") %> years</td>
                    <td><%= rs.getString("contact") %></td>
                    <td>
                        <% if (rs.getString("availability").equals("Available")) { %>
                            <span class="badge bg-success">Available</span>
                        <% } else { %>
                            <span class="badge bg-danger">Unavailable</span>
                        <% } %>
                    </td>
                    <% if ("manager".equals(userRole)) { %>
                        <td>
                            <a href="editDriver.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="deleteDriverServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this driver?')">Delete</a>
                        </td>
                    <% } %>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
            
        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
            <%@include file="component/footer.jsp"%> 
</body>
</html>
