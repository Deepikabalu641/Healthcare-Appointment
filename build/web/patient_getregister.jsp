<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String name = request.getParameter("name");

    String dob = request.getParameter("dob");
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    String cpass = request.getParameter("cpass");

    String gender = request.getParameter("gender");

    String pno = request.getParameter("pno");
    String addre = request.getParameter("addre");
    String photo = request.getParameter("photo");

    out.println(name + dob + email + pass + cpass + gender + pno + addre + photo );
    Connection con;
    Statement st;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();
    String query = "insert into patient(name, dob, email, pass, cpass, gender, pno, addre,photo,status) values('" + name + "','" + dob + "','" + email + "','" + pass + "','" + cpass + "','" + gender + "','" + pno + "','" + addre + "','" + photo + "',' Approve ')";
    st.executeUpdate(query);
    {
        response.sendRedirect("patient_login.html");

    }

%>