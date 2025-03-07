<%-- 
    Document   : manage_customers
    Created on : Mar 1, 2025, 9:32:18 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Customers</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>   
    
    
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Manage Customers</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container mt-4">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th><th>Full Name</th><th>Address</th><th>NIC (National ID)</th><th>Phone Number</th><th>Email</th><th>Password</th>
                </tr>
            </thead>
            <tbody>                

                
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

                        String query = "SELECT name, address, nic, phone, email, password) VALUES (?, ?, ?, ?, ?, ?";
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                
                <tr>
                    <td><%= rs.getInt("name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("nic") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("password") %></td>
                    <td>
                        <% if (rs.getString("status").equals("Completed")) { %>
                            <span class="badge bg-success">Completed</span>
                        <% } else if (rs.getString("status").equals("Upcoming")) { %>
                            <span class="badge bg-primary">Upcoming</span>
                        <% } else { %>
                            <span class="badge bg-danger">Canceled</span>
                        <% } %>
                    </td>
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
    </div>
</body>
</html>
