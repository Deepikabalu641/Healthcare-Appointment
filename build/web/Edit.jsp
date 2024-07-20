download_Report<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
        <h1 Record</h1>
        <%

            String id = request.getParameter("id");
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

            st = con.createStatement();

            String sql = "select * from  patient where id='" + id + "'";

            rs = st.executeQuery(sql);
        %>
        <form action="update.jsp" method="post">

            <table border="1" cellpadding="15">
                <tr>

                    <td>Patient ID</td>
                    <td>Patient NAME</td>
                    <td>Date Of Birth</td>

                    <td>Email ID</td>
                    <td>Password</td>
                    <td>Confirm Password</td>
                    <td>Gender</td>

                    <td>Phone NO</td>
                    <td>Address</td>
                    <td>ACTION</td>
                </tr>

                <%
                    while (rs.next()) {


                %>
                <tr>
                    <td><input type="text" name="id" value="<%=rs.getString(1)%>"</td>
                    <td><input type="text" name="name" value="<%=rs.getString(2)%>"></td>
                    <td><input type="text" name="dob" value="<%=rs.getString(3)%>"></td>
                    <td><input type="text" name="email" value="<%=rs.getString(4)%>"></td>
                    <td><input type="text" name="pass" value="<%=rs.getString(5)%>"></td>
                    <td><input type="text" name="cpass" value="<%=rs.getString(6)%>"></td>

                    <td><input type="text" name="gender" value="<%=rs.getString(7)%>"></td>
                    <td><input type="text" name="pno" value="<%=rs.getString(8)%>"></td>
                    <td><input type="text" name="addre" value="<%=rs.getString(9)%>"></td>
                    <td><input type="submit" value="Update"></td>

                </tr>
                <%                       }
                %>



            </table>
        </form>
    </body>
</html>
