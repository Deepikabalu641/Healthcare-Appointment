<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BJS HEALTHCARE</title>
        <link rel="icon" href="images/icon.png">
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
                <a href="index.html">Home</a>
            </div>
            <div class="navi">
                <%
                    String user = (String) session.getAttribute("user");
                    String doctor = (String) session.getAttribute("doctor");
                %>
                <h1>Welcome,[<%out.println(user);%>]!</h1>
<hr>
            </div>            

            
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

            <center>
                <form action='doctor_Discussion.jsp' method="POST"  >

                    <table>
                        <tr><th colspan="2"><h2>Specialist Discussion</h2></th></tr>


                        <tr><td>Patient Name</td><td><input type='text' name='patient_name'></td></tr>

                        <tr><td>Doctor Name</td>
                            <td><input type='text' name='doctor_name' value="<%=doctor%>"></td></tr>


                        <tr><td>Select File</td>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
                                    String sql = "SELECT DISTINCT filename FROM uploadfile";

                                    PreparedStatement ps = con.prepareStatement(sql);
                                    ResultSet rs = ps.executeQuery();
                            %>

                            <td> <select name="file">
                                    <%
                                        while (rs.next()) {
                                            String fname = rs.getString("filename");
                                    %>
                                    <option value="<%=fname%>"><%=fname%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                            </p>
                            <%
                                } catch (SQLException sqe) {
                                    out.println(sqe);
                                }
                            %>
                        </tr>
                        <tr>
                            <td>Discussion</td>
                            <td>  <textarea name="des"  placeholder="discussion here...." required=""></textarea></td>

                        </tr>
                        <tr><td><input type="submit" value="Submit"></td></tr>

                    </table>
                </form>

            </center>


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