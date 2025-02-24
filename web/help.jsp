<%-- 
    Document   : help
    Created on : Feb 22, 2025, 12:39:44 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <%@include file="component/allCss.jsp"%>
        
    </head>
    <body>
        
        <%@include file="component/navabr.jsp" %>
        
        <div class="container mt-4">
        <h2 class="text-center">Help & Support</h2>
        <p class="text-center text-muted">Need assistance? Find answers below.</p>

        <div class="accordion" id="helpAccordion">
            <%-- Section 1: User Registration & Login --%>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#registerLogin">
                        📝 Register & Login
                    </button>
                </h2>
                <div id="registerLogin" class="accordion-collapse collapse show" data-bs-parent="#helpAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li>New users must register by providing their **name, address, NIC, and contact details**.</li>
                            <li>Use your registered **email and password** to log in.</li>
                            <li>If you **forget your password**, use the "Forgot Password" option.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- Section 2: Booking a Cab --%>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#booking">
                        🚖 Booking a Cab
                    </button>
                </h2>
                <div id="booking" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li>Go to the **"Book a Cab"** page.</li>
                            <li>Select **pickup location, destination, date, and time**.</li>
                            <li>Choose your preferred **car type** and **driver**.</li>
                            <li>Confirm the booking, and you will receive a **booking number**.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- Section 3: Billing & Payments --%>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#billing">
                        💰 Billing & Payments
                    </button>
                </h2>
                <div id="billing" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li>The fare is calculated based on **distance, vehicle type, and any discounts**.</li>
                            <li>Customers can pay via **Cash, Credit Card, or Online Payment**.</li>
                            <li>View your past bills in the **"My Bookings"** section.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- Section 4: Managing Cars & Drivers (Manager) --%>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#management">
                        🛠 Managing Cars & Drivers (For Managers)
                    </button>
                </h2>
                <div id="management" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li>Managers can **add, update, and remove cars**.</li>
                            <li>Drivers can be **assigned to bookings**.</li>
                            <li>Track car availability and **update vehicle status**.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- Section 5: Contact Support --%>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#support">
                        📞 Contact Support
                    </button>
                </h2>
                <div id="support" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                    <div class="accordion-body">
                        <p>If you need further help, contact us:</p>
                        <ul>
                            <li>📧 Email: support@megacitycab.com</li>
                            <li>📞 Phone: +94 112 687 189</li>
                            <li>🏢 Visit: Mega City Cab, Colombo 01, Sri Lanka</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>