<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                overflow: auto;
                background: rgba(255, 255, 255, 0.7) url('images/w3.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow-y: auto;
                overflow-x: auto;
            }

            .main {
                z-index: 1;
                border-collapse: collapse;
                width: 100%;
                border: 2px solid #ddd;
                padding: 20px;
                font-weight: bold;
                background: rgba(255, 255, 255, 0.7);
                margin-top: 20px;
                text-align: center;
            }
            .navit{

                text-align: left;
                font-size: 2.2em;
                color: #c9302c; /* Change this to the desired color code */
                text-decoration: none; /* Optional: Remove the underline */

            }


            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            a {
                text-decoration: none;
                color: blue;
            }


            .navit {
                text-align: left;
                font-size: 2.2em;
                color: #c9302c;
                text-decoration: none;
            }

            nav {
                text-align: right;
                background-color: #ecf0f1;
                color: white;
                padding: 10px;
            }
            .navi{
                text-align: right;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: space-around;
            }

            nav a {
                color: blue;
                text-decoration: none;
                padding: 10px;
                transition: background-color 0.3s;
            }

            nav a:hover {
                background-color: #6c757d;
            }

            section {
                padding: 20px;
            }

            .dashboard-section {
                background-color: white;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            a:hover {
                color: #4cae4c;
            }

            .w3-header-top-right {
                display: flex;
                justify-content: flex-end;
            }

            .email-right,
            .w3-header-top-right-text {
                margin-right: 20px;
            }
            .logo img {
                width: 7%;
                border-radius: 50%;
            }

            .logo h2 {
                font-size: 1.15rem;
                font-weight: 600;
                margin-left: 15px;
                display: none;
            }
            
             ol.progtrckr {
                margin: 0;
                padding: 0;
                list-style-type: none;
            }

            ol.progtrckr li {
                display: inline-block;
                text-align: center;
                line-height: 3.5em;
            }

            ol.progtrckr[data-progtrckr-steps="2"] li { width: 49%; }
            ol.progtrckr[data-progtrckr-steps="3"] li { width: 33%; }
            ol.progtrckr[data-progtrckr-steps="4"] li { width: 24%; }
            ol.progtrckr[data-progtrckr-steps="5"] li { width: 19%; }
            ol.progtrckr[data-progtrckr-steps="6"] li { width: 16%; }
            ol.progtrckr[data-progtrckr-steps="7"] li { width: 14%; }
            ol.progtrckr[data-progtrckr-steps="8"] li { width: 12%; }
            ol.progtrckr[data-progtrckr-steps="9"] li { width: 11%; }

            ol.progtrckr li.progtrckr-done {
                color: black;
                border-bottom: 4px solid yellowgreen;
            }
            ol.progtrckr li.progtrckr-todo {
                color: silver; 
                border-bottom: 4px solid silver;
            }

            ol.progtrckr li:after {
                content: "\00a0\00a0";
            }
            ol.progtrckr li:before {
                position: relative;
                bottom: -2.5em;
                float: left;
                left: 50%;
                line-height: 1em;
            }
            ol.progtrckr li.progtrckr-done:before {
                content: "\2713";
                color: white;
                background-color: yellowgreen;
                height: 2.2em;
                width: 2.2em;
                line-height: 2.2em;
                border: none;
                border-radius: 2.2em;
            }
            ol.progtrckr li.progtrckr-todo:before {
                content: "\039F";
                color: silver;
                background-color: white;
                font-size: 2.2em;
                bottom: -1.2em;
            }

        </style>
    </head>
    <body>
        <div class="main">
            <center>
                <h1><div class="logo">
                        <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                </h1>
            </center>
            <div class="navit">
                <a href="index.html" >Home</a></div>

            <div class="w3-header-top-right">
                <div class="email-right">
                    <p><span class="fa fa-envelope" aria-hidden="true"></span> Email Id:<a href="mailto:mail@example.com" class="info"> bjsinfo@gmail.com</a></p>
                </div>
                <div class="w3-header-top-right-text">
                    <p><span class="fa fa-phone" aria-hidden="true"></span>Call Us:<a href="+91 7010898540">+91 7010898540</a></p>
                </div>
            </div>

            <%
                String user = (String) session.getAttribute("user");
                out.println(user);
            %>

            <nav>
                <ul>
                    <li><a href="patientview.jsp">Profile</a></li>
                    <li><a href="appointment.jsp">Book Appointment</a></li>
                    <li><a href="doctor_Approval.jsp"> Doctor Approval</a></li>
                    <li><a href="uploadfile.jsp">Upload File</a></li>
                    <li><a href="medical_Report.jsp"> Medical Records</a></li>
                    <li><a href="paymentReport.jsp">Payment</a></li>
                    <li><a href="order_medicine.jsp">Order Medicine</a></li>
                    <li><a href="track_Medicine.jsp">Track Medicine</a></li>
                    <li><a href="index.html" onclick="logout()">Logout</a></li>
                </ul>
            </nav><br>
                        <h1>Product Tracking Process</h1>
                        <ol class="progtrckr" data-progtrckr-steps="5">


                            <%
                                String id = request.getParameter("id");

                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;

                                Blob image = null;
                                byte[] imgData = null;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/health", "root", "root");

                                st = con.createStatement();
                                String sql = "select * from  payment where id='" + id + "'";

                                rs = st.executeQuery(sql);
                            %>


                            <%
                                while (rs.next()) {

                                    String pid = rs.getString(1);
                                    String status = rs.getString(7);
                                    String status1 = rs.getString(8);

                                    if (pid.equalsIgnoreCase(pid)) {
                            %>
                            <li class="progtrckr-done">Order Processing</li>


                            <%
                            } else {
                            %>
                            <li class="progtrckr-todo">Order Processing</li>


                            <%
                                }
                                if (status.equalsIgnoreCase("Confrimed")) {
                            %>
                            <li class="progtrckr-done">Product Confrimed</li>

                            <%
                            } else {
                            %>
                            <li class="progtrckr-todo">ProduConfrimed</li>
                                <%
                                    }
                                    if (status1.equalsIgnoreCase("Cancelled")) {
                                %>
                            <li class="progtrckr-done">Product Shipped</li>

                            <%
                            } else {

                            %>
                            <li class="progtrckr-todo">Product Cancelled</li>


                            <%                                    }
                                }

                            %>

                        </ol>

                        <!--inner block start here-->






                    </div>



                    <div class="clearfix"> </div>
                </div>
                <!--main page chit chating end here-->
                <!--main page chart start here-->



            </div>
            <!--inner block end here-->
            <!--copy rights start here-->
            <div class="copyrights">
            </div>	
            <!--COPY rights end here-->
        </div>

        <!--slider menu-->
        <div class="clearfix"> </div>

        <!--slide bar menu end here-->
        <script>
            var toggle = true;

            $(".sidebar-icon").click(function() {
                if (toggle)
                {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({"position": "absolute"});
                }
                else
                {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function() {
                        $("#menu span").css({"position": "relative"});
                    }, 400);
                }
                toggle = !toggle;
            });
        </script>
        <!--scrolling js-->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!--//scrolling js-->
        <script src="js/bootstrap.js"></script>
        <!-- mother grid end here-->
        <form action="supplierupdate.jsp" method="post">

        </form>
    </body>
</html>                     