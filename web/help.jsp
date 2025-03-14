<%-- 
    Document   : help
    Created on : Feb 22, 2025, 12:39:44 PM
    Author     : njaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Help & Support | Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <%@include file="component/allCss.jsp"%>

    <style>
        .accordion-button {
            font-weight: bold;
            font-size: 1.1rem;
        }
        .accordion-body ul {
            padding-left: 20px;
        }
        .accordion-body ul li {
            margin-bottom: 8px;
        }
        .contact-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <%@include file="component/navbar.jsp" %>

    <div class="container mt-5">
        <h2 class="text-center text-primary">Help & Support</h2>
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
                            <li>New users must register by providing their <strong>name, address, NIC, and contact details</strong>.</li>
                            <li>Use your registered <strong>email and password</strong> to log in.</li>
                            <li>If you <strong>forget your password</strong>, use the "Forgot Password" option.</li>
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
                            <li>Go to the <strong>"Book a Cab"</strong> page.</li>
                            <li>Select <strong>pickup location, destination, date, and time</strong>.</li>
                            <li>Choose your preferred <strong>car type</strong> and <strong>driver</strong>.</li>
                            <li>Confirm the booking, and you will receive a <strong>booking number</strong>.</li>
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
                            <li>The fare is calculated based on <strong>distance, vehicle type, and any discounts</strong>.</li>
                            <li>Customers can pay via <strong>Cash, Credit Card, or Online Payment</strong>.</li>
                            <li>View your past bills in the <strong>"My Bookings"</strong> section.</li>
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
                            <li>Managers can <strong>add, update, and remove cars</strong>.</li>
                            <li>Drivers can be <strong>assigned to bookings</strong>.</li>
                            <li>Track car availability and <strong>update vehicle status</strong>.</li>
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
                        <div class="contact-section text-center">
                            <p class="fw-bold">If you need further help, contact us:</p>
                            <ul class="list-unstyled">
                                <li>📧 <strong>Email:</strong> <a href="mailto:support@megacitycab.com">support@megacitycab.com</a></li>
                                <li>📞 <strong>Phone:</strong> <a href="tel:+94112687189">+94 112 687 189</a></li>
                                <li>🏢 <strong>Visit:</strong> Mega City Cab, Colombo 01, Sri Lanka</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <%@include file="component/footer.jsp" %>
</body>
</html>
