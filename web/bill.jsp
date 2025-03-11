<%-- 
    Document   : bill
    Created on : Feb 22, 2025, 12:35:39 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp?error=Please login first");
    }
    String userEmail = (String) sessionObj.getAttribute("userEmail");
    double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Bill Summary</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
            <%@include file="component/allCss.jsp"%>  
    <script>
        function printBill() {
            window.print();
        }
    </script>
</head>
   <%@include file="component/navabr.jsp" %>
<body class="container mt-4">

 
    <h2 class="text-center">Booking Details Bill</h2>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Booking ID</th><th>Pickup</th><th>Drop-off</th><th>Driver</th><th>Car</th>
                <th>Distance (km)</th><th>Base Fare</th><th>Tax</th><th>Discount</th><th>Total Fare</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");
                    PreparedStatement pst = con.prepareStatement("SELECT b.id, b.pickup, b.dropoff, d.name AS driver, c.model AS car, b.distance, b.base_fare, b.tax, b.discount, b.total_fare FROM billing b JOIN booking bk ON b.booking_id = bk.id JOIN driver d ON bk.driver_id = d.driver_id JOIN car c ON bk.car_id = c.car_id WHERE b.user_email = ?");
                    pst.setString(1, userEmail);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        double totalFare = rs.getDouble("total_fare");
                        grandTotal += totalFare;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("pickup") %></td>
                <td><%= rs.getString("dropoff") %></td>
                <td><%= rs.getString("driver") %></td>
                <td><%= rs.getString("car") %></td>
                <td><%= rs.getDouble("distance") %> km</td>
                <td>$<%= String.format("%.2f", rs.getDouble("base_fare")) %></td>
                <td>$<%= String.format("%.2f", rs.getDouble("tax")) %></td>
                <td>$<%= String.format("%.2f", rs.getDouble("discount")) %></td>
                <td><strong>$<%= String.format("%.2f", totalFare) %></strong></td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) { e.printStackTrace(); }
            %>
        </tbody>
        <tfoot>
            <tr class="table-info">
                <td colspan="9" class="text-end"><strong>Grand Total:</strong></td>
                <td><strong>$<%= String.format("%.2f", grandTotal) %></strong></td>
            </tr>
        </tfoot>
    </table>

    <div class="text-center">
        <button class="btn btn-primary" onclick="printBill()">Print Bill</button>
        <a href="index.jsp" class="btn btn-secondary">Back</a>
    </div>
            <%@include file="component/footer.jsp" %>

</body>
</html>
