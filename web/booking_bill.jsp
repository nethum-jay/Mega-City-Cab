<%-- 
    Document   : booking_bill
    Created on : Mar 11, 2025, 9:40:44 PM
    Author     : njaya
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%

    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please+login+first");
        return;
    }
    String userEmail = (String) sessionObj.getAttribute("userEmail");
    double grandTotal = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Bill Summary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%@ include file="component/allCss.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
    </style>
    <script>
        function printBill() {
            window.print();
        }
    </script>
</head>
<body class="container mt-4">
    <%@ include file="component/navbar.jsp" %>

    <h2 class="text-center">Booking Details Bill</h2>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Booking ID</th>
                <th>Pickup</th>
                <th>Drop-off</th>
                <th>Driver</th>
                <th>Car</th>
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
                    
                    String query = "SELECT b.id, b.pickup, b.dropoff, d.name AS driver, c.model AS car, b.distance " +
                                   "FROM billing b " +
                                   "JOIN booking bk ON b.booking_id = bk.id " +
                                   "JOIN driver d ON bk.driver_id = d.driver_id " +
                                   "JOIN car c ON bk.car_id = c.car_id " +
                                   "WHERE b.user_email = ?";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, userEmail);
                    ResultSet rs = pst.executeQuery();
                    
                    while (rs.next()) {
                        int bookingId = rs.getInt("id");
                        double distance = rs.getDouble("distance");
                        
                        
                        double baseFare = distance * 2.0;  
                        double tax = baseFare * 0.15;      
                        double discount = (distance > 15) ? baseFare * 0.10 : 0; 
                        double totalFare = baseFare + tax - discount;
                        grandTotal += totalFare;
            %>
            <tr>
                <td><%= bookingId %></td>
                <td><%= rs.getString("pickup") %></td>
                <td><%= rs.getString("dropoff") %></td>
                <td><%= rs.getString("driver") %></td>
                <td><%= rs.getString("car") %></td>
                <td><%= String.format("%.2f", distance) %> km</td>
                <td>LKR<%= String.format("%.2f", baseFare) %></td>
                <td>LKR<%= String.format("%.2f", tax) %></td>
                <td>LKR<%= String.format("%.2f", discount) %></td>
                <td><strong>LKR<%= String.format("%.2f", totalFare) %></strong></td>
            </tr>
            <%
                    }
                    rs.close();
                    pst.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
        <tfoot>
            <tr class="table-info">
                <td colspan="9" class="text-end"><strong>Grand Total:</strong></td>
                <td><strong>LKR<%= String.format("%.2f", grandTotal) %></strong></td>
            </tr>
        </tfoot>
    </table>

    <div class="text-center my-3">
        <button class="btn btn-primary" onclick="printBill()">Print Bill</button>
        <a href="index.jsp" class="btn btn-secondary">Back</a>
    </div>

    <%@ include file="component/footer.jsp" %>
</body>
</html>