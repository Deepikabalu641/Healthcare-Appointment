<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    if (email.equalsIgnoreCase("admin@gmail.com") && pass.equalsIgnoreCase("111"))
    {
        response.sendRedirect("admin_homepage.jsp");
     session.setAttribute("type",email);
    }
    else   if (email.equalsIgnoreCase("ts@gmail.com") && pass.equalsIgnoreCase("101"))
    {
        response.sendRedirect("Trust_authority.jsp");
     session.setAttribute("type",email);
    }
  
    else {
            out.print("Usename or Password is Wrong.Try Again....");
        }
    
    
%>