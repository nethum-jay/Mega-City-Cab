<%-- 
    Document   : manage_customers
    Created on : Mar 1, 2025, 9:32:18 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp?error=Please login first");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Customers | Mega City Cab</title>

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
            <span class="navbar-brand">Manage Customers</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center text-primary mb-4">All Registered Customers</h2>

        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th> 
                        <th>Name</th> 
                        <th>Address</th> 
                        <th>NIC</th> 
                        <th>Phone</th> 
                        <th>Email</th> 
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                
                <%
                    // Database Connection & Query Execution
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "admin");
                         PreparedStatement pst = con.prepareStatement("SELECT id, name, address, nic, phone, email FROM customers");
                         ResultSet rs = pst.executeQuery()) {

                        while (rs.next()) {
                %>
                
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("nic") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <!-- Delete Customer -->
                        <a href="DeleteCustomerServlet?customerId=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this customer?');">
                            <i class="fa-solid fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger text-center'>Error fetching customer details.</td></tr>");
                        e.printStackTrace();
                    }
                %>
                
                </tbody>
            </table>
        </div
