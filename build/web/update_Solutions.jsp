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

                    String patient = (String) session.getAttribute("patient");
                    String doctor = (String) session.getAttribute("doctor");
                %>
                <h1>Welcome,[<%out.println(user);%>]!</h1>
            </div>            

            <br>
            <header>
            </header>
            <nav>
                <ul>
                    <li><a href="specialist_view.jsp">Profile</a></li>
                    <li><a href="doctor_Request.jsp">Doctor Request</a></li>
                    <li><a href="upload_Solutions.jsp">Upload Solutions</a></li>

                    <li><a href="#logout" onclick="logout()">Logout</a></li>
                </ul>
            </nav> 

            <center>
                <form action='speciallist_Report.jsp' method="POST" >

                    <table>
                        <tr><th colspan="2"><h2>Upload Prescription</h2></th></tr>
                        <tr>


                        <tr><td>Doctor Name</td><td><input type='text' name='doctor_name'></td></tr>
                        <tr><td><br></td></tr>

                        <tr><td>Discussion Report</td><td><input type='text' name='report'></td></tr>
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
                    window.location.href = "index.html";
                }
            </script>
        </div>
        <br>  <br>  <br>  <br>  <br>  <br>  <br> 


    </body>
</html>