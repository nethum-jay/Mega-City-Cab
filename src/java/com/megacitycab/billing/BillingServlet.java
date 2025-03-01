package com.megacitycab.billing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        double distance = Double.parseDouble(request.getParameter("distance"));

        double baseFare = 5.0; 
        double perKmRate = 1.5; 
        double taxRate = 0.1; 
        double discount = distance > 10 ? 5.0 : 0.0; 
        
        double fare = baseFare + (distance * perKmRate);
        double tax = fare * taxRate;
        double totalFare = fare + tax - discount;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

            String query = "INSERT INTO billing (booking_id, user_email, distance, base_fare, tax, discount, total_fare) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, bookingId);
            pst.setString(2, userEmail);
            pst.setDouble(3, distance);
            pst.setDouble(4, baseFare);
            pst.setDouble(5, tax);
            pst.setDouble(6, discount);
            pst.setDouble(7, totalFare);
            pst.executeUpdate();

            con.close();
            response.sendRedirect("bill.jsp?message=Billing completed!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bill.jsp?message=Error processing billing.");
        }
    }
}
