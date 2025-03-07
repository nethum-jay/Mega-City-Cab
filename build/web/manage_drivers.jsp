<%-- 
    Document   : manage_drivers
    Created on : Mar 7, 2025, 6:58:10 AM
    Author     : njaya
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<!DOCTYPE html>

<html>
<head>
    <title>Manage Drivers - Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Manage Drivers</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center">Driver Management</h2>

        <%-- Display Drivers from Database --%>
        <table class="table table-bordered mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th><th>Name</th><th>Phone</th><th>License No</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mega_city_cab", "root", "password");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM Drivers");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("license_no") %></td>
                    <td>
                        <a href="edit_driver.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteDriverServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
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

        <%-- Add New Driver Form --%>
        <h3 class="mt-4">Add New Driver</h3>
        <form action="AddDriverServlet" method="post" class="border p-3">
            <div class="mb-3">
                <label>Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Phone:</label>
                <input type="text" name="phone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>License Number:</label>
                <input type="text" name="license_no" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Driver</button>
        </form>
    </div>
</body>
</html>
