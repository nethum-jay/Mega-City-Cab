 <%-- 
    Document   : register
    Created on : Feb 21, 2025, 11:10:36 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
        
        <%@include file="component/allCss.jsp"%>
        
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
       

       

    </head>
    <body class="bg-light"> 
        
        <%@include file="component/navabr.jsp" %> 
        
            <div class="container mt-5">
                    <h2 class="text-center">Customer Registration</h2>
                    <form action="CustomerRegistrationServlet" method="post" class="p-4 bg-white shadow rounded">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" class="form-control" placeholder="Address" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">NIC (National ID)</label>
                            <input type="text" name="nic" class="form-control" placeholder="NIC" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="text" name="phone" class="form-control" placeholder="Phone Number" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                        </div>
                    </form>
                </div>
            
        <%--<%@include file="component/footer.jsp"%>--%>
    </body>
</html>
