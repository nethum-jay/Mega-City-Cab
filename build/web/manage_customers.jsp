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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Customers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@include file="component/allCss.jsp"%>     
</head>
<body>
    
    <%@include file="component/navabr.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center">Manage Customers</h2>

        <table class="table table-bordered table-hover">
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
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "admin");

                        String query = "SELECT id, name, address, nic, phone, email FROM customers";
                        pst = con.prepareStatement(query);
                        rs = pst.executeQuery();

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
                        <a href="delete_customer.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-center text-danger'>Error fetching customer details.</td></tr>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pst != null) pst.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <%@include file="component/footer.jsp" %>
    
</body>
</html>
