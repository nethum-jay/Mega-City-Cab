package com.megacitycab.driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("manage_drivers.jsp?error=Please login first");
            return;
        }
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("license_number");
        int experience = Integer.parseInt(request.getParameter("experience"));
        String contact = request.getParameter("contact");
        String availability = request.getParameter("availability");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

            String query = "INSERT INTO drivers (name, license_number, experience, contact, availability) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, licenseNumber);
            pst.setInt(3, experience);
            pst.setString(4, contact);
            pst.setString(5, availability);
            pst.executeUpdate();

            con.close();
            response.sendRedirect("manage_drivers.jsp?message=Driver added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_drivers.jsp?message=Error adding driver.");
        }
    }
}