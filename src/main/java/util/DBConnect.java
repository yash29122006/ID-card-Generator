package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static final String URL =
		    "jdbc:mysql://id-card-generator-v1-godyash56-25e9.c.aivencloud.com:15766/defaultdb?sslMode=REQUIRED";

		private static final String USER = System.getenv("DB_USER");
		private static final String PASSWORD = System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("DB is Connected");

            return con;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}