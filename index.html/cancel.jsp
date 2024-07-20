<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
  out.print(id);
    try {
        Connection conn = null;
        Statement stt = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

        stt = conn.createStatement();
        String str = "update payment     set status1='Cancelled' where id='" + id + "'";
       stt.executeUpdate(str);
        response.sendRedirect("view_Product.jsp");
    } catch (Exception ex) {
        out.print(ex);
    }


%>

