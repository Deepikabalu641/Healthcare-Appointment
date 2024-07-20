package DB;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Deepak
 */
public class MyConnection {

    static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "root", "root");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }

    public void encrypt(String filename, String size, String extension, String str1, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String content) {
        try {

            String st = "insert into uploadfile(filename,filesize,extension,file1,file2,file3,file4,file5,file6,file7,file8,content) values (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement psmt = MyConnection.getConnection().prepareStatement(st);

            psmt.setString(1, filename);
            psmt.setString(2, size);
            psmt.setString(3, extension);
            psmt.setString(4, str1);
            psmt.setString(5, str2);
            psmt.setString(6, str3);
            psmt.setString(7, str4);
            psmt.setString(8, str5);
            psmt.setString(9, str6);
            psmt.setString(10, str7);
            psmt.setString(11, str8);
            psmt.setString(12, content);

            // pass the user name or id 
            boolean sss = psmt.execute();

            // RequestDispatcher rd = request.getRequestDispatcher("EncryptFile.jsp");
            // rd.forward(request, response);
            // out.println(ff.getPath());
        } catch (SQLException e) {
            System.out.print("Failed due to " + e);
        }
    }

    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
        System.out.println("in funcation");
        ResultSet rs = null;
        if (con == null) {
            getConnection();
        }
        try {
            rs = con.createStatement().executeQuery(SqlQueryString);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public static void main(String args[]) {
        getResultFromSqlQuery("select * from documents");
        System.out.println("con done" + (con == null));
    }
}
