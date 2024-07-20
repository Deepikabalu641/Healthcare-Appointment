<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
                <link rel="stylesheet" type="text/css" href="css/basic.css">
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

                    String sql = "select * from  uploadfile where uname='" + user + "'";

                    rs = st.executeQuery(sql);
                %>

                <table border="2" cellpadding="20">
                    <tr>
                        <td>Patient ID</td>
                        <td>Patient NAME</td>
                        <td>Doctor</td>
                        <td>Report </td>



                    </tr>



                    <%
                        while (rs.next()) {


                    %>

                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><a href="download_Report.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></td>






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
