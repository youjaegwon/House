package com.House.Project;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleConnectionTest {

	    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	    private static final String URL = "jdbc:oracle:thin:@172.16.3.15:1521:xe";
	    private static final String USER = "scott";
	    private static final String PASSWORD = "tiger";

	    @Test
	    public void testConnection() throws Exception {
	        Class.forName(DRIVER);
	        try(Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
	            System.out.println(connection);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
