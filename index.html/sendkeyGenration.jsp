    <%-- 
        Document   : keyGenration
        Created on : Mar 26, 2021, 6:32:49 PM
        Author     : Lib
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%

        String id = request.getParameter("id");
        out.println(id);
        String alphaNumerics = "abcdefghijklmnopqrstwxyz1234567890";
        String autoPassword = "", autoPassword1 = "";
        for (int i = 0; i < 6; i++) {
            autoPassword += alphaNumerics.charAt((int) (Math.random() * alphaNumerics.length()));
        }

        String key1 = autoPassword;
        for (int i = 0; i < 6; i++) {
            autoPassword1 += alphaNumerics.charAt((int) (Math.random() * alphaNumerics.length()));
        }
        String key2 = autoPassword1;

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

        Statement st = con.createStatement();
        //ResultSet rs;
        try {
            int i = st.executeUpdate("UPDATE appointment SET key1='" + key1.toString() + "' ,status='approved' where id='" + id + "' ");

            if (i > 0) {

                request.setAttribute("status", "Security Code Send to your mail ..");
                RequestDispatcher rd = request.getRequestDispatcher("doctor_patientview.jsp");
                rd.forward(request, response);

            } else {
                out.println("No network");
            }
        } catch (Exception ex) {
            out.println(ex);
        }


    %>