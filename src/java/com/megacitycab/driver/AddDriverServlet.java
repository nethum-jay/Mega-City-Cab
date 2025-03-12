package com.megacitycab.servlets;

import com.megacitycab.utils.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddDriverServlet")
public class AddDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String licenseNo = request.getParameter("license_no");
        String experienceStr = request.getParameter("experience");
        String contact = request.getParameter("contact");
        String availability = request.getParameter("availability");

        try {
            int experience = Integer.parseInt(experienceStr); // Convert experience to integer

            // Get DB Connection
            Connection con = DBConnection.getConnection();
            
            // Insert Driver Details
            String query = "INSERT INTO drivers (name, license_number, experience, contact, availability) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, licenseNo);
            pstmt.setInt(3, experience);
            pstmt.setString(4, contact);
            pstmt.setString(5, availability);

            pstmt.executeUpdate();
            con.close();

            response.sendRedirect("manage_drivers.jsp?success=1"); // Redirect with success message
        } catch (NumberFormatException e) {
            response.sendRedirect("manage_drivers.jsp?error=Invalid experience format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_drivers.jsp?error=Database error");
        }
    }
}
