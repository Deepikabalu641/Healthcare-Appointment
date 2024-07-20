package Cloud;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addUserRegisteration", urlPatterns = {"/addUserRegisteration"})
public class addUserRegisteration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("txtUsername");
        String emailId = request.getParameter("txtEmailid");
        String password = request.getParameter("txtPassword");
        String cpassword = request.getParameter("txtCPassword");
        String mobileno = request.getParameter("txtMobileno");
        String dob = request.getParameter("txtDOB");
        String gender = request.getParameter("sex");

        if (userName.isEmpty()) {
            request.setAttribute("username", "Enter uername");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);

        } else if (emailId.isEmpty()) {
            request.setAttribute("emailid", "Enter Email Id ");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        } else if (password.isEmpty()) {
            request.setAttribute("password", "Enter password ");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        } else if (password.isEmpty()) {
            request.setAttribute("cpassword", "Enter Confrim password ");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        } else if (mobileno.isEmpty()) {
            request.setAttribute("mobileno", "Enter Mobile No ");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        } else if (dob.isEmpty()) {
            request.setAttribute("dob", "Enter Date of Birth");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        } else if (gender.isEmpty()) {
            request.setAttribute("gender", "Enter Gender");
            RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
            rd.forward(request, response);
        }

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sharedata",
                    "root", "root");
            Statement st = con.createStatement();
            //ResultSet rs;
            int i = st.executeUpdate("insert into register values (null,'" + userName + "'  ,'" + emailId + "'  ,'" + password + "'  ,'" + cpassword + "'  ,'" + mobileno + "'  ,'" + dob + "','" + gender + "', CURDATE())");

            //session.setAttribute("userid", user);
            if (i > 0) {
                request.setAttribute("register", "User Registration successful..");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {

            }

        } catch (Exception ex) {
            out.println(ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addUserRegisteration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addUserRegisteration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addUserRegisteration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addUserRegisteration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
