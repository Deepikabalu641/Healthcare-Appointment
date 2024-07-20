<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String patient_name = request.getParameter("patient_name");
    String doctor_name = request.getParameter("doctor_name");
    String file = request.getParameter("file");
    String desc  = request.getParameter("des");
 
    Connection con;
    Statement st;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

    st = con.createStatement();

    String query = "insert into discussion(patient_name, doctor_name, file, description, status) values('" + patient_name + "','" + doctor_name + "','" + file + "','" + desc + "','Discussion')";
    st.executeUpdate(query);
    
      st.executeUpdate(query);
       {
        response.sendRedirect("specialist_Discussion.jsp");
       
        
       }   
%>