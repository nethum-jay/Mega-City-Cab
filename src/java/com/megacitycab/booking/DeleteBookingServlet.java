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

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "admin");

            PreparedStatement stmt = con.prepareStatement("DELETE FROM Bookings WHERE id=?");
            stmt.setInt(1, bookingId);
            stmt.executeUpdate();
            
                    HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        String pickup = request.getParameter("pickup");
        String dropoff = request.getParameter("dropoff");
        String pickupTime = request.getParameter("pickupTime");
        String vehicleType = request.getParameter("vehicleType");
        String phone = request.getParameter("phone");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Insert booking details
            String query = "INSERT INTO bookings (user_email, pickup, dropoff, pickup_time, vehicle_type, phone) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, userEmail);
            pst.setString(2, pickup);
            pst.setString(3, dropoff);
            pst.setString(4, pickupTime);
            pst.setString(5, vehicleType);
            pst.setString(6, phone);
            pst.executeUpdate();

            con.close();
            response.sendRedirect("booking.jsp?message=Booking successful!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?message=Error processing booking.");
        }

            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manage_bookings.jsp");
    }
}