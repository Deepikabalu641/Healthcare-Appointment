<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <%
            Blob image = null;
            Connection con = null;
            byte[] imgData = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select photo from appointment where id = '1'");
                if (rs.next()) {

                    byte[] content = rs.getBytes("photo");
                    String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                    request.setAttribute("imageBt", base64Encoded);
                } else {
                    out.println("Display Blob Example");
                    out.println("image not found for given id>");
                    return;
                }


        %>
        <img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155PX;">

        <img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155PX;">
        <img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155PX;">
        <img src="data: image/png;base64,${requestScope['imageBt']}" style="width:155PX;">
        <img src="data:image/png;base64,${requestScope['imageBt']}" style="width:155PX;">

        <%            } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                return;
            } finally {
                try {
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

    </body>
</html>