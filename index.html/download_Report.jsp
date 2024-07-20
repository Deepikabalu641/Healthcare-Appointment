<%-- 
    Document   : download
    Created on : Sep 21, 2013, 1:40:00 PM
    Author     : Deepak
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>

<%
    String doc_id = request.getParameter("id");

    out.print(doc_id);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    Statement statement = con.createStatement();

    ResultSet rs = statement.executeQuery("select * from uploadfile where id = " + doc_id);
    rs.next();

    response.reset();

    try {
        if (rs.getString(6) == ".txt") {
            response.setContentType("application/octet-stream");
        } else if (rs.getString(6) == ".pdf") {
            response.setContentType("application/pdf");
        } else if ((rs.getString(6) == ".doc") || rs.getString(6) == ".docx") {
            response.setContentType("application/msword");
        } else if ((rs.getString(6) == ".xls") || (rs.getString(6) == ".xlsx")) {
            response.setContentType("application/vnd.ms-excel");
        }
        response.addHeader("Content-Disposition", "attachment; filename=" + rs.getString(2));
        Blob blb = rs.getBlob(6);
        byte[] bdata = blb.getBytes(1, (int) blb.length());

        OutputStream output = response.getOutputStream();
        output.write(bdata);
        output.close();

        rs.close();
        // MyConnection.CloseConnection();
    } catch (Exception ex) {
        out.println(ex);
    }
%>