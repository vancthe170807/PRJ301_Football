package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        // Students: You are allowed to edit user, pass, url variables to fit
        // your system configuration
        // You can also add more methods for Database Interaction tasks.
        // But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext ,
        // where StudentDBContext is located in dal package,
        try {
            String user = "sa";
            String pass = "123456";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=football_rental";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("Connection successful!");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Connection failed!");
        }
    }

    public static void main(String[] args) {
        new DBContext();
    }
}
