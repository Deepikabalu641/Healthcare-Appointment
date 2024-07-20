<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String dob = request.getParameter("dob");
    String pno = request.getParameter("pno");
    String doctor = request.getParameter("doctor");
    String sympt = request.getParameter("sympt");
    String sym = request.getParameter("sym");
    String date = request.getParameter("date");
    String med = request.getParameter("med");
    String status = request.getParameter("status");

    out.println(name + email + dob + pno + doctor + sympt + sym + date + med + status);
    Connection con;
    Statement st;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();
    String query = "insert into appointment(name, email, dob, pno, doctor, sympt, sym, date, med, status) values('" + name + "','" + email + "','" + dob + "','" + pno + "','" + doctor + "','" + sympt + "','" + sym + "','" + date + "','" + med + "','SEND REQUEST')";
    st.executeUpdate(query);
    {
        response.sendRedirect("index.html");
       
        
       }   
%>