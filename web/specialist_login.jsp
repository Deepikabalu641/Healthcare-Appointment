<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Specialist Sign In</title>
    <link rel="icon" href="images/icon.png">
    <link rel="stylesheet" href="styles.css"> <!-- Link to your external CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 200px;
            background-image: url("images/special2.jpg");
            background-size: cover;
            border-radius: 40px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 18px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            background-image: url("images/special2.jpg");
            filter:blur;
            background-size: cover;
            text-align: center; /* Align the form content to the center */
        }

        h2 {
            margin-bottom: 20px; /* Increase space between heading and form elements */
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: black;
            text-align: left; /* Align labels to the left */
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: blue;
            color: #fff;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 4px;
            cursor: pointer;
        }

        .forgot-password {
            text-align: right;
            margin-top: 10px;
            color: red;
        }

        .nav-buttom {
            text-align: right;
        }
    </style>
</head>

<body>

    <form id="loginForm" action="specialist_getlogin.jsp" method="post">
        <header>
            <h2>Specialist Sign in</h2>
        </header>

        <div class="form-group">
            <label for="DoctorName">Specialist Email</label>
            <input type="text" id="email" name="email" placeholder="Your Email" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="pass" placeholder="Your password" required>
        </div>

        <div class="form-group">
            <input type="submit" value="Login">
            <p>Don't Have An Account <a href="specialist_register.jsp">Sign Up</a></p>
        </div>

    </form>
</body>

</html>
