<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BJS HEALTHCARE</title>
        <link rel="icon" href="images/icon.png">
        <link rel="stylesheet" type="text/css" href="css/basic.css">
    </head>
    <body>
        <div class="main">
            <center>
                <h1><div class="logo">
                        <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                </h1>
            </center>
            <div class="navit">
                <a href="index.html">Home</a>
            </div><hr>
            <div class="navi">
                Email Id:<a href="mailto:mail@example.com" > bjsinfo@gmail.com</a>
                Call Us <a href="+91 7010898540">+91 7010898540</a>
            </div>            

            <br><hr>
            <header>
                <%
                    String user = (String) session.getAttribute("user");
                %>
                <h1>Welcome,[<%out.println(user);%>]!</h1>
            </header>
            <nav>
               
                <ul>
                    <li><a href="patientview.jsp">Profile</a></li>
                    <li><a href="appointment.jsp">Book Appointment</a></li>
                     <li><a href="doctor_Approval.jsp"> Doctor Approval</a></li>
                    <li><a href="uploadfile.jsp">Upload File</a></li>
                    <li><a href="medical_Report.jsp"> Medical Records</a></li>
                    <li><a href="Payment.jsp">Payment</a></li>
                    <li><a href="order_medicine.jsp">Order Medicine</a></li>
                    <li><a href="track_Medicine.jsp">Track Medicine</a></li>
                    <li><a href="index.html" onclick="logout()">Logout</a></li>
                </ul>
            </nav><br>
            <br><br><br><br><br><br><br><br><br><br><br>


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
           
    </body>
    <br><br><br><br><br><br><br><br>
</html>