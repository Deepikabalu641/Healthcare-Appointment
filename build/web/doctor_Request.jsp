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
                        <li><a href="update_Solutions.jsp">Upload Solutions</a></li>

                        <li><a href="#logout" onclick="logout()">Logout</a></li>
                    </ul>
                </nav> 

                <main>

                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

                        st = con.createStatement();

                        String sql = "select * from  discussion ";

                        rs = st.executeQuery(sql);
                    %>
                    <form action="" method="post">
                        <h2>Doctor Request</h2>
                        <table border="1" cellpadding="20">
                            <tr>

                                <td>PATIENT ID</td>
                                <td>PATIENT NAME</td>
                                <td>Doctor NAME</td>
                                <td>FILE</td>
                                <td>DISCUSSION ID</td>
                                <td>STATUS</td>



                            </tr>

                            <%
                                while (rs.next()) {

                                    session.setAttribute("patient", rs.getString(2));
                                    session.setAttribute("doctor", rs.getString(3));


                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>






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