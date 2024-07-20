package doctor;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/health";
    private String dbUser = "root";
    private String dbPass = "root";
    private String returnPage = "/doctor_registration_success.jsp"; // Change this to your desired return page

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // gets values of text fields
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String email = request.getParameter("email");
        String mno = request.getParameter("mno");
        String addre = request.getParameter("addre");
        String dob = request.getParameter("dob");
        String specialist = request.getParameter("specialist");

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        Connection conn = null; // connection to the database
        String message = null; // message will be sent back to client

        try {
            // connects to the database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String sql = "INSERT INTO doctor(name, pass, cpass, email, mno, addre, dob, specialist, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, pass);
            statement.setString(3, cpass);
            statement.setString(4, email);
            statement.setString(5, mno);
            statement.setString(6, addre);
            statement.setString(7, dob);
            statement.setString(8, specialist);

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(9, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
                // Redirect to success page
                response.sendRedirect(request.getContextPath() + returnPage);
                return;
            } else {
                message = "Failed to upload file into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
            System.out.println(ex);
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope for further handling
            request.setAttribute("Message", message);
            // forwards to the form page with an error message or handles response appropriately
            request.getRequestDispatcher("/doctorlogin.html").forward(request, response);
        }
    }
}
