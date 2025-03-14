import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("manage_customers.jsp?error=Invalid ID");
            return;
        }

        int customerId = Integer.parseInt(idParam);

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab", "root", "admin");

            // SQL Query to delete customer
            PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id = ?");
            ps.setInt(1, customerId);
            int rowsAffected = ps.executeUpdate();
            
            con.close();

            if (rowsAffected > 0) {
                response.sendRedirect("manage_customers.jsp?message=Customer Deleted Successfully");
            } else {
                response.sendRedirect("manage_customers.jsp?error=Customer Not Found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_customers.jsp?error=Error Occurred");
        }
    }
}