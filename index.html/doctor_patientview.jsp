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
            <div class="main">
                <center>
                    <h1><div class="logo">
                            <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                    </h1>
                </center>

                <header>
                    <%
                        String user = (String) session.getAttribute("user");
                    %>
                    <h1> <a href="index.html">Welcome,[<%out.println(user);%>]!</a></h1>
                </header>

            <nav>
                <ul>
                    <li><a href="doctor_view.jsp">Profile</a></li>
                    <li><a href="appointment_view.jsp">Appointments</a></li>
                    <li><a href=" doctor_patientview.jsp">Patients Report</a></li>
                    <li><a href="upload_Prescription.jsp">Upload Prescription</a></li>

                    <li><a href="specialist_Discussion.jsp"> Specialist Discussion </a></li>
                    <li><a href="disscussion_Report.jsp"> Discussion Report </a></li>
                    <li><a href="#logout" onclick="logout()">Logout</a></li>
                </ul>

            </nav> 
                <main>

                    <%

                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        Blob image = null;

                        PreparedStatement pst;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

                        st = con.createStatement();

                        String sql = "select * from  uploadfile where donctor_name='" + user + "'  ";

                        rs = st.executeQuery(sql);
                    %>
                    <form action="appointment_getregister.jsp" method="post">
                        <table border="1" cellpadding="20">
                            <tr>

                                <td>Patient ID</td>
                                <td>Patient NAME</td>
                                <td>Doctor Name</td>
                                <td>Patient Report</td>
                                <td>Status</td>

                            </tr>

                            <%
                                while (rs.next()) {

                                    String id = rs.getString(1);
                                    String doctor = rs.getString(9);
                                    
                                     String patient = rs.getString(9);
                                    session.setAttribute("doctor",doctor);
                                        session.setAttribute("patient",patient);
                            %>
                            
                            <tr>

                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><%=rs.getString(9)%></td>

                                <td><a  href="download_Report.jsp?id=<%=id%>"><%=rs.getString(2)%></a></td>

                                <td><a  href="sendkeyGenration.jsp?id=<%=id%>"><%=rs.getString("status")%></a></td>
                            </tr>             
                            <%
                                }
                            %>


                         



                        </table>
                    </form>
            </div>
            <script>
                function acceptAppointment(patientId) {
                    // You can perform actions here, e.g., send an AJAX request to update the database
                    alert('Appointment for Patient ID ' + patientId + ' Discussing!');
                }
            </script>

            <script>
                function logout() {
                    // Add code to perform logout actions (e.g., clear session, redirect to login page)
                    alert("Logging out...");
                    // Replace the alert with actual logout logic
                    // For example, clearing session data and redirecting to the login page
                    sessionStorage.clear();
                    window.location.href = "index.html";
                }
            </script>

    </body>
</html>
