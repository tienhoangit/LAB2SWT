package java.dal;        

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


public DBContext() {
    try {
        // Lấy thông tin từ biến môi trường
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");
        String url = System.getenv("DB_URL");

        // Đảm bảo rằng biến môi trường đã được thiết lập
        if (user == null || pass == null || url == null) {
            throw new IllegalArgumentException("Database credentials are not set in environment variables.");
        }

        // Tải driver và kết nối
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(url, user, pass);

    } catch (ClassNotFoundException | SQLException | IllegalArgumentException ex) {
        Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
}

