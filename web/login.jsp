<%-- 
    Document   : login
    Created on : Feb 21, 2025, 11:10:14 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Login</title>
        
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
       
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body class="bg-light">
        
        <%@include file="component/navabr.jsp" %> 
        
            <div class="container mt-5">
                <h2 class="text-center">Customer Login</h2>
                
                <% String error = request.getParameter("error"); %>
                <% if (error != null) { %>
                    <p class="text-danger text-center"><%= error %></p>
                <% } %>
                
                <form action="LoginServlet" method="post" class="p-4 bg-white shadow rounded">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
                <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register</a></p>
            </div>
                
        <%@include file="component/footer.jsp"%>  
        
    </body>
</html>
