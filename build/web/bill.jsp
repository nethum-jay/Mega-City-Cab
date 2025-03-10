<%-- 
    Document   : bill
    Created on : Feb 22, 2025, 12:35:39 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please login first");
    }
    String userEmail = (String) sessionObj.getAttribute("userEmail");
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Billing Details</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%> 
       
    </head>
    <body>        
        
        <%@include file="component/navabr.jsp" %>
        
      <div class="container mt-4">
            <h2 class="text-center">Billing Details</h2>
            <p class="text-center text-muted">View your ride fares and payments.</p>

            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Booking ID</th>
                        <th>Pickup</th>
                        <th>Drop-off</th>
                        <th>Distance (km)</th>
                        <th>Base Fare</th>
                        <th>Tax</th>
                        <th>Discount</th>
                        <th>Total Fare</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

                            String query = "SELECT id, pickup, dropoff, distance, base_fare, tax, discount, total_fare FROM billing WHERE user_email = ?";
                            PreparedStatement pst = con.prepareStatement(query);
                            pst.setString(1, userEmail);
                            ResultSet rs = pst.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("pickup") %></td>
                        <td><%= rs.getString("dropoff") %></td>
                        <td><%= rs.getDouble("distance") %> km</td>
                        <td>$<%= rs.getDouble("base_fare") %></td>
                        <td>$<%= rs.getDouble("tax") %></td>
                        <td>$<%= rs.getDouble("discount") %></td>
                        <td><strong>$<%= rs.getDouble("total_fare") %></strong></td>
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

            <div class="text-center">
                <a href="index.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>
                <%@include file="component/footer.jsp" %>
    </body>
</html>
            
