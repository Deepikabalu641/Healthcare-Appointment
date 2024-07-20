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
                <%
                    String user = (String) session.getAttribute("user");
                    String doctor = (String) session.getAttribute("doctor");
                %>
                <h1>Welcome,[<%out.println(user);%>]!</h1>
               </div>            

            <br><hr>
            <header>
            </header>
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

            <center>
                <form action='UploadFile' method="POST" enctype="multipart/form-data"  >

                    <table>
                        <tr><th colspan="2"><h2>Upload File</h2></th></tr>


                        <tr><td>Private key</td><td><input type='text' name='pk'></td></tr>

                        <tr><td>Doctor Name</td>
                            <td><input type='text' name='doctor_name' value="<%=doctor%>"></td></tr>


                        <tr><td>Upload File</td><td><input type='file' name='filename'></td></tr>
                        <tr><td><input type="submit" value="Upload"></td></tr>

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