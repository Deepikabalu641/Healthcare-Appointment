<!DOCTYPE html>
<html lang="english">
<head>
    <title>BJS HEALTHCARE</title>
    <link rel="icon" href="images/icon.png">
                           <link rel="stylesheet" type="text/css" href="css/basic.css">
</head>
<body>
    <div class="main">
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
        <div class="w3-header-top-right">
            <div class="email-right">
                <p><span class="fa fa-envelope" aria-hidden="true"></span> Email Id:<a href="mailto:mail@example.com" class="info"> bjsinfo@gmail.com</a></p>
            </div>
            <div class="w3-header-top-right-text">
                <p><span class="fa fa-phone" aria-hidden="true"></span>Call Us <a href="+91 7010898540">+91 7010898540</a></p>
            </div>
        </div>
           </div>

        <header>
            <%
                String user = (String) session.getAttribute("user");
            %>
            <h1>Welcome, Dr. [<%out.println(user);%>]!</h1>
        </header>


      
        <nav>
            <ul>
                <li><a href="specialist_view.jsp">Profile</a></li>
                <li><a href="doctor_Request.jsp">Doctor Request</a></li>
                <li><a href="upload_Solutions.jsp">Upload Solutions</a></li>
              
                <li><a href="#logout" onclick="logout()">Logout</a></li>
            </ul>
        </nav> 
     </div>

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
</body>
</html>
