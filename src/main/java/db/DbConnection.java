package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	 private static Connection  con=null;
	
	public static Connection getConnection() {
		
		try {
			String URL = "jdbc:mysql://localhost:3306/youtube";
			String USER = "root";
			String PASS = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USER, PASS);
			if(con!=null) {
				System.out.println("Connected");
				return con;
			}else {
				System.out.println("Something went wrong...");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
