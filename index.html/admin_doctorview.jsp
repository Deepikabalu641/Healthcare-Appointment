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
                        <a href="admin_doctorview.jsp">Doctor</a>
                        <a href="admin_patientview.jsp">Patients</a>
                        <a href="admin_appointmentview.jsp">Appointments</a>
                        <a href="Admin_specialist_view.jsp">Specialist</a>


                        <a href="#logout" onclick="logout()">Logout</a>
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

                        String sql = "select * from  doctor";

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


                            <%
                                String id = request.getParameter("id");
                                out.print("<h3>Doctor Details</h3>");
                                if (id == null || id.isEmpty()) {
                                    pst = con.prepareStatement("select * from doctor");
                                    rs = pst.executeQuery();
                                } else {

                                    pst = con.prepareStatement("select * from doctor where id =?");
                                    pst.setString(1, id);
                                    rs = pst.executeQuery();
                                    while (rs.next()) {
                                        out.print("<Table width=100%;border=1 bgcolor=yellow cellpadding=2 cellspacing=2>");
                                        out.print("<TR>");
                                        out.print("<TD>" + rs.getString("id") + "<TD>");
                                        out.print("<TD>" + rs.getString("name") + "<TD>");
                                        out.print("<TD>" + rs.getString("pass") + "<TD>");
                                        out.print("<TD>" + rs.getString("cpass") + "<TD>");
                                        out.print("<TD>" + rs.getString("email") + "<TD>");
                                        out.print("<TD>" + rs.getString("mno") + "<TD>");
                                        out.print("<TD>" + rs.getString("addre") + "<TD>");
                                        out.print("<TD>" + rs.getString("dob") + "<TD>");
                                        out.print("<TD>" + rs.getString("specialist") + "<TD>");
                                        out.print("</TR>");
                                        out.print("</Table>");
                                    }
                                }
                            %>                   
                            <body>
                                <div class="container">
                                    <div class="form-group col-6 p-0">
                                        <form id="form" method="post" action="index.jsp" class="form-horizontal">
                                            <div class="form-group col-md-6"> 
                                                <input type="text" name="id" class="form-control" id="id" placeholder=" ID">
                                            </div>
                                            <div class="form-group col-md-6" align="center"> 

                                                <Button class="btn btn-success" style="width: 80px;">Submit</Button>

                                            </div>


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