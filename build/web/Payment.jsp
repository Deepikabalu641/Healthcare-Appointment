<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Process</title>
    <link rel="stylesheet" type="text/css" href="css/basic.css">
    <link rel="icon" href="images/icon.png">
</head>
<body>

    <div class="title">
        <h2>Payment Process</h2>
    </div>

    <%

        String user = (String) session.getAttribute("user");
        String email = (String) session.getAttribute("email");

        String product = (String) session.getAttribute("product");
        String price = (String) session.getAttribute("price");

        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from product where id='" + id + "'");
            if (rs.next()) {
    %>

    <form method="post" action="addPayment.jsp">
        <table>
            <tr>
                <td>Customer Name</td>
                <td><input type="text" name="uname" value="<%=user%>" /></td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td><input type="text" name="pname" value="<%=rs.getString(3)%>" /></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" value="<%=rs.getString(4)%>" /></td>
            </tr>
            <tr>
                <td>Card Number</td>
                <td><input type="password" name="cno" value="" /></td>
            </tr>
            <tr>
                <td>Pin No</td>
                <td><input type="number" name="pno" value="" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Place Order"></td>
                <td><input type="reset" value="Reset"></td>
            </tr>
        </table>
    </form>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</body>
</html>
