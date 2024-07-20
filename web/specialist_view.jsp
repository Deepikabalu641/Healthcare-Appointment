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
            <div class="main">
                <center>
                    <h1><div class="logo">
                            <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                    </h1>
                </center>
                <div class="navit">
                    <a href="index.html" page-target same>Home</a></div>

                <div class="w3-header-top-right">
                    <div class="email-right">
                        <p><span class="fa fa-envelope" aria-hidden="true"></span> Email Id:<a href="mailto:mail@example.com" class="info"> bjsinfo@gmail.com</a></p>
                    </div><br>
                    <div class="w3-header-top-right-text">
                        <p><span class="fa fa-phone" aria-hidden="true"></span>Call Us <a href="+91 7010898540">+91 7010898540</a></p>
                    </div>
                </div>


                <%

                    String user = (String) session.getAttribute("user");
                    out.println(user);%>


                <nav>
                    <ul>
                        <li><a href="specialist_view.jsp">Profile</a></li>
                        <li><a href="doctor_Request.jsp">Doctor Request</a></li>
                        <li><a href="upload_Solutions.jsp">Upload Solutions</a></li>

                        <li><a href="#logout" onclick="logout()">Logout</a></li>
                    </ul>
                </nav> 

                <main>

                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        Blob image = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

                        st = con.createStatement();

                        String sql = "select * from  specialist where name='" + user + "'";

                        rs = st.executeQuery(sql);
                    %>
                    <form action="" method="post">
                        <table border="1" cellpadding="20">
                            <tr>

                                <td>Doctor ID</td>
                                <td>Doctor NAME</td>
                                <td>Password</td>
                                <td>Confirm Password</td>
                                <td>Email ID</td>
                                <td>Phone NO</td>
                                <td>Address</td>
                                <td>Date Of Birth</td>
                                <td>Specialist</td>
                                <td>Photo</td>


                            </tr>

                            <%
                                while (rs.next()) {
                                    byte[] content = rs.getBytes("photo");
                                    String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                                    request.setAttribute("imageBt", base64Encoded);


                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><%=rs.getString(8)%></td>
                                <td><%=rs.getString(9)%></td>
                                <td><img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155PX;"></td>





                            </tr>
                            <%                       }
                            %>



                        </table></div>
                    </form>


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