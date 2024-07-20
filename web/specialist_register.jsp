<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Specialist Registration Form</title>
        <link rel="icon" href="images/icon.png">
        <style>
            body {
                background-image: url(images/appp.jpg);
                background-size: cover;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
                height: 110vh;
                overflow: auto;
            }


            form {
                background-image: url(images/appp.jpg);
                background-size: cover;
                max-width: 500px;
                margin: auto;
                padding: 50px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }

            label {
                display: block;
                margin-bottom: 8px;
                color: black;
                color: bold;
            }

            input,
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid ;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button {
                background-color: #4caf50;
                color: white;
                padding:  15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                size: 50;
                width: 100%;
            }

            button:hover {
                background-color: #45a049;
            }
            .title{
                text-align: center;
            }
        </style>
    </head>

    <body>  


        <form method="post" action="UPLOADServlet" enctype="multipart/form-data">

            <div class="title">
                <h2>Specialist Registration Form</h2></div>

            <!-- Personal Information -->
            <label for="Name">Name:</label>
            <input type="text" id="Name" name="name" required>


            <label for="password">Password:</label>
            <input type="text" id="pass" name="pass" required>

            <label for="conformpassword">Confirm Password:</label>
            <input type="text" id="cpass" name="cpass" required>


            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number:</label>
            <input type="number" id="phone" name="mno" required>

            <label for="address">Address:</label>
            <input type="textarea" id="addre" name="addre" rows="4" required></br></br>



            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <!-- Contact Information -->



            <label for="specialist">Specialist</label>
            <input type="text" id="specialist" name="specialist" required>


            <label for="photo">Photo</label>
            <input type="file" name="photo" requried>


            <!-- Submit Button -->
            <button type="submit">Submit</button>

            <p>Already Have An Account<a href="specialist_login.jsp"> Login</a></p>
        </form>
    </body>

</html>
