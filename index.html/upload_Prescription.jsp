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
            </div>
            <div class="navi">
                <%
                    String user = (String) session.getAttribute("user");
                    String doctor = (String) session.getAttribute("doctor");
                %>
                <h1>Welcome,[<%out.println(user);%>]!</h1>
      

           <hr>
            <header>
            </header>
                       <nav>
                <ul>
                    <li><a href="doctor_view.jsp">Profile</a></li>
                    <li><a href="appointment_view.jsp">Appointments</a></li>
                    <li><a href=" doctor_patientview.jsp">Patients Report</a></li>
                    <li><a href="upload_Prescription.jsp">Upload Prescription</a></li>

                    <li><a href="specialist_Discussion.jsp"> Specialist Discussion </a></li>
                    <li><a href="disscussion_Report.jsp"> Discussion Report </a></li>
                    <li><a href="#logout" onclick="logout()">Logout</a></li>
                </ul>

            </nav> 
            <center>
                <form action='UploadFile' method="POST" enctype="multipart/form-data"  >

                    <table>
                        <tr><th colspan="2"><h2>Upload Prescription</h2></th></tr>


                        <tr><td>Patient Name</td><td><input type='text' name='user'></td></tr>

                        <tr><td><br></td></tr>
                        <tr><td>Doctor Name</td>
                            <td><input type='text' name='doctor_name' value="<%=doctor%>"></td></tr>

                        <tr><td><br></td></tr>

                        <tr><td>Upload File</td><td><input type='file' name='filename'></td></tr>
                        <tr><td><br></td></tr>
                        <tr><td><input type="submit" value="Upload"></td></tr>
                        <tr><td><br></td></tr>

                    </table>
                </form>

            </center>

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
        </div>


    </body>
</html>