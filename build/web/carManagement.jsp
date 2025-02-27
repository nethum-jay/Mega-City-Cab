<%-- 
    Document   : carManagement
    Created on : Feb 22, 2025, 12:37:20 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
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

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Car ID</th>
                    <th>Model</th>
                    <th>Type</th>
                    <th>Capacity</th>
                    <th>Driver Name</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "password");

                        String query = "SELECT * FROM cars";
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td><%= rs.getString("type") %></td>
                    <td><%= rs.getInt("capacity") %> passengers</td>
                    <td><%= rs.getString("driver_name") %></td>
                    <td><%= rs.getString("status") %></td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="6" class="text-danger">Error retrieving car details.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
      <div class="text-center">
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</body>
</html>
