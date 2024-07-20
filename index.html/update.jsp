<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String dob = request.getParameter("dob");
    String email = request.getParameter("email");

    String pass = request.getParameter("pass");

    String cpass = request.getParameter("cpass");
    String gender = request.getParameter("gender");

    String pno = request.getParameter("pno");

    String addre = request.getParameter("addre");
    String photo = request.getParameter("photo");

    try {
        Connection conn = null;
        Statement stt = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

        stt = conn.createStatement();
        String str = "update patient set Id='" + id + "',name='" + name + "',dob='" + dob + "',email='" + email + "',pass='" + pass + "',cpass='" + cpass + "',gender='" + gender + "',pno='" + pno + "',addre='" + addre + "',photo='" + photo + "' where id='" + id + "'";
        out.print(id + name + dob + email + pass + cpass + gender + pno + addre + photo);
        stt.executeUpdate(str);
        response.sendRedirect("patientview.jsp");
    } catch (Exception ex) {
        out.print(ex);
    }


%>

