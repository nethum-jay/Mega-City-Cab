package com.megacitycab.customer;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");


        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("manage_customers.jsp?error=Invalid+ID");
            return;
        }

        int customerId;
        try {
            customerId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("manage_customers.jsp?error=Invalid+Customer+ID");
            return;
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/megacitycab";
        String dbUser = "root";
        String dbPassword = "admin";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                 PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id = ?")) {

                ps.setInt(1, customerId);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("manage_customers.jsp?message=Customer+Deleted+Successfully");
                } else {
                    response.sendRedirect("manage_customers.jsp?error=Customer+Not+Found");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("manage_customers.jsp?error=JDBC+Driver+Not+Found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("manage_customers.jsp?error=Database+Error");
        }
    }
}
