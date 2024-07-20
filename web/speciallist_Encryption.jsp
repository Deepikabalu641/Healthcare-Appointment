

<%@page import="javax.crypto.SecretKey"%>
<%@page import="Cloud.TripleDESTest"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Cloud.AESEncryption"%>
<%@page import="DB.MyConnection"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%><!DOCTYPE html>
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
                    <li><a href=""> Medical Records</a></li>
                    <li><a href="">Payment</a></li>
                    <li><a href="order_medicine.jsp">Order Medicine</a></li>
                    <li><a href="">Track Medicine</a></li>
                    <li><a href="index.html" onclick="logout()">Logout</a></li>
                </ul>
            </nav><br>



            <main>
                <h2> Encrypt the File</h2>

                <form action="upload_Solutions.jsp" method="post">

                    <br><br><br><br>
                    <%                        //-
                        String st = "insert into encryptfile(filename,filesize,extension,file1,file2,file3,file4,file5,file6,file7,file8,time,content,uname) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement psmt = MyConnection.getConnection().prepareStatement(st);

                        String name = "";
                        String fileExtesion = "";
                        File ff = null;
                        FileInputStream fin = null;
                        double kilobytes = 0.0;
                        double gigabytes = 0.0;
                        String filename = null, extension = null;
                        String str1 = null, str2 = null, str3 = null, str4 = null, str5 = null, str6 = null, str7 = null, str8 = null;
                        String size = null;
                        int time1 = 0;

                        filename = (String) session.getAttribute("filename");
                        size = (String) session.getAttribute("size").toString();
                        extension = (String) session.getAttribute("extension");

                        //splitting file into 8parts
                        str1 = (String) session.getAttribute("str1");
                        str2 = (String) session.getAttribute("str2");
                        str3 = (String) session.getAttribute("str3");
                        str4 = (String) session.getAttribute("str4");
                        str5 = (String) session.getAttribute("str5");
                        str6 = (String) session.getAttribute("str6");
                        str7 = (String) session.getAttribute("str7");
                        str8 = (String) session.getAttribute("str8");

                        // here using hybrid algorithm 
                        // encrypted based on time
                        Calendar now = Calendar.getInstance();
                        int hours = now.get(Calendar.HOUR);
                        int m = now.get(Calendar.MINUTE);
                        int s = now.get(Calendar.SECOND);
                        int mm = now.get(Calendar.MILLISECOND);

                        time1 = hours + m + s;

                        //here using even or add number get from current time 
                        // even number will apply AES algorithm
                        // odd number will apply Triple AES algorithm
                        String output1 = null, output2 = null, output3 = null, output4 = null, output5 = null, output6 = null, output7 = null, output8 = null;
                        if (time1 % 2 == 0) {

                            Cipher cipher;

                            // Input encrypted String
                            // password for encryption
                            try {
                                //AES algorithm 

                                SecretKey secKey1 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c1 = new AESEncryption().encryptText(str1, secKey1);
                                SecretKey secKey2 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c2 = new AESEncryption().encryptText(str2, secKey2);

                                SecretKey secKey3 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c3 = new AESEncryption().encryptText(str3, secKey3);

                                SecretKey secKey4 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c4 = new AESEncryption().encryptText(str4, secKey4);

                                SecretKey secKey5 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c5 = new AESEncryption().encryptText(str5, secKey5);

                                SecretKey secKey6 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c6 = new AESEncryption().encryptText(str6, secKey6);

                                SecretKey secKey7 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c7 = new AESEncryption().encryptText(str7, secKey7);

                                SecretKey secKey8 = new AESEncryption().getSecretEncryptionKey();
                                byte[] c8 = new AESEncryption().encryptText(str8, secKey8);

                                output1 = new String(c1);
                                output2 = new String(c2);
                                output3 = new String(c3);
                                output4 = new String(c4);
                                output5 = new String(c5);
                                output6 = new String(c6);
                                output7 = new String(c7);
                                output8 = new String(c8);
                    %>


                    <table style="color:#fff; margin-top: -65px; font-weight:900; font-size:15px;">



                        <tr>
                            <td>File Name</td>
                            <td><input type="text" name="fname" value="<%=filename%>" /></td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>File Type</td>
                            <td><input type="text" name="lname" value="<%=extension%>"  /></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr>
                            <td>File Size</td>
                            <td><input type="text" name="email" value="<%=size%>" /></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr>
                            <td>File Content</td>
                            <td><textarea rows="15" cols="90">
                                    <%=output1 + output2 + output3 + output4 + output5%>
                                </textarea></td> 
                        </tr>
                        <tr><td><br></td></tr>



                        <tr><td><br></td></tr>

                        <tr>
                            <td></td>
                            <td> <input type="submit" value="            Submit           " style=" font-weight:900;border:2px solid #3a3a3a"/></td>
                        </tr>
                    </table>
                    </td>
                    </tr>



                    <%

                            String content = str1 + str2 + str3 + str4 + str5 + str6 + str7 + str8;

                            // psmt.setBinaryStream(1, (InputStream) fin, (int) (ff.length()));
                            psmt.setString(1, filename);
                            psmt.setString(2, size);
                            psmt.setString(3, extension);
                            psmt.setString(4, output1);
                            psmt.setString(5, output2);
                            psmt.setString(6, output3);
                            psmt.setString(7, output4);
                            psmt.setString(8, output5);
                            psmt.setString(9, output6);
                            psmt.setString(10, output7);
                            psmt.setString(11, output8);
                            psmt.setString(12, "RAS");
                            psmt.setString(13, content);
                            psmt.setString(14, user);

                            // pass the user name or id 
                            boolean sss = psmt.execute();

                            // out.println(ff.getPath());
                        } catch (SQLException e) {
                            out.print("Failed due to " + e);
                        }

                    } else {

                        //Triple DES algorithm using here
                        String o1 = new TripleDESTest()._encrypt(str1, "SecretKey");
                        String o2 = new TripleDESTest()._encrypt(str2, "SecretKey");
                        String o3 = new TripleDESTest()._encrypt(str3, "SecretKey");
                        String o4 = new TripleDESTest()._encrypt(str4, "SecretKey");
                        String o5 = new TripleDESTest()._encrypt(str5, "SecretKey");
                        String o6 = new TripleDESTest()._encrypt(str6, "SecretKey");
                        String o7 = new TripleDESTest()._encrypt(str7, "SecretKey");
                        String o8 = new TripleDESTest()._encrypt(str8, "SecretKey");

                        try {
                    %>


                    <table>


                        <tr>
                            <td>File Name</td>
                            <td><input type="text" name="fname" value="<%=filename%>" /></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr>
                            <td>File Type</td>
                            <td><input type="text" name="lname" value="<%=extension%>"  /></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr>
                            <td>File Size</td>
                            <td><input type="text" name="email" value="<%=size%>" /></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr><td><br></td></tr>

                        <tr>
                            <td>File Content</td>
                            <td><textarea rows="15"  cols="50">
                                    <%=o1 + o2 + o3 + o4 + o5%>
                                </textarea></td>
                        </tr>
                        <tr><td><br></td></tr>

                        <tr>
                            <td></td>
                            <td> <input type="submit" value="            Submit           " style=" font-weight:900;border:2px solid #3a3a3a"/></td>
                        </tr>




                        <%
                                    String content = str1 + str2 + str3 + str4 + str5 + str6 + str7 + str8;

                                    psmt.setString(1, filename);
                                    psmt.setString(2, size);
                                    psmt.setString(3, extension);
                                    psmt.setString(4, o1);
                                    psmt.setString(5, o2);
                                    psmt.setString(6, o3);
                                    psmt.setString(7, o4);
                                    psmt.setString(8, o5);
                                    psmt.setString(9, o6);
                                    psmt.setString(10, o7);
                                    psmt.setString(11, o8);
                                    psmt.setString(12, "Triple DES");
                                    psmt.setString(13, content);
                                    psmt.setString(14, user);

                                    // pass the user name or id 
                                    boolean sss = psmt.execute();

                                    // out.println(ff.getPath());
                                } catch (SQLException e) {
                                    out.print("Failed due to " + e);
                                }

                            }
                        %>

                        </td>
                        </tr>

                    </table>
            </main>
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
                    window.location.href = "uploadfile.html";
                }
            </script>
            <!-- ... (remaining HTML code) ... -->
        </form>

</body>
</html>
