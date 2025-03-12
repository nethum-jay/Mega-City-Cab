<%-- 
    Document   : manage_drivers
    Created on : Mar 7, 2025, 6:58:10 AM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Drivers - Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>
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
        
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%-- Add New Driver Form --%>
                <h3 class="mt-4">Add New Driver</h3>
                <form action="DriverServlet" method="post" class="p-4 bg-white shadow rounded">
                    <div class="mb-3">
                        <label class="form-label">Name:</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">License Number:</label>
                        <input type="text" name="license_no" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Experience (Years):</label>
                        <input type="number" name="experience" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contact:</label>
                        <input type="text" name="contact" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Availability:</label>
                        <select name="availability" class="form-control" required>
                            <option value="Available">Available</option>
                            <option value="Unavailable">Unavailable</option>
                        </select>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Add Driver</button>
                    </div>
                </form>
            </div>
        </div>
    </div>