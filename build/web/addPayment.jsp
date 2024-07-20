<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("uname");
    String productname = request.getParameter("pname");
    String price = request.getParameter("price");
    String cardnumber = request.getParameter("cno");
    String pinno = request.getParameter("pno");

    String user = (String) session.getAttribute("user");

    try {
        Connection conn = null;
        Statement stt = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

        stt = conn.createStatement();

        String query = "insert into payment(customer_name, product_name, price, car_number, pinno, Stataus,status1) values('" + username + "','" + productname + "','" + price + "','" + cardnumber + "','" + pinno + "','Paid','Paid')";

        stt.executeUpdate(query);

    
        response.sendRedirect("patient_homepage.jsp");
    } catch (Exception ex) {
        out.print(ex);
    }


%>

