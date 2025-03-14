<%-- 
    Document   : delete_customer
    Created on : Mar 8, 2025, 10:52:44 AM
    Author     : njaya
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    String customerId = request.getParameter("id");

    if (customerId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "password");

            PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE customer_id = ?");
            ps.setInt(1, Integer.parseInt(customerId));
            int rowsAffected = ps.executeUpdate();

            con.close();

            if (rowsAffected > 0) {
                response.sendRedirect("manage_customers.jsp?msg=Customer deleted successfully");
            } else {
                response.sendRedirect("manage_customers.jsp?error=Customer not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_customers.jsp?error=Error deleting customer");
        }
    } else {
        response.sendRedirect("manage_customers.jsp?error=Invalid customer ID");
    }
%>
