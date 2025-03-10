package com.megacitycab.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        String pickup = request.getParameter("pickup");
        String dropoff = request.getParameter("dropoff");
        double distance = Double.parseDouble(request.getParameter("distance"));
        
        // Pricing Calculation
        double baseFare = distance * 1.5; // $1.5 per km
        double tax = baseFare * 0.10; // 10% tax
        double discount = (distance > 10) ? baseFare * 0.05 : 0; // 5% discount for long trips
        double totalFare = baseFare + tax - discount;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

            String query = "INSERT INTO billing (user_email, pickup, dropoff, distance, base_fare, tax, discount, total_fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, userEmail);
            pst.setString(2, pickup);
            pst.setString(3, dropoff);
            pst.setDouble(4, distance);
            pst.setDouble(5, baseFare);
            pst.setDouble(6, tax);
            pst.setDouble(7, discount);
            pst.setDouble(8, totalFare);

            int rowsInserted = pst.executeUpdate();
            con.close();

            if (rowsInserted > 0) {
                response.sendRedirect("bill.jsp?message=Bill generated successfully");
            } else {
                response.sendRedirect("bill.jsp?error=Failed to generate bill");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

