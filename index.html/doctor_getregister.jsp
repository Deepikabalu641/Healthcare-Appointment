<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String cpass = request.getParameter("cpass");
    String email = request.getParameter("email");
    String mno = request.getParameter("mno");
    String addre = request.getParameter("addre");
    String dob = request.getParameter("dob");
    String specialist = request.getParameter("specialist");
    String photo = request.getParameter("photo");

    out.println(name + pass + cpass + email + mno + addre + dob + specialist+photo);
    Connection con;
    Statement st;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();

    String query = "insert into doctor(name, pass, cpass, email, mno, addre, dob, specialist,photo) values('" + name + "','" + pass + "','" + cpass + "','" + email + "','" + mno + "','" + addre + "','" + dob + "','" + specialist + "','" + photo + "')";
    st.executeUpdate(query);
    
      st.executeUpdate(query);
       {
        response.sendRedirect("doctorlogin.html");
       
        
       }   
%>