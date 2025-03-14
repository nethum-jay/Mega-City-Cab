<%-- 
    Document   : driverManagement
    Created on : Feb 22, 2025, 12:38:54 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    // Validate session and ensure user is logged in
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please+login+first");
        return;
    }
    String userEmail = (String) sessionObj.getAttribute("userEmail");
    // Retrieve user role from session for authorization check
    String userRole = (String) sessionObj.getAttribute("userRole");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Drivers | Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
</head>
<body>
    <%@ include file="component/navbar.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center">🚖 Available Drivers</h2>
        <p class="text-center text-muted">View the available drivers in the Mega City Cab fleet.</p>

        <% if ("manager".equals(userRole)) { %>
            <div class="text-end mb-3">
                <a href="addDriver.jsp" class="btn btn-primary"><i class="fa fa-plus"></i> Add New Driver</a>
            </div>
        <% } %>

        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
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
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");
                        
                        String query = "SELECT id, name, license_number, experience, contact, availability FROM drivers";
                        pst = con.prepareStatement(query);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("license_number") %></td>
                    <td><%= rs.getInt("experience") %> years</td>
                    <td><%= rs.getString("contact") %></td>
                    <td>
                        <% if ("Available".equals(rs.getString("availability"))) { %>
                            <span class="badge bg-success">Available</span>
                        <% } else { %>
                            <span class="badge bg-danger">Unavailable</span>
                        <% } %>
                    </td>
                    <% if ("manager".equals(userRole)) { %>
                    <td>
                        <a href="editDriver.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">
                            <i class="fa fa-edit"></i> Edit
                        </a>
                        <a href="DeleteDriverServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this driver?');">
                            <i class="fa fa-trash"></i> Delete
                        </a>
                    </td>
                    <% } %>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary"><i class="fa fa-home"></i> Back to Dashboard</a>
        </div>
    </div>

    <%@ include file="component/footer.jsp" %>
</body>
</html>
