<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");

    Connection con;
    Statement st;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();

    String query = "select * from patient where email='" + email + "' AND pass='" + pass + "'";

    rs = st.executeQuery(query);

    if (rs.next()) {
        response.sendRedirect("patient_homepage.jsp");
        session.setAttribute("email", rs.getString(4));
        session.setAttribute("user", rs.getString(2));
        session.setAttribute("dob", rs.getString(3));
        session.setAttribute("pno", rs.getString(8));

    } else {
        out.print("Username or password are incorrect .......");
    }
%>