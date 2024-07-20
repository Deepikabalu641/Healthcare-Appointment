<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                overflow: auto;
                background: rgba(255, 255, 255, 0.7) url('images/w3.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow-y: auto;
                overflow-x: auto;
            }

            .main {
                z-index: 1;
                border-collapse: collapse;
                width: 100%;
                border: 2px solid #ddd;
                padding: 20px;
                font-weight: bold;
                background: rgba(255, 255, 255, 0.7);
                margin-top: 20px;
                text-align: center;
            }
            .navit{

                text-align: left;
                font-size: 2.2em;
                color: #c9302c; /* Change this to the desired color code */
                text-decoration: none; /* Optional: Remove the underline */

            }


            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            a {
                text-decoration: none;
                color: blue;
            }


            .navit {
                text-align: left;
                font-size: 2.2em;
                color: #c9302c;
                text-decoration: none;
            }

            nav {
                text-align: right;
                background-color: #ecf0f1;
                color: white;
                padding: 10px;
            }
            .navi{
                text-align: right;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: space-around;
            }

            nav a {
                color: blue;
                text-decoration: none;
                padding: 10px;
                transition: background-color 0.3s;
            }

            nav a:hover {
                background-color: #6c757d;
            }

            section {
                padding: 20px;
            }

            .dashboard-section {
                background-color: white;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            a:hover {
                color: #4cae4c;
            }

            .w3-header-top-right {
                display: flex;
                justify-content: flex-end;
            }

            .email-right,
            .w3-header-top-right-text {
                margin-right: 20px;
            }
            .logo img {
                width: 7%;
                border-radius: 50%;
            }

            .logo h2 {
                font-size: 1.15rem;
                font-weight: 600;
                margin-left: 15px;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <center>
                <h1><div class="logo">
                        <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                </h1>
            </center>
            <div class="navit">
                <a href="index.html" >Home</a></div>

            <div class="w3-header-top-right">
                <div class="email-right">
                    <p><span class="fa fa-envelope" aria-hidden="true"></span> Email Id:<a href="mailto:mail@example.com" class="info"> bjsinfo@gmail.com</a></p>
                </div>
                <div class="w3-header-top-right-text">
                    <p><span class="fa fa-phone" aria-hidden="true"></span>Call Us:<a href="+91 7010898540">+91 7010898540</a></p>
                </div>
            </div>

            <%
                String user = (String) session.getAttribute("user");
                out.println(user);
            %>

            <nav>
                <ul>
                    <li><a href="patientview.jsp">Profile</a></li>
                    <li><a href="appointment.jsp">Book Appointment</a></li>
                    <li><a href="doctor_Approval.jsp"> Doctor Approval</a></li>
                    <li><a href="uploadfile.jsp">Upload File</a></li>
                    <li><a href="medical_Report.jsp"> Medical Records</a></li>
                    <li><a href="paymentReport.jsp">Payment</a></li>
                    <li><a href="order_medicine.jsp">Order Medicine</a></li>
                    <li><a href="track_Medicine.jsp">Track Medicine</a></li>
                    <li><a href="index.html" onclick="logout()">Logout</a></li>
                </ul>
            </nav><br>

            <main>
                <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;

                    Blob image = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

                    st = con.createStatement();

                    String sql = "select * from  payment where customer_name='" + user + "'";

                    rs = st.executeQuery(sql);
                %>

                <table border="2" cellpadding="20">
                    <tr>
                        <td>Patient ID</td>
                        <td>Patient NAME</td>
                        <td>Medicine Name</td>
                        <td>Price </td>
                        <td>Status</td>



                    </tr>



                    <%
                        while (rs.next()) {


                    %>

                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(7)%></td>




                    </tr>
                    <%
                        }
                    %>

                </table>

                <br><br><br><br><br><br><br>
                </div>

                <script>
                    function logout() {
                        // Add code to perform logout actions (e.g., clear session, redirect to login page)
                        alert("Logging out...");
                        // Replace the alert with actual logout logic
                        // For example, clearing session data and redirecting to the login page
                        sessionStorage.clear();
                        window.location.href = "patient_login.html";
                    }
                </script>

                </body>

                </html>
