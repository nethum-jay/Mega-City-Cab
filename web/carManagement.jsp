<%-- 
    Document   : carManagement
    Created on : Feb 22, 2025, 12:37:20 PM
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
        <title>Available Cars</title>
        
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body>
        
        <%@include file="component/navabr.jsp" %>
        <div class="container mt-4">
        <h2 Class="text-center">🚖 Available Cars</h2>
        <p class="text-center text-muted">Here is a list of available cars for booking.</p>

        <% if ("manager".equals(userRole)) { %>
            <div class="text-end">
                <a href="addCar.jsp" class="btn btn-primary">+ Add New Car</a>
            </div>
        <% } %>

        <table class="table table-bordered table-hover mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Car ID</th>
                    <th>Model</th>
                    <th>Type</th>
                    <th>Number Plate</th>
                    <th>Capacity</th>
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

                        String query = "SELECT id, model, type, number_plate, capacity, availability FROM cars";
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td><%= rs.getString("type") %></td>
                    <td><%= rs.getString("number_plate") %></td>
                    <td><%= rs.getInt("capacity") %> passengers</td>
                    <td>
                        <% if (rs.getString("availability").equals("Available")) { %>
                            <span class="badge bg-success">Available</span>
                        <% } else { %>
                            <span class="badge bg-danger">Unavailable</span>
                        <% } %>
                    </td>
                    <% if ("manager".equals(userRole)) { %>
                        <td>
                            <a href="editCar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="deleteCarServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this car?')">Delete</a>
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
            <a href="index.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>