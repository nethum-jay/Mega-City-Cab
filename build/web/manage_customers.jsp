<%-- 
    Document   : manage_customers
    Created on : Mar 1, 2025, 9:32:18 PM
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Customers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>     
    
<body>
    
    <nav class="navbar navbar-dark bg-dark">
      <div class="container-fluid">
          <span class="navbar-brand">Manage Customers</span>
          <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
      </div>  
     </nav>
    
    <div class="container mt-4">
        <h2 class="text-center">Manage Customers</h2>
    
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th> <th>Name</th> <th>Address</th> <th>NIC</th> <th>Phone</th> <th>Email</th> <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "admin");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM customers");

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
                        <a href="delete_customer.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
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