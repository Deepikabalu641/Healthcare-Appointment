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
        <h1>
            <div class="logo">
                <img src="images/icon.png" alt="logo">BJS HEALTHCARE
            </div>
        </h1>
    </center>
    <div class="navit">
        <a href="index.html" page-target same>Home</a>
    </div>

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

            String sql = "select * from  patient where name='" + user + "'";

            rs = st.executeQuery(sql);
        %>

        <form action="update.jsp" method="post">
            <table border="2" cellpadding="20">
                <tr>
                    <td>Patient ID</td>
                    <td>Patient NAME</td>
                    <td>DOB</td>
                    <td>Email ID</td>
                    <td> Password</td>
                    <td>Confirm Password</td>
                    <td>Gender</td>
                    <td> Phone Number </td>
                    <td> Address</td>
                    <td>Photo</td>
                    <td>ACTION</td>
                    <td>REMOVE</td>
                    <td>Status</td>
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
                    <td><img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155px;"></td>
                    <td><button><a href="Edit.jsp?id=<%=rs.getString(1)%>">Edit</a></button></td>
                    <td><button><a href="delete.jsp?id=<%=rs.getString(1)%>">Delete</a></button></td>
                    <td><a href="approve.jsp"><%=rs.getString(12)%>Approve</a></td>
                </tr>

                <% }
                %>

            </table>
        </form>
    </main>
</div>

<script>
    function logout() {
        alert("Logging out...");
        sessionStorage.clear();
        window.location.href = "patient_login.html";
    }
</script>

</body>
</html>
