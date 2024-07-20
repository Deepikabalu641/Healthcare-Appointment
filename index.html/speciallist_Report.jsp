<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String user = (String) session.getAttribute("user");
    String doctor_name = request.getParameter("doctor_name");
    String code = request.getParameter("report");

    Connection con;
    Statement st;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();

    String query = "insert into discussed_report( user, doctor_name, report) values('" + user + "','" + doctor_name + "','" + code + "')";
    st.executeUpdate(query);

    {
        response.sendRedirect("specialist_homepage.jsp");

    }
%>