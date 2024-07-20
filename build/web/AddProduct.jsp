<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Patient Registration Form</title>
        <link rel="icon" href="images/icon.png">
        <style>
            body {
                background-image: url(images/special1.jpeg);
                background-size: cover;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;

                overflow: auto;
            }


            form {
                background-image: url(images/special1.jpeg);
                background-size: cover;
                max-width: 600px;
                margin: auto;
                padding: 50px;
                border-radius: 2px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }

            label {
                display: block;
                margin-bottom: 8px;
                color: black;
                color: bold;
                font-weight: 800;

            }

            input,
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid ;
                border-radius: 6px;
                box-sizing: border-box;
                font-weight: 800;

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


        <form method="post" action="AddProduct" enctype="multipart/form-data">

            <div class="title">
                <h2>Order Medicine Form</h2></div>

            <!-- Personal Information -->

            <%

                String user = (String) session.getAttribute("user");
                String email = (String) session.getAttribute("email");
            %>

            <center>
                <table border="0" width="55%" cellpadding="3">
                  
                    <tbody>
                        <tr>
                            <td>Product Type</td>
                            <td><input type="text" name="category" value="" /></td>
                        </tr>
                        <tr>
                            <td>Product Name</td>
                            <td><input type="text" name="pnmae" value="" /></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price" value="" /></td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="number" name="quantity" value="" /></td>
                        </tr>
                        <tr>
                            <td>Product Image</td>
                            <td><input type="file" name="file" value="" /></td>
                        </tr>


                        <tr>
                            <td><input type="submit" value="Add Product" style="width:155px"></td>
                            <td><input type="reset" value="Reset" style="width:155px" /></td>
                        </tr>

                    </tbody>
                </table>
            </center>
        </form>
    </body>

</html>
