<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pharmacy</title>
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

            div.gallery {
                margin: 7px;
                border: 1px solid #ccc;
                float: left;
                width: 225px;
                height: 215px;
                font-weight:700; 
                font-size: 17px;


                box-shadow: 6px 2px 16px 0px rgba(136, 165, 191, 0.48) , -6px -2px 16px 0px rgba(255, 255, 255, 0.8);
            }

            div.gallery:hover {
                border: 2px solid #777;
                border-radius:15px;
            }

            div.gallery img {
                width: 100%;
                height: auto;
            }

            div.desc {
                padding: 15px;
                text-align: center;
            }
            div.color {
                color: #428bcablack;
            }

        </style>
    </head>

    <body>  



        <div class="title">
            <h2 style=" text-align: center;font-size:25px;">Online Pharmacy</h2></div>

        <!-- Personal Information -->

        <%

            String user = (String) session.getAttribute("user");
            String email = (String) session.getAttribute("email");
        %>

        <%
            String id;
            String productname;
            String category;
            String price;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");
                Statement st = connection.createStatement();
                ResultSet rst = st.executeQuery("select * from product");
        %>


        <%
            while (rst.next()) {
                Blob image = rst.getBlob("productimage");
                byte[] imgData = null;
                imgData = image.getBytes(1, (int) image.length());
                //String answer = rst.getString("Answers");

                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                id = rst.getString(1);
                category = rst.getString(2);
                productname = rst.getString(3);
                price = rst.getString(4);
                session.setAttribute("product", productname);
                session.setAttribute("price", price);

        %>

        <div class="gallery">

            <a href="Payment.jsp?id=<%=id%>">
                <img src="data:image/gif;base64,<%= imgDataBase64%> " width="250" height="150" alt="">
            </a>
            <div class="desc">
                <h2><%=productname%></h2>

                <p>Price:<%=price%>/-</p>   
            </div>
            <div class="color">

            </div>
        </div>



        <%

                }
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>

    </body>

</html>
