
            
<%@page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

            st = con.createStatement();

            String sql = "delete from  pa where id='"+id+"'";

            st.executeUpdate(sql);
            
            response.sendRedirect("view.jsp");
        %>