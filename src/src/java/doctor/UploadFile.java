package doctor;

import DB.MyConnection;

import com.oreilly.servlet.MultipartRequest;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lib
 */
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})

public class UploadFile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session1 = request.getSession(false);
        String patient = (String) session1.getAttribute("patient");
        HttpSession session2 = request.getSession(false);
        String doctor_name = (String) session2.getAttribute("doctor");

        String rtempfile = File.createTempFile("temp", "1").getParent();

        MultipartRequest multi = new MultipartRequest(request, rtempfile, 15 * 1024 * 1024);     // maximum size 15 MB
        Enumeration files = multi.getFileNames();

        String st = "insert into uploadfile(filename, filesize, extension, time, content, uname, status, donctor_name, key1    ) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement psmt = MyConnection.getConnection().prepareStatement(st);

        String name = "";
        String fileExtesion = "";
        File ff = null;
        FileInputStream fin = null;
        double kilobytes = 0.0;
        double gigabytes = 0.0;
        String filename = null, extension = null;
        String str1 = null, str2 = null, str3 = null, str4 = null, str5 = null, str6 = null, str7 = null, str8 = null;
        long size = 0l;
        int time1 = 0;
        while (files.hasMoreElements()) {
            name = (String) files.nextElement();
            ff = multi.getFile(name);

            String fname = ff.getName();

            HttpSession session = request.getSession();
            session.setAttribute("filename", fname);

            fileExtesion = ff.getName().substring(ff.getName().lastIndexOf("."));

            boolean fileAllowed = fileExtesion.equalsIgnoreCase(".docx")
                    || fileExtesion.equalsIgnoreCase(".pdf");

            if (ff.exists()) {

                double bytes = ff.length();

                kilobytes = (bytes / 1024);

                double megabytes = (kilobytes / 1024);
                gigabytes = (megabytes / 1024);

                System.out.println("bytes : " + bytes);

            } else {
                System.out.println("File does not exists!");
            }

            filename = ff.getName();

            session.setAttribute("filename", filename);

            extension = ff.getName().substring(ff.getName().lastIndexOf("."));
            session.setAttribute("extension", extension);

            size = ff.length();
            session.setAttribute("size", size);

            String path = ff.getPath();

            FileInputStream fstream = new FileInputStream(path);
            DataInputStream in = new DataInputStream(fstream);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String strLine;
            java.util.ArrayList<String> list = new java.util.ArrayList<String>();

            while ((strLine = br.readLine()) != null) {
                list.add(strLine);
            }

            //here we using time 
            Calendar now = Calendar.getInstance();
            int hours = now.get(Calendar.HOUR);
            int m = now.get(Calendar.MINUTE);
            int s = now.get(Calendar.SECOND);
            int mm = now.get(Calendar.MILLISECOND);

            time1 = hours + m + s;

            str1 = list.get(0) + list.get(1);
            str2 = list.get(2) + list.get(3);
            str3 = list.get(4) + list.get(5);
            str4 = list.get(6) + list.get(7);
            str5 = list.get(8) + list.get(9);
            str6 = list.get(10) + list.get(11);
            str7 = list.get(12) + list.get(13);
            str8 = list.get(14) + list.get(15);

            session.setAttribute("str1", str1);
            session.setAttribute("str2", str2);
            session.setAttribute("str3", str3);
            session.setAttribute("str4", str4);
            session.setAttribute("str5", str5);
            session.setAttribute("str6", str6);
            session.setAttribute("str7", str7);
            session.setAttribute("str8", str8);

            String content = str1 + str2 + str3 + str4 + str5 + str6 + str7 + str8;
            session.setAttribute("content", content);
            //examples
            out.println("<br>");
            //  out.println("the first line is: " + str1);
            out.println("<br>");
            //  out.println("the seocnd line is: " + list.get(1));
            out.println("<br>");
            // out.println("the third line is: " + list.get(2));
            // here splitting the 16 lines file 
            if ((ff != null) && fileAllowed) {
                try {
                    fin = new FileInputStream(ff);

                    psmt.setBinaryStream(5, (InputStream) fin, (int) (ff.length()));
                    psmt.setString(1, filename);
                    psmt.setLong(2, size);
                    psmt.setString(3, extension);

                    psmt.setInt(4, time1);
                    psmt.setString(6, patient);
                    psmt.setString(7, " Prescription Updated");
                    psmt.setString(8, doctor_name);
                    psmt.setString(9, "d11o2");
                    // pass the user name or id 
                    boolean sss = psmt.execute();

                    RequestDispatcher rd = request.getRequestDispatcher("doctor_Encryption.jsp");
                    rd.forward(request, response);
                    // out.println(ff.getPath());
                } catch (SQLException e) {
                    out.print("Failed due to " + e);
                } finally {
                    // next statement is must otherwise file will not be deleted from the temp as fin using f.
                    // its necessary to put outside otherwise at the time of exception file will not be closed.
                    fin.close();
                    ff.delete();
                }
            } else {
                out.print("Please select the correct file...");
            }// end of if and else
        }// end of while

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
        } catch (SQLException ex) {
            Logger.getLogger(UploadFile.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(UploadFile.class.getName()).log(Level.SEVERE, null, ex);
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
