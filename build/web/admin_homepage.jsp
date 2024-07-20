<!DOCTYPE html>
<html>
    <head>
        <title>BJS HEALTHCARE</title>
        <link rel="icon" href="images/icon.png">
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

            .navit {
                text-align: left;
                font-size: 2.2em;
                color: #c9302c;
                text-decoration: none;
            }
            .navi{
                text-align: right;
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
            <div class="main">
                <center>
                    <h1><div class="logo">
                            <img src="images/icon.png" alt="logo">BJS HEALTHCARE</div>

                    </h1>
                </center>
                <div class="navit">

                </div>


                <header>
                    <%
                        String user = (String) session.getAttribute("user");
                    %>
                    <h1>  <a href="index.html">Welcome,</a>[<%out.println(user);%>]!</h1>
                </header>


                <nav>
                    <ul>


                        <li><a href="admin_doctorview.jsp">Doctor</a></li>
                        <li> <a href="admin_patientview.jsp">Patients</a></li>
                        <li><a href="admin_appointmentview.jsp">Appointments</a></li>
                        <li> <a href="Admin_specialist_view.jsp">Specialist</a></li>
                        <li> <a href="AddProduct.jsp">Add Medicine</a></li>
                        <li> <a href="view_Product.jsp">View Medicine</a></li>


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
