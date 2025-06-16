package roomModule;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author irfah
 */ 

import java.sql.Connection;
import java.sql.DriverManager;

public class database {
    
    private static final String URL = System.getenv("jdbc:mysql://localhost:3306/library_booking");
    private static final String USER = System.getenv("root");
    private static final String PASS = System.getenv("admin");

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}


