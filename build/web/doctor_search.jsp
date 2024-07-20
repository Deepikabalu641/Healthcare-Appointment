<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="form-group col-12 p-0">
                <%
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
                    String id = request.getParameter("id");
                    out.print("<h3>Doctor Details</h3>");
                    if (id == null || id.isEmpty()) {
                        pst = con.prepareStatement("select * from doctor");
                        rs = pst.executeQuery();

                        while (rs.next()) {
                            out.print("<Table width=100%;border=1 bgcolor=yellow cellpadding=2 cellspacing=2>");
                            out.print("<TR>");
                            out.print("<TD>" + rs.getString("id") + "<TD>");
                            out.print("<TD>" + rs.getString("name") + "<TD>");
                            out.print("<TD>" + rs.getString("pass") + "<TD>");
                            out.print("<TD>" + rs.getString("cpass") + "<TD>");
                            out.print("<TD>" + rs.getString("email") + "<TD>");
                            out.print("<TD>" + rs.getString("mno") + "<TD>");
                            out.print("<TD>" + rs.getString("addre") + "<TD>");
                            out.print("<TD>" + rs.getString("dob") + "<TD>");
                            out.print("<TD>" + rs.getString("specialist") + "<TD>");
                            out.print("</TR>");
                            out.print("</Table>");
                        }
                    } else {
                        pst = con.prepareStatement("select * from doctor where id =?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        while (rs.next()) {
                            out.print("<Table width=100%;border=1 bgcolor=yellow cellpadding=2 cellspacing=2>");
                            out.print("<TR>");
                            out.print("<TD>" + rs.getString("id") + "<TD>");
                            out.print("<TD>" + rs.getString("name") + "<TD>");
                            out.print("<TD>" + rs.getString("pass") + "<TD>");
                            out.print("<TD>" + rs.getString("cpass") + "<TD>");
                            out.print("<TD>" + rs.getString("email") + "<TD>");
                            out.print("<TD>" + rs.getString("mno") + "<TD>");
                            out.print("<TD>" + rs.getString("addre") + "<TD>");
                            out.print("<TD>" + rs.getString("dob") + "<TD>");
                            out.print("<TD>" + rs.getString("specialist") + "<TD>");
                            out.print("</TR>");
                            out.print("</Table>");                        }
                    }
                %>                   
                <body>
                    <div class="container">
                        <div class="form-group col-6 p-0">
                            <form id="form" method="post" action="index.jsp" class="form-horizontal">
                                <div class="form-group col-md-6"> 
                                    <input type="text" name="id" class="form-control" id="id" placeholder=" ID">
                                </div>
                                <div class="form-group col-md-6" align="center"> 

                                    <Button class="btn btn-success" style="width: 80px;">Submit</Button>

                                </div>

                            </form>

                        </div>
                    </div>   
                </body>
                </html>