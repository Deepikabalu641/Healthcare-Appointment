<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    
    Connection con;
    Statement st;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
    
    st=con.createStatement();
    
    String query="select * from doctor where email='"+email+"' AND pass='"+pass+"'";
    
    rs=st.executeQuery(query);
    
    if(rs.next())
    {
        response.sendRedirect("doctor_homepage.jsp");
        session.setAttribute("type",email);
         session.setAttribute("user",rs.getString(2));

                   

               
    }
    else{
        out.print("Username or password are incorrect .......");
    }
%>