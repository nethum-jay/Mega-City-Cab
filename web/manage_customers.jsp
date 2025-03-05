<%-- 
    Document   : manage_customers
    Created on : Mar 1, 2025, 9:32:18 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
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
                    <th>ID</th><th>Name</th><th>Phone</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Retrieve customers from database (Servlet needed) --%>
            </tbody>
        </table>
    </div>
</body>
</html>
