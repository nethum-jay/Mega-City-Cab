<%-- 
    Document   : delete_customer
    Created on : Mar 8, 2025, 10:52:44 AM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    // Validate Admin Session
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp?error=Please login first");
        return;
    }

    String customerId = request.getParameter("id");

    // Validate customer ID
    if (customerId == null || !customerId.matches("\\d+")) {
        response.sendRedirect("manage_customers.jsp?error=Invalid customer ID");
        return;
    }

    try {
        // Load Database Driver & Establish Connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "admin");
             PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id = ?")) {
            
            ps.setInt(1, Integer.parseInt(customerId));
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("manage_customers.jsp?msg=Customer deleted successfully");
            } else {
                response.sendRedirect("manage_customers.jsp?error=Customer not found");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("manage_customers.jsp?error=An unexpected error occurred while deleting the customer");
    }
%>
