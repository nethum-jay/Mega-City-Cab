<%-- 
    Document   : manage_drivers
    Created on : Mar 7, 2025, 6:58:10 AM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp?error=Please+login+first");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers - Admin Panel</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <%@ include file="component/allCss.jsp" %>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
        }
        .form-container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-brand">Manage Drivers</span>
            <a href="admin_dashboard.jsp" class="btn btn-secondary">Back</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center text-primary">Driver Management</h2>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                    <h4 class="text-center mb-3"><i class="fa-solid fa-user-plus"></i> Add New Driver</h4>

                    <form action="DriverServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name:</label>
                            <input type="text" name="name" class="form-control form-control-lg" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Number:</label>
                            <input type="text" name="license_no" class="form-control form-control-lg" pattern="[A-Za-z0-9]{6,15}" 
                                   title="License number should be 6-15 alphanumeric characters" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Experience (years):</label>
                            <input type="number" name="experience" class="form-control form-control-lg" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contact:</label>
                            <input type="tel" name="contact" class="form-control form-control-lg" pattern="[0-9]{10}"
                                   placeholder="Enter 10-digit number" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Availability:</label>
                            <select name="availability" class="form-select form-control-lg" required>
                                <option value="Available">Available</option>
                                <option value="Unavailable">Unavailable</option>
                            </select>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-success btn-lg"><i class="fa-solid fa-plus"></i> Add Driver</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="component/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
