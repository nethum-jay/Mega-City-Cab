 <%-- 
    Document   : register
    Created on : Feb 21, 2025, 11:10:36 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Registration | Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>

    <!-- Custom Styles -->
    <style>
        .register-container {
            max-width: 450px;
            margin: auto;
            margin-top: 50px;
        }
        .form-control {
            padding-left: 40px;
        }
        .input-group-text {
            background: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light"> 
    
    <%@include file="component/navbar.jsp" %> 

    <div class="container">
        <div class="register-container p-4 bg-white shadow rounded">
            <h2 class="text-center text-primary">Customer Registration</h2>

            <%-- Display error message if registration fails --%>
            <% String error = request.getParameter("error"); %>
            <% if (error != null) { %>
                <div class="alert alert-danger text-center"><%= error %></div>
            <% } %>

            <form action="CustomerRegistrationServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-house-door"></i></span>
                        <input type="text" name="address" class="form-control" placeholder="Address" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">NIC (National ID)</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-credit-card"></i></span>
                        <input type="text" name="nic" class="form-control" placeholder="NIC" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                        <input type="text" name="phone" class="form-control" placeholder="Phone Number" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                        <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer;">
                            <i class="bi bi-eye-slash" id="togglePasswordIcon"></i>
                        </span>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary w-100">Register</button>
                </div>
            </form>

            <p class="text-center mt-3">Already have an account? <a href="customer_login.jsp">Login</a></p>
        </div>
    </div>

    <%@include file="component/footer.jsp"%> 

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Password Toggle Script -->
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            var icon = document.getElementById("togglePasswordIcon");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            } else {
                passwordField.type = "password";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            }
        }
    </script>

</body>
</html>
