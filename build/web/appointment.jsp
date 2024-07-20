<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Appointment Registration</title>
        <link rel="icon" href="images/icon.png">
        <style>
            body {
                background-image: url(images/appp.jpg);
                background-size: cover;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
            }

            form {
                background-image: url(images/appp.jpg);
                background-size: cover;
                box-sizing: border-box;

                max-width: 700px;
                margin: 60px auto;
                background-color: #fff;
                padding:80px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                color: black;
                display: block;
                margin-bottom: 8px;
                color: bold;
            }

            input, select {
                width: 100%;
                padding: 8px;
                margin-bottom: 16px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #4caf50;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                max-width: 50%;
            }

            button:hover {
                background-color: #45a049;

                .check{
                    size: auto;
                }

            }
            .but{
                max-width: 50%;
                alignment-adjust: central;

            }
            .app{
                text-align: center;
            }
            .page{
                text-align: right;

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

            .an{
                color: #fff;
                font-size: 1rem;
                text-align: left;
                font-weight: 700;

            }


            .navit {
                text-align: right;
                font-size: 2.2em;
                color: #c9302c;
                text-decoration: none;
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
            }


            .navi{
                text-align: right;
                font-size: 1em;
                color: #c9302c;
                text-decoration: none;
            }
            nav {
                text-align: right;
                background-color: #ecf0f1;
                color: white;
                padding: 20px;
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
                padding: 20px;
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

            footer {
                background-color: #343a40;
                color: white;
                text-align: center;
                padding: 10px;
                position: fixed;
                bottom: 0;
                width: 100%;
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
        </style>
    </head>
    <body>
        <div class="main">

            <center>
                <h1><div class="logo">
                        <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                </h1>
            </center>  
            <%

                String user = (String) session.getAttribute("user");
                String email = (String) session.getAttribute("email");

                String dob = (String) session.getAttribute("dob");
                String pno = (String) session.getAttribute("pno");

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


            <main>
                <form action="appointment_getregister.jsp" method="post">
                    <div class="page"><a class="page" href="index.html">Home</a></div>
                    <div class="app">
                        <h2> BOOK NOW</h2></div>

                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%out.println(user);%>"  >

                    <label for="email">Email:</label>
                    <input type="mail" id="email" name="email" value="<%out.println(email);%>"   >

                    <label for="dob">DOB</label>
                    <input type="date" id="dob" name="dob" value="<%out.println(dob);%>"  >



                    <label for="phone">Phone Number:</label>
                    <input type="number" id="pno" name="pno" value="<%out.println(pno);%>">

                    <label for="category">Doctor Name:</label>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
                            String sql = "SELECT DISTINCT name FROM doctor";

                            PreparedStatement ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                    %>

                    <select name="doctor">
                        <%
                            while (rs.next()) {
                                String fname = rs.getString("name");
                        %>
                        <option value="<%=fname%>"><%=fname%></option>
                        <%
                            }
                        %>
                    </select>
                    </p>
                    <%
                        } catch (SQLException sqe) {
                            out.println(sqe);
                        }
                    %>

                    <!-- Add more options as needed -->



                    <label for="sympt">Symptoms</label>
                    <input type="type" id="sympt" name="sympt" required placeholder="Your Problem">

                    <label for="Problem"> Symptoms days</label>
                    <input type="number" id="sym" name="sym" required placeholder="How manys You Have This Problem">

                    <label for="date">Booked Date</label>
                    <input type="date" id="date" name="date" required placeholder="Today's Date">


                    <label for="med">Have Before Taken Any Medicine:</label>
                    <input type="checkbox" id="med" name="med" >

                    <label for="status">Status:</label>
                    <input type="type" id="status" name="status" >

                    <div class="but">
                        <button onclick="bookAppointment()">Book Appointment</button>
                    </div>

                    <!-- ... (previous HTML code) ... -->

                    <script>
                        function bookAppointment() {
                            // Placeholder function - you can add logic for booking appointment here

                            // For demonstration purposes, show an alert and redirect to the homepage
                            alert('Appointment booked successfully!');
                            window.location.href = 'index.html'; // Change the URL to your homepage
                        }
                    </script>

                    <script>
                        function logout() {
                            // Add code to perform logout actions (e.g., clear session, redirect to login page)
                            alert("Logging out...");
                            // Replace the alert with actual logout logic
                            // For example, clearing session data and redirecting to the login page
                            sessionStorage.clear();
                            window.location.href = "patient_login.html";
                        }
                    </script>
                    <!-- ... (remaining HTML code) ... -->
                </form>

                </body>
                </html>
