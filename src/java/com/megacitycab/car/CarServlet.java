package com.megacitycab.car;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String model = request.getParameter("model");
        String type = request.getParameter("type");
        String numberPlate = request.getParameter("numberPlate");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String availability = request.getParameter("availability");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

            String query = "INSERT INTO cars (model, type, number_plate, capacity, availability) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, model);
            pst.setString(2, type);
            pst.setString(3, numberPlate);
            pst.setInt(4, capacity);
            pst.setString(5, availability);
            pst.executeUpdate();

            con.close();
            response.sendRedirect("cars.jsp?message=Car added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cars.jsp?message=Error adding car.");
        }
    }
}